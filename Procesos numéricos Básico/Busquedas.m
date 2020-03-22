## M�TODO DE BUSQUEDAS INCREMENTALES

clc
clear all

fprintf('\n\n\n M�todo de B�squedas Incrementales \n\n')

fx=input('ingrese la funcion f(x): ','s');
f=inline(fx);
xi=input('ingrese el valor inicial Xi = ');
xf=input('ingrese el valor final Xf = ');
deltax=input('ingrese el tama�o de paso = ');

x=xi:deltax:xf;
n=length(x);
y=zeros(1,n);

for i=1:n-1
  y(i)=f(x(i));
  if f(x(i))*f(x(i+1))<0
    fprintf('\n La funci�n tienen una ra�z en el intervalo [ %g , %g ]',x(i),x(i+1))
  endif
endfor

plot(x,y)
grid
