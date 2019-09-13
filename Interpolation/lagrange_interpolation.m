function out=lagrange_interpolation(p,x,y)

n=size(x,2);
L=ones(n,size(p,2));
if (size(x,2)~=size(y,2))
   fprintf(1,'\nERROR!\nPOINTX and POINTY must have the same number of elements\n');
else
   for i=1:n
      for j=1:n
         if (i~=j)
            L(i,:)=L(i,:).*(p-x(j))/(x(i)-x(j));
         end
      end
   end
   z = zeros(n);
   for i=1:n
      z(i)=z(i)+y(i)*L(i,:);
   end
   out = z;
end