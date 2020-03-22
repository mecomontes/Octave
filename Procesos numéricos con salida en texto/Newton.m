##MÉTODO DE NEWTON-RHAPSON
function Newton(fx,dfx,tol,x0,iter)
  f=inline(fx);
  df=inline(dfx);

  n=0;
  Error=tol+1;
  doc=fopen('Newton.txt','w'); 

  while Error>tol && n<=iter
    n=n+1;
    xm=x0-f(x0)/df(x0);
    
    Eabs=abs(xm-x0);
    
    fprintf(doc,'\r\n n=%g   Xm=%f    F(xm)=%f   Error=%e    ',n,xm,f(xm),Error)
    x0=xm;

  endwhile

  fprintf(doc,'\r\n La raí­z es X = %f con un Error = %e \n',xm,Error)
  fclose(doc); 
endfunction