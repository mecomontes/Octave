##MÉTODO DE REGLA FALSA

clc
clear all

fprintf('\n\n\n Método de Regla Falsa \n\n')

fx=input('ingrese la funcion f(x): ','s');
f=inline(fx);
a=input('ingrese el valor de a = ');
b=input('ingrese el valor de b = ');
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
  xm=a-f(a)*(b-a)/(f(b)-f(a));
  
  if n>1
    Eabs=abs(xm-xviejo);
    Erel=abs(Eabs/xm);
  endif
  
  xviejo=xm;
  
  switch e
    case 1
      Error=Eabs;
    case 2
      Error=Erel;
    case 3
      Error=abs(f(xm));
  endswitch
  
  fprintf('\n n=%g   Xm=%f  F(a)=%f   F(b)=%f    F(xm)=%f   Error=%e    ',n,xm,f(a),f(b),f(xm),Error)
  
  if f(xm)*f(a)>0
    a=xm;
  else
    b=xm;
  endif
endwhile

fprintf('\n\n La raíz es X = %f con un Error = %e\n',xm,Error)