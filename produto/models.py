# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class Produto(models.Model):
    id_produto = models.AutoField(primary_key=True)
    nome_produto = models.CharField(max_length=100)
    desc_produto = models.CharField(max_length=100, blank=True, null=True)
    quantidade_disponivel = models.IntegerField(blank=True, null=True)
    preco_produto = models.FloatField(blank=True, null=True)
    nivel_abastecimento = models.IntegerField(blank=True, null=True)
    imagem_produto = models.CharField(max_length=100, blank=True, null=True)
    ncm = models.CharField(max_length=20, blank=True, null=True)
    cfop = models.CharField(max_length=20, blank=True, null=True)
    unidade_comercial = models.CharField(max_length=20, blank=True, null=True)
    icms_modalidade = models.CharField(max_length=20, blank=True, null=True)
    icms_csosn = models.CharField(max_length=20, blank=True, null=True)
    pis_modalidade = models.CharField(max_length=20, blank=True, null=True)
    cofins_modalidade = models.CharField(max_length=20, blank=True, null=True)

    def __str__(self):
        return self.nome_produto

    class Meta:
        managed = False
        db_table = 'produto'

        
