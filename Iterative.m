function prev_R = Iterative(nume, d, eps)
	% Functia care calculeaza matricea R folosind algoritmul iterativ.
	% Intrari:
	%	-> nume: numele fisierului din care se citeste;
	%	-> d: coeficentul d, adica probabilitatea ca un anumit navigator sa continue navigarea (0.85 in cele mai multe cazuri)
	%	-> eps: eruarea care apare in algoritm.
	% Iesiri:
	%	-> R: vectorul de PageRank-uri acordat pentru fiecare pagina. 
   %citire date din input intr-o matrice
  M = dlmread(nume, ' ',0,0);
  %extragere primul element din fisier care reprezinta nr de linkuri
  N=M(1,1);
  [n m]=size(M);
for i=2:N+1
  for j=3:m
    %creare matricea de vecini
    B(i-1,j-2) = M(i,j);
  endfor
endfor
[p,q]=size(B);
%creare matrice de adiacenta
A=zeros(N);
for i=1:p
  for j=1:q
    if(B(i,j)~=0 && B(i,j)~=i)
    A(i,B(i,j))=1;
  endif
endfor
endfor
%creare vector care retine cu cate noduri este legat fiecare link
for i=1:p
  suma = 0;
  for j=1:q
    if(B(i,j) ~= 0 && B(i,j) ~= i)
    suma = suma + 1;
  endif
  v(i) = suma;
endfor
endfor
  %creare matricea suma L
  L=zeros(N,N);
  for j=1:N
    for i=1:N
      L(i,j)=A(j,i)/v(j);
    endfor
  endfor
  %initializare PR si R
  PR=ones(N,1);
  R=ones(N,1);
  % noul PR initial
  PR=PR*1/N;
  %initializare R anterior
  prev_R = zeros(N,1);
  R=PR;
  while(norm(R-prev_R) > eps )
  %salvare vechea valoare
  prev_R = R;
  R = d*(L * R) + (1-d)/N;
  endwhile
endfunction