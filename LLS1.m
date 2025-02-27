function [ dis, dcord, angle ] = LLS1(x,y,d)

% variables de entrada
        % x e y son las cordenadas de las antenas
        % d seran las distancias medidas por las antenas

%Funcion que aplica el metodo de la variable ficticia
%Esta creada para 4 antenas ubicadas en cuadrado respecto de cero
%Es decir (0,0)...(L,L)

%Creacion de la matriz

    for i = 1:4
        A(i,1) = [ -2 * x(i) ];
        A(i,2) = [ -2 * y(i) ];
        A(i,3) = 1;
        b(i,1) = d(i)^2 - x(i)^2 - y(i)^2;
    end 

    sparse(A);
    sparse(b);

%Aplico el metodo de la variable ficticia 


    Fsol = inv((A'*A))*A'*b; 
    plls1 = [Fsol(1), Fsol(2)];

    dis = sqrt(plls1(1)^2+plls1(2)^2);
    dcord = [abs(Fsol(1)), abs(Fsol(2))];
    angle = atan(plls1(2)/plls1(1))*360/(2*pi);
