function Vandermode(x,y);
  n=length(x);
  A=ones(n);

  for i=1:n
    for j=1:n
      A(i,j)=x(i)^(j-1);
    endfor
  endfor

  ai=inv(A)*y';

   doc=fopen('Vandermode.txt','w');
   fprintf(doc,'Los coeficientes del polinomio son:   \r\n');
      
   for i=1:n
     fprintf(doc,'  %f',ai(i));
   endfor
    
    fclose(doc); 
endfunction