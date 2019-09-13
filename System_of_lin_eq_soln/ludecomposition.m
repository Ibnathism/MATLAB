function X = ludecomposition (A,B)
  ind = 0;
  n = length(A);
  L = zeros(n,n);
    for k = 1:n,
      L(k,k) =1;
    end;
  for i = 1:n-1,
      
    %forward elimination
    for j = i+1: n,
      fac = A(j,i)/A(i,i);
      A(j,:) = A(j,:)-((A(i,:)/A(i,i))*A(j,i));
      L(j,i) = fac;
    end;
  end;
  
    
    U = A;
    %Forward substitution
   Y(1) = B(1);
 for i = 2 : n
   sum=0;
   for j = 1 : i-1 
     sum=sum+(L(i,j)*Y(j));
   end
   Y(i) = B(i)- sum;
  end
  Y = Y';
  
  %backward substitution
  X(n)=Y(n)/U(n,n);
 for i = n-1 : -1 : 1
   sum=0;
   for j=i+1 : n
     sum=sum+(U(i,j)*X(j));
   end
   X(i)=(Y(i)-sum)*1.0/U(i,i);
 end
 
 X = X';
   
   
endfunction
