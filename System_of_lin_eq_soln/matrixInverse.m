function ans = matrixInverse(A)
  nrows = rows(A);
  identity = zeros(nrows, nrows);
  for i = 1:nrows
    identity(i,i) = 1;
   endfor
  ans = ludecomposition(A, identity(:,1));
  for i=2:nrows
    temp = ludecomposition(A, identity(:, i));
    ans = [ans temp]
  endfor
 endfunction 
  
  
  