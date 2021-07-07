function [R1 R2] = PageRank(nume, d, eps)
	% Calculeaza indicii PageRank pentru cele 3 cerinte
	% Scrie fisierul de iesire nume.out 
   M = dlmread(nume, ' ',0,0); %citire date din input intr-o matrice
    N=M(1,1);%extragere primul element din fisier care reprezinta nr de linkuri
     [n m]=size(M);
         val1 = M(n-1,1);
         val2 = M(n,1); 
  %construire numele fisierului de output
     outName = strcat(nume, '.out');
     out = fopen(outName, 'w'); 
     %afisarea numarului N in output
     fprintf(out, '%i \n',N);
     fprintf(out, '\n');
     	% Functia care calculeaza matricea R folosind algoritmul iterativ.
          R1 = Iterative(nume, d, eps);
          %afisarea lui R1 in output
          fprintf(out, '%.6f \n', R1);
          fprintf(out, '\n');
      % Functia care calculeaza vectorul PageRank folosind varianta algebrica de calcul.
        R2 = Algebraic(nume, d);
        %salvez valuarea lui R2 in R
        R=R2;
        %afisarea lui R2 in output
      fprintf(out, '%.6f \n', R2);
      fprintf(out, '\n');

  [n,m]=size(R);
%vectorul de indici in R-ul initial
for i=1:n
  index_init(i) = i;
endfor
%algorimt de sortare si creare nou vector de indici 
%care retin vechea pozitie a elementului dupa sortare
  for i=1:n-1
    for j=i+1:n
     if(R(i,1) < R(j,1))
      aux = R(i,1);
      auxindex = index_init(i);
      R(i,1)= R(j,1);
      index_init(i) = index_init(j);
      R(j,1)=aux;
      index_init(j) = auxindex;
      
    endif
  endfor
endfor
%parcurgearea lui R
%cacularea noului R in functie de functia unitate
for i=1:N
  u = Apartenenta(R(i,1) , val1 , val2);
  %afisarea in output 
   fprintf(out, '%i %i %.6f\n', i, index_init(i), u);
  endfor
   fclose(out);
  endfunction
  
  