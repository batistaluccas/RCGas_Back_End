from django.utils import timezone
from django.db.models import Sum
from rest_framework.views import APIView
from rest_framework import viewsets
from rest_framework.decorators import action
from rest_framework.response import Response
from rest_framework import status
from .serializers import ProdutoSerializer, ClienteSerializer, BairroSerializer, TipoPagamentoSerializer, NotaVendaSerializer, ItemNotaVendaSerializer
from produto.models import Produto
from cliente.models import Cliente, Bairro
from venda.models import TipoPagamento, NotaVenda, ItemNotaVenda

class ProdutoViewSet(viewsets.ModelViewSet):
    queryset = Produto.objects.all()  
    serializer_class = ProdutoSerializer  

class BairroViewSet(viewsets.ModelViewSet):
    queryset = Bairro.objects.all()
    serializer_class = BairroSerializer

class ClienteViewSet(viewsets.ModelViewSet):
    queryset = Cliente.objects.all()
    serializer_class = ClienteSerializer

class TipoPagamentoViewSet(viewsets.ModelViewSet):
    queryset = TipoPagamento.objects.all()
    serializer_class = TipoPagamentoSerializer

class NotaVendaViewSet(viewsets.ModelViewSet):
    queryset = NotaVenda.objects.all()
    serializer_class = NotaVendaSerializer

class ItemNotaVendaViewSet(viewsets.ModelViewSet):
    queryset = ItemNotaVenda.objects.all()
    serializer_class = ItemNotaVendaSerializer

class ItemDaNotaList(APIView):
    def post(self, request, *args, **kwargs):
        id_nota_venda = request.data.get('id_nota_venda', None)
        if id_nota_venda is not None:
            itens = ItemNotaVenda.objects.filter(id_nota_venda=id_nota_venda)
            serializer = ItemNotaVendaSerializer(itens, many=True)
            return Response(serializer.data)
        else:
            return Response({"detail": "id_nota_venda is required in request body."}, status=status.HTTP_400_BAD_REQUEST)


class BalancoDiarioViewSet(viewsets.ModelViewSet):
    serializer_class = NotaVendaSerializer
    def get_queryset(self):
        today = timezone.now().date()  # Passo 1
        return NotaVenda.objects.filter(data_nota_venda=today)
    
    @action(detail=False, methods=['get'], url_path='balanco-diario')
    def soma_hoje(self, request):
        today = timezone.now().date()
        soma = NotaVenda.objects.filter(data_nota_venda=today).aggregate(parcial=Sum('valor_total'))

        return Response({'soma': soma['parcial'] or 0})
    

class RegistrarVendaView(viewsets.ModelViewSet):
    queryset = NotaVenda.objects.all()
    serializer_class = NotaVendaSerializer

    def create(self, request, *args, **kwargs):
        itens = request.data.get('itens',[])
        valor_total = sum(float(item.get('quantidade_item', 0)) * float(item.get('preco_unitario', 0)) for item in itens)
        # Filtrar os dados que serão usados pelo serializer
        data = {
            'valor_total': valor_total,
            'data_nota_venda': request.data.get('data_nota_venda'),
            'desc_venda': request.data.get('desc_venda'),
            'id_cliente': request.data.get('id_cliente'),
            'id_tipo_pagamento': request.data.get('id_tipo_pagamento')
        }

        serializer = self.get_serializer(data=data)
        serializer.is_valid(raise_exception=True)
        nota_venda = self.perform_create(serializer)

        
        for item in itens:
            quantidade_item = item.get('quantidade_item', 0),
            preco_produto = item.get('preco_unitario', 0)
            item['id_nota_venda'] = nota_venda.id_nota_venda
            item['total_item'] = quantidade_item * preco_produto
            item_serializer = ItemNotaVendaSerializer(data=item)
            item_serializer.is_valid(raise_exception=True)
            item_serializer.save()

        headers = self.get_success_headers(serializer.data)
        return Response(serializer.data, status=status.HTTP_201_CREATED, headers=headers)

    def perform_create(self, serializer):
        # Salva a instância de NotaVenda e retorna a instância criada
        return serializer.save()


