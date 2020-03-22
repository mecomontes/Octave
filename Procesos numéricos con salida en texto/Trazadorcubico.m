function Trazadorcubico(x,y);

  n=length(x);

  A=zeros(1,n-1);
  B=zeros(1,n-1);
  C=zeros(1,n-1);

  p=zeros(1,n-1);
  h=zeros(1,n-1);
  v=zeros(1,n-1);
  u=zeros(1,n-1);
  z=zeros(1,n);

  a=zeros(1,n-1);
  b=zeros(1,n-1);
  c=zeros(1,n-1);
  d=zeros(1,n-1);
  S=zeros(n-1,4);

  for i=1:n-1
    h(i)=x(i+1)-x(i);
    p(i)=6*(y(i+1)-y(i))/h(i);
  endfor

  u(1)=2*(h(1)+h(2));
  v(1)=p(2)-p(1);

  for i=2:n-1
    u(i)=2*(h(i)+h(i-1))-h(i-1)^2/u(i-1);
    v(i)=p(i)-p(i-1)-h(i-1)*v(i-1)/u(i-1);
  endfor

  z(n)=0;
  for i=n-1:-1:2
    z(i)=v(i)-h(i)*z(i+1)/u(i);
  endfor
  z(1)=0;

  for i=1:n-1
    A(i)=(z(i+1)-z(i))/(6*h(i));
    B(i)=z(i)/2;
    C(i)=-h(i)*z(i+1)/6-h(i)*z(i)/3+(y(i+1)-y(i))/h(i);
    a(i)=A(i);
    b(i)=B(i)-3*A(i)*x(i);
    c(i)=C(i)-2*B(i)*x(i)+3*A(i)*x(i)^2;
    d(i)=y(i)-C(i)*x(i)+B(i)*x(i)^2-A(i)*x(i)^3;
    S(i,1)=a(i);
    S(i,2)=b(i);
    S(i,3)=c(i);
    S(i,4)=d(i);
  endfor
  doc=fopen('Trazadorcubico.txt','w');
  fprintf(doc,'\n       ai            bi           ci           di  \r\n');

  for i=1:n-1
    fprintf(doc,' %f    %f    %f    %f \r\n',S(i,1),S(i,2),S(i,3),S(i,4));
  endfor  
  fclose(doc);

endfunction