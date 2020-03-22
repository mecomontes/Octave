function Cholesky(A,b)

  [filA,colA]=size(A);
  L=eye(colA);
  U=eye(colA);

  if filA==colA
    for k=1:filA
      suma1=0;
      for p=1:k-1
        suma1=suma1+L(k,p)*U(p,k);
      endfor
      U(k,k)=(A(k,k)-suma1)^0.5;
      L(k,k)=U(k,k);
      for i=k+1:filA
        suma2=0;
        for p=1:k-1
          suma2=suma2+L(i,p)*U(p,k);
        endfor
        L(i,k)=(A(i,k)-suma2)/U(k,k);
      endfor
      for j=k+1:filA
        suma3=0;
        for p=1:k-1
          suma3=suma3+L(k,p)*U(p,j);
        endfor
        U(k,j)=(A(k,j)-suma3)/L(k,k);
      endfor
    endfor
    doc=fopen('Cholesky.txt','w');
    fprintf(doc,'Matriz L   \r\n');
    
    for i=1:filA
      for j=1:filA
        fprintf(doc,'  %f',L(i,j));
      endfor
      fprintf(doc,' \r\n');
    endfor
    
    fprintf(doc,'Matriz U   \r\n');
    
    for i=1:filA
      for j=1:filA
        fprintf(doc,'  %f',U(i,j));
      endfor
      fprintf(doc,' \r\n');
    endfor
    fclose(doc); 
  else
    fprintf('\r\n La matriz A no es cuadrada y por ello el sistema no posee solucion unica \n')
  endif
endfunction