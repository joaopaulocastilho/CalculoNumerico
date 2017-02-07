#!/bin/bash

for i in *.cpp
do
  g++ $i -o $i.out;
  $i.out < ent.in;
done
