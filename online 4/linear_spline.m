function out = linear_spline( x, y, p )
n = numel(x);
hold on;
for it = 1:n-1
    m(it) = (y(it+1) - y(it))/(x(it+1)-x(it));
    c(it) = (y(it) - m(it) * x(it));
    temp = x(it):0.1:x(it+1);
    temp2 = temp.*m(it) + c(it);
    plot(temp, temp2);
    hold on
    if (p<=x(it)&&p>=x(it+1))||(p>=x(it)&&p<=x(it+1))
        t1 = give_y(m(it),c(it),p);
    end
end
hold on;
out = t1;
end

