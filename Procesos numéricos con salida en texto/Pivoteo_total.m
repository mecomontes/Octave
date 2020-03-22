function Pivoteo_total(A,b)
  [filA,colA]=size(A);

  if filA==colA
    if det(A)!=0
      
      ##Eliminacion Gaussiana
      
      n=filA;
      
      ### matriz de marcas
      Marcas=zeros(1,n);
      
      for i=1:n
        Marcas(i)=i;
      endfor
      
      Ab=[A b];
      for i=1:n-1
      
      ##### buscar el mayor
        mayor=abs(Ab(i,i));
        filamayor=i;
        columnamayor=i;
        
        for r=i:n
          for s=i+1:n
            if abs(Ab(r,s))>mayor
              mayor=abs(Ab(r,s));
              filamayor=r;
              columnamayor=s;
            endif
          endfor
        endfor
        
        ##### intercambiar filas
        if filamayor!=i
          for t=1:n+1
            aux=Ab(i,t);
            Ab(i,t)=Ab(filamayor,t); 
            Ab(filamayor,t)=aux;
          endfor
        endif
        
        ##### intercambiar columnas
        if filamayor!=i
          for t=1:n
            aux=Ab(t,i);
            Ab(t,i)=Ab(t,columnamayor); 
            Ab(t,columnamayor)=aux;         
          endfor
          aux=Marcas(i);
          Marcas(i)=Marcas(columnamayor);
          Marcas(columnamayor)=aux;
        endif
        
        #### escalonar
        for j=i+1:n
          Multi=Ab(j,i)/Ab(i,i);
          Ab(j,i)=0;
          for k=i+1:n+1
            Ab(j,k)=Ab(j,k)-Multi*Ab(i,k);
          endfor
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
      
      doc=fopen('Pivoteo_total.txt','w');
      for i=1:n
        fprintf(doc,'\n X%g = %f \n',Marcas(i),x(i))
      endfor
      fclose(doc)
    else
      fprintf('\n El determinante de la matriz A es 0, asi que el sistema no tiene solucion unica \n')
    endif
  else
    fprintf('\n La matriz A no es cuadrada y por ello el sistema no posee solucion unica \n')
  endif
endfunction