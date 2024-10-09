from rest_framework.test import APITestCase
from django.urls import reverse

class VendasPeriodoTests(APITestCase):

    def test_vendas_periodo(self):
        url = reverse('notas-venda-vendas-periodo')  # Substitua pelo nome correto do seu endpoint
        
        data = {
            "data_inicio": "2024-09-01",
            "data_fim": "2024-09-30"
        }
        
        # Fazendo a requisição POST
        response = self.client.post(url, data, format='json')
        
        # Verificando o status da resposta
        print(response.status_code)  # Verifica o status da resposta
        print(response.data)  # Verifica o conteúdo da resposta
