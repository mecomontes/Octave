function[B,p]= newton_Diferencias_Divididas(x,y);

n=length(x);
B=zeros(n,n+1);
B(:,1)=x;
B(:,2)=y;

for j=3:n+1
    for i=j-1:n
        B(i,j)=(B(i,j-1)-B(i-1,j-1))/(B(i,1)-B(i-j+2,1));
    end
end
b=zeros(n,1);
for i=1:n
    b(i)=B(i,i+1);
end

% Llenar los valores no utilizados con NaN
for i=1:n
    for j=i+2:n+1
        B(i,j)=NaN;
    end
end
p=imprimirPolinomio(b,x)
p=inline(p);
end

function poli=imprimirPolinomio(b,x)
n=length(x);
poli='';
for i=1:n
    s=sprintf('%g ',b(i));
    for j=1:i-1
        s2=sprintf('*(x - %g)',x(j));
        s = strcat(s,s2);
    end
    if (i~= n)
        s=strcat(s,'+');
    end
    poli=strcat(poli,s);
end
doc=fopen('newton_Diferencias_Divididas.txt','w');
fprintf(doc,poli);
fclose(doc)

endfunction