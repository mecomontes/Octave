##MÉTODO DE MULLER

clc;
clear all;

fprintf('\n\n\n Método de Muller \n\n')

fx=input('ingrese la funcion f(x): ','s');
f=inline(fx);
x0=input('ingrese el valor de x0 = ');
x1=input('ingrese el valor de x1 = ');
x2=input('ingrese el valor de x2 = ');
tol=input('ingrese la tolerancia Tol = ');

fprintf('\n 1.Error Absoluto \n 2. Error Relativo  \n 3. F(x)\n\n')
e=input('La tolerancia es respecto a: ')

n=0;
Error=tol+1;

while Error>tol
  n=n+1;
  
  h0=x1-x0;
  h1=x2-x1;
  d0=(f(x1)-f(x0))/h0;
  d1=(f(x2)-f(x1))/h1;
  
  
  a=(d1-d0)/(h1+h0);
  b=a*h1+d1;
  c=f(x2);
  
  denmas=b+(b^2-4*a*c)^0.5;
  denmenos=b-(b^2-4*a*c)^0.5;

  if abs(denmas)>abs(denmenos)
    xm=x2-2*c/denmas;
  else
    xm=x2-2*c/denmenos;
  endif

  x0=x1;
  x1=x2;
  x2=xm;  
  
  if n>1
    switch e
      case 1
        Error=Eabs;
      case 2
        Error=Erel;
      case 3
        Error=abs(f(xm));
    endswitch
  endif

  fprintf('\n n=%g   Xm=%f  F(a)=%f   F(b)=%f    F(xm)=%f   Error=%e    ',n,xm,f(a),f(b),f(xm),Error)
  
  
endwhile

fprintf('\n\n La raíz es X = %f con un Error = %e\n',xm,Error)