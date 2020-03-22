function Gauss_Seidel(A,b,Tol,x0)

  [n,m]=size(A);

  D=diag(diag(A));
  L=D-tril(A);
  U=D-triu(A);

  T=inv(D-L)*(U);
  C=inv(D-L)*b;

  Radio_espectral=max(abs(eig(T)));

  if Radio_espectral<1
    Error=Tol+1;
    n=0;
    doc=fopen('Gauss_Seidel.txt','w');
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
endfunction