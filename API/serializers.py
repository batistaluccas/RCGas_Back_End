from rest_framework import serializers
from produto.models import Produto
from cliente.models import Cliente, Bairro
from venda.models import TipoPagamento, NotaVenda, ItemNotaVenda

class ProdutoSerializer(serializers.ModelSerializer):
    class Meta:
        model = Produto
        fields = '__all__'  # Inclui todos os campos do modelo Produto

class BairroSerializer(serializers.ModelSerializer):
    class Meta:
        model = Bairro
        fields = '__all__'

class ClienteSerializer(serializers.ModelSerializer):
    class Meta:
        model = Cliente
        fields = '__all__'

class TipoPagamentoSerializer(serializers.ModelSerializer):
    class Meta:
        model = TipoPagamento
        fields = '__all__'

class ItemNotaVendaSerializer(serializers.ModelSerializer):
    class Meta:
        model = ItemNotaVenda
        fields = '__all__'  # Inclui todos os campos do modelo


class NotaVendaSerializer(serializers.ModelSerializer):
    class Meta:
        model = NotaVenda
        fields = '__all__'  # Inclui todos os campos do modelo