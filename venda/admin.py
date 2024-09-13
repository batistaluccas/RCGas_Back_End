from django.contrib import admin
from .models import NotaVenda, ItemNotaVenda, TipoPagamento



admin.site.register(ItemNotaVenda)
admin.site.register(NotaVenda)
admin.site.register(TipoPagamento)
