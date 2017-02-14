#!/bin/bash

for i in *.cpp
do
  g++ $i -o $i.out;
done

for j in entradas/*.in
do
   echo -e "Arquivo de entrada: " $j "\nRespostas:\n";
   for k in *.out
   do      
         ./$k < $j
   done
   echo -e "\n";
done

