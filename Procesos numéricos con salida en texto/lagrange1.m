clc
clear all
%Este metodo recibe un conjunto de parejas ordenadas X y Y y retorna los
%coeficientes el polinomio de interpolacion de Lagrange que pasa por dichos
%puntos.
%El polinomio es de la forma L0*Y0 + L1*Y1 + ... + Ln*Yn
%L(k) = multip (i = 1 : n, i ~= k) de ( x - x(i) ) / ( x(k) - x(i) )

function[P, L]=lagrange(X,Y)
    n = length(X);
    % L es de tipo cell porque es un arreglo de strings. Para acceder a las
    % posiciones se usan llaves {}
    L = cell(n, 1);
    P = '';
    for k = 1 : n
        den = 1;    
        l = '';
        % Construccion de L(k)
        for i = 1 : n
            if (i ~= k)
                % Verificar si puedo hacer un * al final
                if (i ~= n && k ~= n)
                    actual = sprintf('(x - %g) * ', X(i));
                elseif (i < n - 1 && k == n)
                    actual = sprintf('(x - %g) * ', X(i));
                else
                    actual = sprintf('(x - %g)', X(i));
                end
                % Aumentarle el parentesis que acabamos de construir al l
                % construido
                l = strcat( l, actual );
                %Se halla el valor del denominador (Xk - Xi)
                den = den * ( X(k) - X(i) );
            end
        end
        %Se agrega el denominador a L
        denominador = sprintf(' / %g', den);
        % Se agrega el L actual al arreglo
        L{k} = strcat(l, denominador);
        
        % Se construye el polinomio
        if (k ~= n)
            temp = sprintf('( %g * %s ) + ', Y(k), L{k});
        else
            temp = sprintf('( %g * %s ) ', Y(k), L{k});
        end
        P = strcat(P, temp);
    end
    P = inline(P);
end