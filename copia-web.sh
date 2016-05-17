#!/bin/bash

## 160517 JBS
# script para copiar webs con BD MySQL

WEBROOT='/var/www/htdocs'
DIRCOPIAS='/root/copias-web'
FICHNAME=$1-`date +%y%m%d`-`date +%R`
MYPASS='pass'

## Colores
AZUL='\e[0;34m'
VERDE='\e[0;32m'
RESETCOLOR='\e[0m'

echo -e "$VERDE\nComprimiendo web ..."
tar -C $WEBROOT -czf $DIRCOPIAS/$FICHNAME.tgz $1
echo -e "Comprimiendo BD ..."
mysqldump -p$MYPASS --opt $2 |gzip -c > $DIRCOPIAS/$FICHNAME-$2.sql.gz

echo -e "$AZUL\nResultado de la copia:\n"
ls -lh $DIRCOPIAS/$1*
echo -e "$RESETCOLOR"
