## serie para e(x)

xi=input('Ingrese el centro de la serie xi = ');
x=input('Ingrese el valor de x a evaluar x = ');
dc=input('Ingrese el numero de decimales correctos deseados dc = ');

tol=0.5*10^-dc;
Dx=x-xi;
euler=exp(xi);

Error=tol+1;
n=0;
suma=0;
factorial=1;

while tol<Error
   n=n+1;
   factorial=factorial*n;
   disp(' ')
   disp('TERMINO '), n
   suma=suma+euler*(Dx^(n-1))/factorial
      
   if n>1
      Error=abs(fviejo-suma)
   end
   fviejo=suma;
end