function output = GaussSei(A, B, G, J, e, mit)
n = numel(B);

RelApproxErr = [];
AcErr = [];
maxe=1.1*e;
ite = 0;
while (maxe>e && ite<mit)
    er1 = 0;
    er12 = 0;
    fprintf("\nCurrent Max RelApproxErrrror = %f\n\n",maxe);
    ite = ite+1;
    maxe = 0;
    for it = 1:n
        sum=0;
        for it2 = 1:n
            if it2~=it
                t = sum;
                sum = t + (A(it, it2).*G(it2));
            end
        end
        fprintf("The sum is = %d\n", sum);
        t=sum;
        sum = B(it)-t;
        t=sum;
        sum = t/A(it,it);
        relerr = (sum - G(it))/sum;
        relerr = abs(relerr)*100;
        er1 = er1 + relerr;
        acterr = (J(it)-sum)/J(it);
        acterr = abs(acterr)*100;
        er12 = er12 + acterr;
        if relerr>maxe 
            maxe = relerr;
        end
        G(it) = sum;
        G
    end
    RelApproxErr = cat(1, RelApproxErr, er1);
    AcErr = cat(1, AcErr, er12);
end
format short
I = 1:ite;
plot(I,RelApproxErr);
hold on;
plot(I,AcErr);
fprintf("Current iterations = %d\n", ite);
fprintf("Current error = %f\n", maxe);

output = G;