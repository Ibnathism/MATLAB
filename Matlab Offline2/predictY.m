%%%TESTED TO BE CORRECT
function y = predictY(A, X)%A is Basically The Value of The Constants a0,a1.. from polyRegress
t=size(X);
sizeY=t(1);
sizeA=size(A);
y=zeros(1,sizeY);
for i=1:sizeY

    y(i)=A(1);
    for j=2:sizeA
    y(i)=y(i)+A(j).*(X(i,j-1));
    end
    
end

end