function B = PR_Inv(A)
	% Functia care calculeaza inversa matricii A folosind factorizari Gram-Schmidt
	% A = matricea de factorizat (baza initiala)
	[m n]=size(A);
  % Q = factorul ortogonal(baza ortonormata)
	Q = A;	
  % R = factorul superior triunghiular
	R=zeros(m,n);
	Q=eye(m);
	for i = 1 : n
		R( 1 : i-1, i ) = Q( 1 : m, 1 : i-1 )'*A( 1 : m, i );
		y = A( 1 : m, i ) - Q( 1 : m, 1 : i-1 )*R( 1 : i-1, i );
		R( i, i ) = norm( y );
		Q( 1 : m, i ) = y ./ R( i, i );
	endfor
  B = zeros(n);
  I = eye(n);
  e=zeros(n,1);
  for i=1:n
    %sistemul are forma: B * x(i) = e(i)
    e=I(:,i);
    %rezolvarea sistemului
    B(:,i) = SST(R,Q'*e);
  endfor 
endfunction