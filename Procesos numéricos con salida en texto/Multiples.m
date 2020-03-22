##METODO DE RAICES MULTIPLES
function Multiples(fx,dfx,d2fx,x0,tol,iter)

  f=inline(fx);
  df=inline(dfx);
  d2f=inline(d2fx);

  n=0;
  Error=tol+1;

  doc=fopen('Multiples.txt','w'); 

  while Error>tol && n<=iter
    n=n+1;
    xm=x0-f(x0)*df(x0)/(df(x0)^2-f(x0)*d2f(x0));
    
    Eabs=abs(xm-x0);
    
    fprintf(doc,'\r\n n=%g   Xm=%f    F(xm)=%f   Error=%e    ',n,xm,f(xm),Error)
    x0=xm;

  endwhile

  fprintf(doc,'\r\n La raí­z es X = %f con un Error = %e \n',xm,Error)
  fclose(doc); 
endfunction