//function [conv] = radia(ang)
 //  conv = (ang * %pi) / 180;
//endfunction;

function [y] = fun(x);
   y = x + 3 * cos(x) - %e ^ x //x ^ 3 + 7 * x ^ 2 - 6 * x + 1; //inserir aqui a função
endfunction;

function [y] = f1(x)
   y = 3 * x ^ 2 + 14 * x - 6; //Informe a PRIMEIRA derivada da função
endfunction;

function [y] = f2(x)
   y = 6 * x + 14; //Informe a SEGUNDA derivada da função
endfunction;

function [] = grafico(a, b)
   x = linspace(a,b,100) ;
   for i=1:100
      y(i)=fun(x(i));
   end
   plot(x,y)
endfunction;

a = 0; //inserir o valor de 'a'
b = 1; //inserir o valor de 'b'
eps = 10^(-2); //inserir o valor de EPS

bka = a;
bkb = b;

grafico(a, b);

//MÉTODO DA BISSECÇÃO
xm = (a+b)./2;
i = 0;

if fun(a)*fun(b) >= 0 printf("O valor de f(a) e f(b) devem ter sinal diferente");
   abort;
end;
while abs(fun(xm)) > eps & i <= 1000 do
   if fun(a)*fun(xm) > 0 then
      a = xm;
   else
      b = xm;
   end;
   xm = (a+b)./2;
   i = i + 1;
end;

if i >= 499 then
   printf("Não converge nesse intervalo!");
   abort;
else;
   printf("Bis: %10.9f || it: %d\n", xm, i);
end;
//---------------------------------------------------------------------------------

//Método das cordas
a = bka;
b = bkb;
x1 = (b * fun(a) - a * fun(b)) / (fun(a) - fun(b));
xn = x1;
i = 0;

while abs(fun(xn)) > eps & i < 1000 do
   if fun(x1) * fun(a) > 0 then
      xn = (b * fun(xn) - xn * fun(b)) / (fun(xn) - fun(b));
   else
      xn = (xn * fun(a) - a * fun(xn)) / (fun(a) - fun(xn));
   end;
   i = i + 1;
end;

if i >= 499 then
   printf("Não converge nesse intervalo!");
   abort;
else;
   printf("Cor: %10.9f || it: %d\n", xn, i);
end;
//---------------------------------------------------------------------------------

//Método de Newton
a = bka;
b = bkb;
xu = 0;
i = 1;

if fun(a) * f2(a) > 0 then
   xu = a;
else
   xu = b;
end;

while abs(fun(xu)) > eps & i < 500 do
   xu = xu - (fun(xu) / f1(xu));
   i = i + 1;   
end;

if i >= 499 then
   printf("Não converge nesse intervalo!");
   abort;
else;
   printf("New: %10.9f || it: %d", xu, i);
end;
//---------------------------------------------------------------------------------













