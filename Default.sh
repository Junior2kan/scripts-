#!/bin/bash
rm -rf /var/www/html/* && \
echo "remoção do html ok"
rm -rf /usr/lib/cgi-bin/* && \
echo "remoção do cgi ok"
apt-get remove apache2 --purge -y && \
echo "remoção do apache2 ok"
echo "instalando o apache2"
apt-get install apache2 -y &>> script.log || \
echo "apache: Erro"

echo "habilitando o modulo cgi ..." && \
a2enmod cgid &>> script.log || \
echo "cgi: Erro"

echo "configurando utf8 ..." && \
echo "addDefaultCharset UTF8" >> /etc/apache2/conf-enabled/charset.conf \
>>script.log || echo "UTF8: Erro "

echo "Configurando Atalhp CFID"
ln -s /usr/lib/cgi-bin /var/www/html/cgi-bin || \
echo "Atalho: Erro"
