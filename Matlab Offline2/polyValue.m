function out = polyValue(A, X)%A is Basically The Value of The Constants a0,a1.. from polyRegress
n = numel(A);
m = numel(X);
res = zeros(m,1);

for it = 1:m
    t = 0;
    for it2 = 1:n
        t = t + (A(it2).*(X(it).^(it2-1)));
    end
    res(it)=t;
end
out = res;