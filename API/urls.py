from django.contrib import admin
from django.urls import path, include
from .views import Produto
from rest_framework.routers import DefaultRouter
from .views import ProdutoViewSet, ClienteViewSet, BairroViewSet,TipoPagamentoViewSet,ItemDaNotaList, RegistrarVendaView, ItemNotaVendaViewSet, NotaVendaViewSet, BalancoDiarioViewSet

# Cria um roteador e registra o ViewSet
router = DefaultRouter()
router.register(r'produtos', ProdutoViewSet, basename='produto')
router.register(r'clientes', ClienteViewSet, basename='cliente')
router.register(r'bairros', BairroViewSet, basename='bairro')
router.register(r'tipos-pagamento', TipoPagamentoViewSet, basename='tipo-pagamento')
router.register(r'notas-venda', NotaVendaViewSet, basename='notas-venda')
router.register(r'itens-nota-venda', ItemNotaVendaViewSet, basename='itens-nota-venda')
router.register(r'balanco-diario', BalancoDiarioViewSet, basename='balanco-diario')
router.register(r'registrar-venda', RegistrarVendaView, basename='registrar-venda')



urlpatterns = [
    path('itens-da-nota/', ItemDaNotaList.as_view(), name='itens-da-nota'),
    path('', include(router.urls)),  # Inclua todas as URLs geradas pelo router (se houver)
]
