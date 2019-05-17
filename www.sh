nginx
php-fpm

a=`lsof -i:88 | wc -l`
while  [ $a -eq 0 ];
do
      a=`lsof -i:88 | wc -l`
done
