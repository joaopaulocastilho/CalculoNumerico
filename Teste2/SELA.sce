clc;
//As únicas coisas que precisam ser modificadas são essas 4 linhas
M = [3, 1, 1; 1.2, 2.4, 2.4; 1, 1, 4]; //[2, -1, 0, 0, 0, 0; -1, 2, -1, 0, 0, 0; 0, -1, 2, -1, 0, 0; 0, 0, -1, 2, -1, 0; 0, 0, 0, -1, 2, -1; 0, 0, 0, 0, -1, 2];
//M = [4, 2, 0.5; 1, 5, 1; 1, 1, 6]; //Matriz dos coeficientes
B = [0.5; 2.4; 5];
//B = [5; 3; 12]; //Vetor dos termos independentes
epsilon = 10 ^ -1; //Epsilon
xFixo = [0; 0; 0]; //Solução inicial

n = length(B); //Ordem da Matriz dos coeficientes
I = eye(M); //Identidade da matriz M
p = 999; //Criterio de parada
it = 0; i = 0; j = 0; //Iteradores

function [] = imprime(nomeMetodo, respostas, it)
      if(it > 1003) then printf("Não converge\n");
      else
            printf("%s: ", nomeMetodo);
            printf("%d iterações\nSolução:", it);
            disp(x);
            printf("\n");
      end;
endfunction;

x = xFixo;

for i=1:n
    for j=1:n
        Mdiv(i,j) = M(i,j)/M(i,i);
    end;
    Bdiv(i) = B(i)/M(i, i);
end;


while p > epsilon & it <= 1003
    x = ((I-Mdiv) * x) + Bdiv;
    p = norm(Mdiv*x - Bdiv);
    it = it + 1;
end;

imprime("Metodo de Jacobi", x, it);

//GAUSS-SEIDEL
//Verificar sempre se a diagonal principal é dominante sobre a diagonal secundária
x = xFixo;
p = 12;
it = 0;

for i=1:n
    for j=1:n
        L(i,j) = 0; D(i,j) = 0; U(i,j) = 0;
        if(i == j) then D(i,j) = M(i,j); end;
        if(j > i) then U(i,j) = M(i,j); end;
        if(j < i) then L(i,j) = M(i,j); end;
    end;
end;

while(p > epsilon & it <= 1003)
    x = (inv(L+D) * B) - ((inv(L+D) * U) * x);
    p = norm((M*x) - B);
    it = it + 1;
end;

imprime("Metodo de Gauss-Seidel", x, it);
