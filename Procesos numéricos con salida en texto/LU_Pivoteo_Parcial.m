function LU_Pivoteo_Parcial(A,b)

  [filA,colA]=size(A);
  L=eye(colA);

  if filA==colA
      
      ##Eliminacion Gaussiana
      
      n=filA;
    
      for i=1:n-1
      
      ##### buscar el mayor
        mayor=abs(A(i,i));
        filamayor=i;
        
        for s=i+1:n
          if abs(A(s,i))>mayor
            mayor=abs(A(s,i));
            filamayor=s;
          endif
        endfor
        
        ####### intercambiar filas
        if filamayor!=i
          for t=1:n
            aux=A(i,t);
            A(i,t)=A(filamayor,t); 
            A(filamayor,t)=aux;
          endfor
        endif
        
        #### escalonar
        for j=i+1:n
          Multi=A(j,i)/A(i,i);
          A(j,i)=0;
          L(j,i)=Multi;
          for k=i+1:n
            A(j,k)=A(j,k)-Multi*A(i,k);
          endfor
        endfor
      endfor
      U=A;      
  else
    fprintf('\n La matriz A no es cuadrada y por ello el sistema no posee solucion unica \n')
  endif
  
  doc=fopen('LU_Pivoteo_Parcial.txt','w');
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