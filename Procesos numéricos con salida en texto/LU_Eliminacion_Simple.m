function LU_Eliminacion_Simple(A,b)

  [filA,colA]=size(A);
  L=eye(colA);

  if filA==colA
      
      ##Eliminacion Gaussiana
      
      n=filA;
      for i=1:n-1
        for j=i+1:n
          Multi=A(j,i)/A(i,i);
          L(j,i)=Multi;
          A(j,i)=0;
          for k=i+1:n
            A(j,k)=A(j,k)-Multi*A(i,k);
          endfor
        endfor
      endfor
      U=A;
   else
    fprintf('\n La matriz A no es cuadrada y por ello el sistema no posee solucion unica \n')
  endif
  
  doc=fopen('LU_Eliminacion_Simple.txt','w');
  fprintf(doc,'Matriz L   \r\n');
  
  for i=1:n
    for j=1:n
      fprintf(doc,'  %f',L(i,j));
    endfor
    fprintf(doc,' \r\n');
  endfor
  
  fprintf(doc,'Matriz U   \r\n');
  
  for i=1:n
    for j=1:n
      fprintf(doc,'  %f',U(i,j));
    endfor
    fprintf(doc,' \r\n');
  endfor
  fclose(doc);
  
endfunction