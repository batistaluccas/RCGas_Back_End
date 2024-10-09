# nfe_service.py

from pynfe.processamento.comunicacao import ComunicacaoSefaz
from pynfe.entidades.cliente import Cliente
from pynfe.entidades.emitente import Emitente as PynfeEmitente
from pynfe.entidades.notafiscal import NotaFiscal
from pynfe.entidades.fonte_dados import _fonte_dados
from pynfe.processamento.serializacao import SerializacaoXML, SerializacaoQrcode
from pynfe.processamento.assinatura import AssinaturaA1
from pynfe.utils.flags import CODIGO_BRASIL
from decimal import Decimal
import datetime
from ..venda.models import Emitente
import json

def emitir_nfe_service(dados):
    # Você pode adaptar aqui os dados conforme o que vier do request
    # Exemplo: dados = json.loads(request.body)

    # Configurar os parâmetros necessários
    certificado = "./certs/RC GAS E AGUA LTDA_53969312000174.pfx"
    senha = '123456'
    uf = 'sp'
    homologacao = True
    dados_emitente = Emitente.objects.filter(id_emitente=1).first()
    bairro_emitente = dados_emitente.endereco_bairro.bairro_nome
    # Emitente
    emitente = PynfeEmitente(
        razao_social = 'NF-E EMITIDA EM AMBIENTE DE HOMOLOGACAO - SEM VALOR FISCAL', # alterar para o da empresa quando produção
        nome_fantasia = dados_emitente.nome_fantasia,
        cnpj = dados_emitente.cnpj,
        inscricao_estadual=dados_emitente.inscricao_estadual,  # Caso a inscrição estadual não esteja preenchida
        inscricao_municipal=dados_emitente.inscricao_municipal,  # Caso a inscrição municipal não esteja preenchida
        cnae_fiscal=dados_emitente.cnae_fiscal,  # Caso o CNAE não esteja preenchido
        endereco_logradouro=dados_emitente.endereco_logradouro,  # Corrigido para pegar diretamente do emitente
        endereco_numero=dados_emitente.endereco_numero,  # Corrigido para pegar diretamente do emitente
        endereco_bairro=bairro_emitente,  # Supondo que este seja um campo inteiro ou objeto que você precisa
        endereco_municipio=dados_emitente.endereco_municipio,  # Corrigido para pegar diretamente do emitente
        endereco_uf=dados_emitente.endereco_uf,  # Corrigido para pegar diretamente do emitente
        endereco_cep=dados_emitente.endereco_cep,  # Corrigido para pegar diretamente do emitente
        endereco_pais=CODIGO_BRASIL  # Constante definida em seu código
    )

    # Cliente
    cliente = Cliente(
        razao_social=dados.get('cliente_razao_social', ''),
        tipo_documento=dados.get('tipo_documento', ''),
        email=dados.get('email', ''),
        numero_documento=dados.get('numero_documento', ''),
        indicador_ie=dados.get('indicador_ie'),
        endereco_logradouro=dados.get('cliente_endereco_logradouro', ''),
        endereco_numero=dados.get('cliente_endereco_numero', ''),
        endereco_complemento=dados.get('cliente_endereco_complemento', ''),
        endereco_bairro=dados.get('cliente_endereco_bairro', ''),
        endereco_municipio=dados.get('cliente_endereco_municipio', ''),
        endereco_uf=dados.get('cliente_endereco_uf', ''),
        endereco_cep=dados.get('cliente_endereco_cep', ''),
        endereco_pais=dados.get('cliente_endereco_pais', ''),
        endereco_telefone=dados.get('cliente_telefone', ''),
    )

    # Nota Fiscal
    nota_fiscal = NotaFiscal(
        emitente=emitente,
        cliente=cliente,
        uf=uf.upper(),
        natureza_operacao='VENDA',
        forma_pagamento=dados.get('forma_pagamento', 0),
        tipo_pagamento=dados.get('tipo_pagamento', 1),
        modelo=65,
        serie=1,
        numero_nf=dados.get('numero_nf', '111'),
        data_emissao=datetime.datetime.now(),
        data_saida_entrada=datetime.datetime.now(),
        tipo_documento=1, # 1 é saida
        municipio='3507605',
        tipo_impressao_danfe=4,
        forma_emissao='1',
        cliente_final=1,
        indicador_destino=1,
        indicador_presencial=1,
        finalidade_emissao='1',
        processo_emissao='0',
        transporte_modalidade_frete=9,
        informacoes_adicionais_interesse_fisco='Mensagem complementar',
        # se eu informar os codigos nao preciso, simples nacional -- > totais_tributos_aproximado=Decimal('21.06'),
    )

    # Produto
    nota_fiscal.adicionar_produto_servico(
        codigo=dados.get('produto_codigo', '000328'),
        descricao=dados.get('produto_descricao', 'Produto de Teste'),
        ncm=dados.get('produto_ncm', '99999999'),
        cfop=dados.get('produto_cfop', '5102'),
        unidade_comercial='UN',
        ean='SEM GTIN',
        ean_tributavel='SEM GTIN',
        quantidade_comercial=Decimal(dados.get('produto_quantidade', '12')),
        valor_unitario_comercial=Decimal(dados.get('produto_valor_unitario', '9.75')),
        valor_total_bruto=Decimal(dados.get('produto_valor_total', '117.00')),
        unidade_tributavel='UN',
        quantidade_tributavel=Decimal(dados.get('produto_quantidade', '12')),
        valor_unitario_tributavel=Decimal(dados.get('produto_valor_unitario', '9.75')),
        ind_total=1,
        icms_modalidade='102',
        icms_origem=0,
        icms_csosn='400',
        pis_modalidade='07',
        cofins_modalidade='07',
        # se eu informar os codigos nao preciso, simples nacional -- > totais_tributos_aproximado=Decimal('21.06'),
    )

    # Serialização
    serializador = SerializacaoXML(_fonte_dados, homologacao=homologacao)
    nfce = serializador.exportar()

    # Assinatura
    a1 = AssinaturaA1(certificado, senha)
    xml = a1.assinar(nfce)

    # Token de homologação
    token = '000001'

    # CSC de homologação
    csc = 'N4EOUTEDXCOVCGNTWLFD4OJLHBWCWJHCXC0C'

    # Gera e adiciona o QR Code no XML
    xml_com_qrcode = SerializacaoQrcode().gerar_qrcode(token, csc, xml)

    # Envio
    con = ComunicacaoSefaz(uf, certificado, senha, homologacao)
    envio = con.autorizacao(modelo='nfce', nota_fiscal=xml_com_qrcode)

    # Verifica o retorno
    if envio[0] == 0:
        return {'status': 'success', 'xml': envio[1]}
    else:
        raise Exception('Erro ao enviar a NF-e: ' + envio[1].text)
