##MÉTODO DE SECANTE
function Secante(fx,a,b,tol,iter);

  f=inline(fx);
  n=0;
  Error=tol+1;
  doc=fopen('Secante.txt','w'); 

  while Error>tol && n<=iter
    n=n+1;
    xm=a-f(a)*(b-a)/(f(b)-f(a));
    
    if n>1
      Eabs=abs(xm-xviejo);
    endif
    
    xviejo=xm;
      
    fprintf(doc,'\r\n n=%g   Xm=%f  F(a)=%f   F(b)=%f    F(xm)=%f   Error=%e    ',n,xm,f(a),f(b),f(xm),Error)
    b=xm;
    
  endwhile

  fprintf(doc,'\r\n La raí­z es X = %f con un Error = %e \n',xm,Error)
  fclose(doc); 
endfunction