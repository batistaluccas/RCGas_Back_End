
from django.utils import timezone
from rest_framework.views import APIView
from rest_framework import viewsets
from rest_framework.decorators import action
from rest_framework.response import Response
from rest_framework import status
from .serializers import ProdutoSerializer, ClienteSerializer, BairroSerializer, TipoPagamentoSerializer, NotaVendaSerializer, ItemNotaVendaSerializer
from produto.models import Produto
from cliente.models import Cliente, Bairro
from venda.models import TipoPagamento, NotaVenda, ItemNotaVenda

# API/views.py

from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
import json
from .nfe import emitir_nfe_service  # Você pode criar um módulo para a lógica de emissão


@csrf_exempt  # Para desabilitar a proteção CSRF, se necessário
def emitir_nfe(request):
    if request.method == 'POST':
        dados_nfe = request.POST  # Ou usar request.body para dados JSON
        try:
            resultado = emitir_nfe_service(dados_nfe)  # Implementar essa função
            return JsonResponse({'status': 'success', 'data': resultado})
        except Exception as e:
            return JsonResponse({'status': 'error', 'message': str(e)}, status=500)

    return JsonResponse({'status': 'error', 'message': 'Método não permitido'}, status=405)


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

# incluso 02/10/2024
class VendasPeriodoViewSet(viewsets.ViewSet):

    @action(detail=False, methods=['post'], url_path='')
    def listar_vendas_periodo(self, request):
        # Passo 1: Obtém as datas do corpo da requisição
        data_inicio = request.data.get('data_inicio')
        data_fim = request.data.get('data_fim')

        # Passo 2: Valida se as datas foram fornecidas
        if not data_inicio or not data_fim:
            return Response({'error': 'As datas de início e fim são obrigatórias.'}, status=400)

        try:
           # Passo 3: Converte as datas para o formato adequado com hora
            data_inicio = timezone.datetime.strptime(data_inicio, '%Y-%m-%d')
            data_fim = timezone.datetime.strptime(data_fim, '%Y-%m-%d')

            # Passo 3.1: Torna as datas "naive" (sem fuso horário)
            data_inicio = timezone.make_aware(data_inicio, timezone.get_current_timezone())
            data_fim = timezone.make_aware(data_fim, timezone.get_current_timezone())
        except ValueError:
            return Response({'error': 'As datas devem estar no formato YYYY-MM-DD.'}, status=400)


        # Passo 5: Filtra as vendas entre as duas datas
        vendas = NotaVenda.objects.filter(data_nota_venda__range=[data_inicio, data_fim])

        # Passo 6: Serializa a lista de vendas
        serializer = NotaVendaSerializer(vendas, many=True)

        return Response(serializer.data)

# até aqui
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


