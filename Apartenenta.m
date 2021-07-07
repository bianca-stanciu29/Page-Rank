function u = Apartenenta(x, val1, val2)
	% Functia care primeste ca parametrii x, val1, val2 si care calculeaza valoarea functiei membru in punctul x.
	% Stim ca 0 <= x <= 1 
  
  %conditii ca functia sa fie continua din limitele in val1 si val2
    a = 1/(val2-val1);
    b = (-val1) / (val2 - val1);
  
  % Calculez valoarea lui y, in functie de intervalul in care se afla x
  if (x >= 0 && x<val1)
    u = 0;
  endif
  if (x > val2 && x <= 1)
    u = 1;
  endif
  if (x >= val1 && x <= val2)
    u = a*x + b;
	endif
  endfunction