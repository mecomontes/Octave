function Trazadorlineal(x,y);
 
 n=length(x);
  a=zeros(1,n-1);
  b=zeros(1,n-1);
  S=zeros(n-1,2);

  for i=1:n-1
    a(i)=(y(i+1)-y(i))/(x(i+1)-x(i)); 
    b(i)=y(i)-a(i)*x(i);
    S(i,1)=a(i);
    S(i,2)=b(i);
  endfor

  doc=fopen('Trazadorlineal.txt','w');
  fprintf(doc,'\n       ai            bi     \r\n');
  for i=1:n-1
    fprintf(doc,' %f    %f \r\n',S(i,1),S(i,2));
  endfor  
  fclose(doc);
endfunction