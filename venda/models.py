
from django.db import models
from cliente.models import Cliente
from produto.models import Produto

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
    data_nota_venda = models.DateField()
    id_cliente = models.ForeignKey(Cliente, models.DO_NOTHING, db_column='id_cliente', blank=True, null=True)
    id_tipo_pagamento = models.ForeignKey('TipoPagamento', models.DO_NOTHING, db_column='id_tipo_pagamento')
    desc_venda = models.CharField(max_length=100)

    def __str__(self):
        return str(self.id_nota_venda)

    class Meta:
        managed = False
        db_table = 'nota_venda'

class ItemNotaVenda(models.Model):
    id_nota_venda = models.ForeignKey('NotaVenda', models.DO_NOTHING, db_column='id_nota_venda', blank=True, null=True)
    id_produto = models.ForeignKey(Produto, models.DO_NOTHING, db_column='id_produto', blank=True, null=True)
    quantidade_item = models.IntegerField()

    def __str__(self):
        return str(self.id_nota_venda)

    class Meta:
        managed = False
        db_table = 'item_nota_venda'
        unique_together = ('id_produto', 'id_nota_venda')



class ItemNotaVenda(models.Model):
    id_item_da_nota = models.AutoField(primary_key=True)
    id_nota_venda = models.ForeignKey('NotaVenda', models.DO_NOTHING, db_column='id_nota_venda', blank=True, null=True)
    id_produto = models.ForeignKey(Produto, models.DO_NOTHING, db_column='id_produto', blank=True, null=True)
    quantidade_item = models.IntegerField()

    def __str__(self):
        return f"{self.id_nota_venda} - {self.id_produto}"

    class Meta:
        managed = False
        db_table = 'item_nota_venda'
        

