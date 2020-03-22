clc;
clear all;

A=input('ingrese la matriz A : ')

[filA,colA]=size(A);

for i=1:filA-1
  for j=i+1:filA
    Multi=A(j,i)/A(i,i)
    A(j,i)=0;
    for k=i+1:colA
      A(j,k)=A(j,k)-Multi*A(i,k);
    endfor
    A
  endfor
endfor

A