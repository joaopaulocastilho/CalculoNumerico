function [y] = f(x);
   y = x ^ 2; //inserir aqui a fun��o
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
//--------------------M�TODO DOS TRAP�ZIOS--------------------//
n = 4; //n�mero de trapezios
x0 = 0; //limitante inferior
x1 = 4 //limitante superior

printf("M�todo dos trap�zios: %.9f\n", trapezio(x0, x1, n));
//-----------------------------------------------------------//

//--------------------M�TODO DE SIMPSON 1-------------------//
n = 5; //n�mero de pontos, �mpar
x0 = 2; //limitante inferior
x1 = 3; //limitante superior

printf("Simpson 1: %.9f\n", simpson1(x0, x1, n-1));
//----------------------------------------------------------//

//--------------------M�TODO DE SIMPSON 2-------------------//
n = 1000; //n�mero de pontos, (4 + 3n)
x0 = 0; //limitante inferior
x1 = 0.6; //limitante superior

printf("Simpson 2: %.9f\n", simpson2(x0, x1, n-1));
//---------------------------------------------------------//

