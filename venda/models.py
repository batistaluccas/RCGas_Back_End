
from django.db import models
from cliente.models import Cliente, Bairro
from produto.models import Produto
from django.utils import timezone


from django.db import models

class Emitente(models.Model):
    id_emitente = models.AutoField(primary_key=True)
    cnpj = models.CharField(max_length=30, unique=True)
    codigo_de_regime_tributario = models.IntegerField()
    inscricao_estadual = models.CharField(max_length=30, blank=True, null=True)
    inscricao_municipal = models.CharField(max_length=30, blank=True, null=True)
    cnae_fiscal = models.CharField(max_length=40, blank=True, null=True)
    endereco_logradouro = models.CharField(max_length=100)
    endereco_numero = models.CharField(max_length=20)
    endereco_bairro = models.IntegerField()
    endereco_municipio = models.CharField(max_length=100)
    endereco_uf = models.CharField(max_length=20)
    endereco_cep = models.CharField(max_length=30)
    endereco_pais = models.CharField(max_length=30)
    nome_fantasia = models.CharField(max_length=100, blank=True, null=True)
    razao_social = models.CharField(max_length=100, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'emitente'  

    def __str__(self):
        return f'{self.cnpj} - {self.endereco_logradouro}, {self.endereco_numero} - {self.endereco_municipio}/{self.endereco_uf}'


class TipoPagamento(models.Model):
    id_tipo_pagamento = models.AutoField(primary_key=True)
    desc_tipo = models.CharField(max_length=100)

    def __str__(self):
        return self.desc_tipo

    class Meta:
        managed = False
        db_table = 'tipo_pagamento'

class NotaVenda(models.Model):
    id_nota_venda = models.AutoField(primary_key=True)
    valor_total = models.FloatField()
    data_nota_venda = models.DateTimeField(default=timezone.now)  # Alterado para DateTimeField
    id_cliente = models.ForeignKey(Cliente, models.DO_NOTHING, db_column='id_cliente', blank=True, null=True)
    id_tipo_pagamento = models.ForeignKey(TipoPagamento, models.DO_NOTHING, db_column='id_tipo_pagamento')
    id_emitente = models.ForeignKey(Emitente, models.DO_NOTHING, db_column='id_emitente', blank=True, null=True)
    id_bairro_entrega = models.ForeignKey(Bairro, models.DO_NOTHING, db_column='id_bairro_entrega', blank=True, null=True)
    rua_entrega = models.CharField(max_length=255, blank=True, null=True)
    numero_entrega = models.CharField(max_length=10, blank=True, null=True)
    telefone_entrega = models.CharField(max_length=15, blank=True, null=True)


    def __str__(self):
        return str(self.id_nota_venda)

    class Meta:
        managed = False
        db_table = 'nota_venda'





class ItemNotaVenda(models.Model):
    id_item_da_nota = models.AutoField(primary_key=True)
    id_nota_venda = models.ForeignKey(NotaVenda, models.DO_NOTHING, db_column='id_nota_venda', blank=True, null=True)
    id_produto = models.ForeignKey(Produto, models.DO_NOTHING, db_column='id_produto', blank=True, null=True)
    quantidade_item = models.IntegerField()

    def __str__(self):
        return f"{self.id_nota_venda} - {self.id_produto}"

    class Meta:
        managed = False
        db_table = 'item_nota_venda'


