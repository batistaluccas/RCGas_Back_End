# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class Bairro(models.Model):
    id_bairro = models.AutoField(primary_key=True)
    nome_bairro = models.CharField(max_length=100)
    frete_bairro = models.FloatField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'bairro'

    def __str__(self):
        return self.nome_bairro
        

class Cliente(models.Model):
    id_cliente = models.AutoField(primary_key=True)
    nome_cliente = models.CharField(max_length=100)
    telefone_cliente = models.CharField(max_length=100)
    rua_cliente = models.CharField(max_length=100, blank=True, null=True)
    numero_cliente = models.CharField(max_length=100, blank=True, null=True)
    id_bairro = models.ForeignKey('Bairro', models.DO_NOTHING, db_column='id_bairro', blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'cliente'

    def __str__(self):
        return self.nome_cliente
