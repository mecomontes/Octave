##MÉTODO DE PUNTO FIJO
function Puntofijo(fx,gx,x0,iter,tol);

  f=inline(fx);
  g=inline(gx);

  n=0;
  Error=tol+1;
  doc=fopen('Puntofijo.txt','w'); 

  while Error>tol && n<=iter
    n=n+1;
    xm=g(x0);
    
    Eabs=abs(xm-x0);
    
    fprintf(doc,'\r\n n=%g   Xm=%f    F(xm)=%f   Error=%e    ',n,xm,f(xm),Error)
    x0=xm;

  endwhile

  fprintf(doc,'\r\n La raí­z es X = %f con un Error = %e \n',xm,Error)
  fclose(doc); 
endfunction