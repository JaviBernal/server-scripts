#!/bin/bash

## 160517 JBS
# script para copiar webs con BD MySQL

WEBROOT='/var/www/htdocs'
DIRCOPIAS='/root/copias-web'
FICHNAME=$1-`date +%y%m%d`-`date +%R`
MYPASS='mypass'

## Colores
AZUL='\033[0;34m'
PURPLE='\033[0;35m'
VERDE='\033[0;32m'
RESETCOLOR='\033[0m'

echo -e "$VERDE\nComprimiendo web $PURPLE$FICHNAME.tgz $VERDE..."
tar -C $WEBROOT -czf $DIRCOPIAS/$FICHNAME.tgz $1
echo -e "Comprimiendo BD  $PURPLE$FICHNAME-$2.sql.gz $VERDE..."
mysqldump -p$MYPASS --opt $2 |gzip -c > $DIRCOPIAS/$FICHNAME-$2.sql.gz

echo -e "$VERDE\nCopias de la web:\n$AZUL"
ls -lh $DIRCOPIAS/$1*
echo -e "$RESETCOLOR"
