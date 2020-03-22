function SOR_GS(A,b,Tol,x0,w);

  [n,m]=size(A);

  D=diag(diag(A));
  L=D-tril(A);
  U=D-triu(A);

  T=inv(D-w*L)*((1-w)*D+w*U);
  C=w*inv(D-w*L)*b;

  Radio_espectral=max(abs(eig(T)));

  if Radio_espectral<1
    Error=Tol+1;
    n=0;
    
    doc=fopen('SOR_GS.txt','w');
    while Error>Tol
      n=n+1;
      x=T*x0+C;
      Error=norm(x-x0);
      
      fprintf(doc,'\r\n  n = %g   ',n);
      
      for i=1:m
        fprintf(doc,' X%g = %f    ',i,x(i));
      endfor
      
      fprintf(doc,'   Error = %e',Error);
      x0=x; 
      
     endwhile 
     fclose(doc); 
  else
    disp('El metodo diverge porque el Radio Espectral es mayor a 1')
  endif