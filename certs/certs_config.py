import os
from pyne import Certificado

certificado = Certificado(
    arquivo=os.getenv('CERT_PATH', 'certs/RC GAS E AGUA LTDA_53969312000174.pfx'),
    senha=os.getenv('CERT_PASS', '123456')
)