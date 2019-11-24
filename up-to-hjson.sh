#!/bin/bash
if [ -f /usr/local/bin/hjson ] ; 
then 
  echo HJSON уже установлен! Продолжаем хайпить!;
else 
  read -p "HJSON не установлен! Если желаете установить - жмите enter, если нет - Ctrl C отменит выполнение скрипта!";
  GET=https://github.com/hjson/hjson-go/releases/download/v3.0.0/linux_amd64.tar.gz;
  echo Загружаем...;
  curl -sSL $GET | sudo tar -xz -C /usr/local/bin;
fi
read -p "Все файлы JSON в этом каталоге будут преобразованы в HJSON - enter чтобы продолжить, ctrl C чтобы отменить!";
echo "Значит, что вы готовы к последующему этапу";
for file in ./*.json;
  do echo "Отработка файла $file ...";
  hjson $file > ${file/.json/.hjson};
  echo "Отработан файла ${file/.json/.hjson} !!!";
done;
echo "Отработано всё в данном каталоге. YOU ARE RRRRROCK ;-}";
echo "Да, конечно, мы отработали файлы в каталоге, но стоит ли удалять оригиналы файлов?";
echo "1 Да, удалить эти файлы, мне они не нужны! Я не передумаю!";
echo "2 Не-не-не! Переместите их в отдельный каталог ./backup - я их заберу!";
read otvet;
case "$otvet" in
  1) echo "Нет так нет ;-} Вытираем следы преступления";
     rm *.json;;
  2) echo "Мы понимаем, жалко работу, которую вы проделали. Мы сохраним ваши труды в каталоге ./backup";
     if [ ! -f ./backup ] ;
     then
       mkdir backup;
     fi;
     mv *.json "backup/";;
esac;
echo "Отработка завершена. Good bye, user!";
