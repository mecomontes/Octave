clc; ##borrar pantalla
clear all;#borrar la memoria

A=input('íngrese la matriz A = ')#Se pide ingresar la matriz A
B=input('íngrese la matriz B = ')#Se pide ingresar la matriz B

[filA,colA]=size(A);#obtener el numero de filas y columnas de la matriz A
[filB,colB]=size(B);#obtener el numero de filas y columnas de la matriz B
AB=zeros(filA,colB);#se crea una matriz de tamaño filas de la primera y columnas de la segunda


if colA==filB
  for i=1:filA
    for j=1:colB
      suma=0;
      for k=1:colA
        suma=suma+A(i,k)*B(k,j);
      endfor
      AB(i,j)=suma;
      suma=0;
    endfor
  endfor

  fprintf('\n\n La multiplicacion de A*B es : \n')
  AB  
else  
  fprintf('\n\n No se puede hacer la multiplicacion de esas matrices\n\n')
endif