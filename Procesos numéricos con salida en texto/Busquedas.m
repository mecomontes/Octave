## METODO DE BUSQUEDAS INCREMENTALES
function Busquedas(f,xi,xf,deltax);

  x=xi:deltax:xf;
  n=length(x);
  y=zeros(1,n);

  for i=1:n-1
    y(i)=f(x(i));
    if f(x(i))*f(x(i+1))<0
      fprintf('\n La función tienen una raíz en el intervalo [ %g , %g ]',x(i),x(i+1))
    endif
  endfor

  plot(x,y)
  grid
endfunction