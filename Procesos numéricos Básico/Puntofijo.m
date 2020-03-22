##MÉTODO DE PUNTO FIJO


clc
clear all

fprintf('\n\n\n Método de Punto Fijo \n\n')

fx=input('ingrese la funcion f(x): ','s');
f=inline(fx);
gx=input('ingrese la funcion g(x): ','s');
g=inline(gx);
x0=input('ingrese el valor de Xo = ');
tol=input('ingrese la tolerancia Tol = ');
iter=input('ingrese el numero de iteraciones: ');

fprintf('\n 1.Error Absoluto \n 2. Error Relativo  \n 3. F(x)\n\n')
e=input('La tolerancia es respecto a: ')


n=0;
Error=tol+1;
Eabs=Error;
Erel=Error;

while Error>tol && n<=iter
  n=n+1;
  xm=g(x0);
  
  Eabs=abs(xm-x0);
  Erel=abs(Eabs/xm);
  
  switch e
    case 1
      Error=Eabs;
    case 2
      Error=Erel;
    case 3
      Error=abs(f(xm));
  endswitch
  
  fprintf('\n n=%g   Xm=%f    F(xm)=%f   Error=%e    ',n,xm,f(xm),Error)
  x0=xm;

endwhile

fprintf('\n\n La raíz es X = %f con un Error = %e\n',xm,Error)