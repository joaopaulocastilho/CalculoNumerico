function [y] = f(x);
   y = x ^ 2; //inserir aqui a função
   //1/(1+x);  //x * %e ^ (x/2); //log(1 + x) / log(%e);  //x^2;  //%e ^ x ^ 2;
endfunction;

function y = trapezio(x0, x1, n)
  h = (x1 - x0) / n;
  soma = f(x0) + f(x1);
  for k = 1 : n - 1 
    soma = soma + 2 * f(x0 + k * h);
  end;
  y = (h / 2) * soma;
endfunction;

function y = simpson1(x0, x1, n)
   h = (x1 - x0) / n;
   soma = f(x0) + f(x1);
   for i = 1 : n - 1
      if modulo(i, 2) == 0 
         soma = soma + 2 * f(x0 + i * h);
      else 
         soma = soma + 4 * f(x0 + i * h);
      end;
   end;
   y = (h/3) * soma;
endfunction;

function y = simpson2(x0, x1, n)
   h = (x1 - x0) / n;
   soma = f(x0) + f(x1);
   for i = 1 : n - 1
      if (modulo(i, 3) == 0)
         soma = soma + 2 * f(x0 + i * h);
      else
         soma = soma + 3 * f(x0 + i * h);
      end;
   end;
   y = ((3/8)*h) * soma;
endfunction;
//--------------------MÉTODO DOS TRAPÉZIOS--------------------//
n = 4; //número de trapezios
x0 = 0; //limitante inferior
x1 = 4 //limitante superior

printf("Método dos trapézios: %.9f\n", trapezio(x0, x1, n));
//-----------------------------------------------------------//

//--------------------MÉTODO DE SIMPSON 1-------------------//
n = 5; //número de pontos, ímpar
x0 = 2; //limitante inferior
x1 = 3; //limitante superior

printf("Simpson 1: %.9f\n", simpson1(x0, x1, n-1));
//----------------------------------------------------------//

//--------------------MÉTODO DE SIMPSON 2-------------------//
n = 1000; //número de pontos, (4 + 3n)
x0 = 0; //limitante inferior
x1 = 0.6; //limitante superior

printf("Simpson 2: %.9f\n", simpson2(x0, x1, n-1));
//---------------------------------------------------------//

