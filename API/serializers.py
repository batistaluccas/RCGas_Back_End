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
    bairro_nome = serializers.SerializerMethodField()
    class Meta:
        model = Cliente
        fields = ['id_cliente', 'nome_cliente', 'telefone_cliente', 'rua_cliente', 'numero_cliente','id_bairro', 'bairro_nome']
    
    def get_bairro_nome(self, obj):
        return obj.id_bairro.nome_bairro if obj.id_bairro else None
    
class TipoPagamentoSerializer(serializers.ModelSerializer):
    class Meta:
        model = TipoPagamento
        fields = '__all__'
    
class ItemNotaVendaSerializer(serializers.ModelSerializer):
    total_item = serializers.SerializerMethodField()
    nome_produto = serializers.SerializerMethodField()
    desc_produto = serializers.SerializerMethodField()
    imagem_produto = serializers.SerializerMethodField()
    preco_unitario = serializers.SerializerMethodField()

    class Meta:
        model = ItemNotaVenda
        fields = ['id_nota_venda', 'id_produto', 'nome_produto',"desc_produto", "preco_unitario", 'quantidade_item', 'total_item', 'imagem_produto']

    def get_total_item(self, obj):
        return obj.quantidade_item * obj.id_produto.preco_produto
    
    def get_nome_produto(self, obj):
        return obj.id_produto.nome_produto
    
    def get_imagem_produto(self, obj):
        return obj.id_produto.imagem_produto
    
    def get_preco_unitario(self, obj):
        return obj.id_produto.preco_produto
    
    def get_desc_produto(self, obj):
        return obj.id_produto.desc_produto
    
class NotaVendaSerializer(serializers.ModelSerializer):


    frete_bairro = serializers.SerializerMethodField()
    nome_bairro = serializers.SerializerMethodField()
    nome_cliente = serializers.SerializerMethodField()
    telefone_cliente = serializers.SerializerMethodField()
    desc_tipo = serializers.SerializerMethodField()

    class Meta:
        model = NotaVenda
        fields =    ["id_nota_venda",
                    "data_nota_venda",
                    "desc_venda",
                    "id_cliente",
                    "nome_cliente",
                    "telefone_cliente",
                    "id_tipo_pagamento",
                    "desc_tipo",
                    "nome_bairro",
                    "frete_bairro",
                    "valor_total"]

    

    def get_frete_bairro(self, obj):
        if obj.id_cliente and obj.id_cliente.id_bairro:
            return obj.id_cliente.id_bairro.frete_bairro
        return None   
    
    def get_nome_cliente(self, obj):
        return obj.id_cliente.nome_cliente
    
    def get_itens(self, obj):
        # Serializando os itens relacionados ao objeto NotaVenda
        return ItemNotaVendaSerializer(obj.itemnotavenda_set.all(), many=True).data
    
    def get_nome_bairro(self, obj):
        return obj.id_cliente.id_bairro.nome_bairro
    
    def get_desc_tipo(self, obj):
        return obj.id_tipo_pagamento.desc_tipo
    
    def get_telefone_cliente(self, obj):
        return obj.id_cliente.telefone_cliente
