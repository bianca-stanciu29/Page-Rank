function R = Algebraic(nume, d)
	% Intrari: 
	%	-> nume: numele fisierului in care se scrie;
	%	-> d: probabilitatea ca un anumit utilizator sa continue navigarea la o pagina urmatoare.
	% Iesiri:
	%	-> R: vectorul de PageRank-uri acordat pentru fiecare pagina.
	  M = dlmread(nume, ' ',0,0); %citire date din input intr-o matrice
N=M(1,1);%extragere primul element din fisier care reprezinta nr de linkuri
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
  %matricea unitate
  I=eye(N);
 D = I - d*L;
 ONE = ones(N,1);
 %inversa calculata cu gram-schmidt
 M = PR_Inv(D);
 R = M * ((1-d)/N)*ONE;
  endfunction