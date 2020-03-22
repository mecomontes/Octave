clc;
clear all;

A=input('ingrese la matriz de coeficientes A : ')
b=input('ingrese el vector de terminos independientes b = ')


[filA,colA]=size(A);

if filA==colA
  if det(A)!=0
    
    ##Eliminacion Gaussiana
    
    n=filA
    Ab=[A b]
    for i=1:n-1
      for j=i+1:n
        Multi=Ab(j,i)/Ab(i,i)
        Ab(j,i)=0
        for k=i+1:n+1
          Ab(j,k)=Ab(j,k)-Multi*Ab(i,k);
        endfor
        Ab
      endfor
    endfor
    
    ### sustitucion regresiva
    
    x=zeros(n,1);
    x(n)=Ab(n,n+1)/Ab(n,n);
    
    for i=n-1:-1:1
      suma=0;
      for j=i+1:n
        suma=suma+Ab(i,j)*x(j,1);
      endfor
      x(i,1)=(Ab(i,n+1)-suma)/Ab(i,i);   
    endfor
    x
  else
    fprintf('\n El determinante de la matriz A es 0, asi que el sistema no tiene solucion unica \n')
  endif
else
  fprintf('\n La matriz A no es cuadrada y por ello el sistema no posee solucion unica \n')
endif