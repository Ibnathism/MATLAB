x = [1; 2; 3; 4; 5];
y = [1; 4; 9; 16; 25];
format long
plot(x, y, 'o');
hold on;
a = 3.5;
lineA = linear_spline(x, y, a);
plot(a, lineA, 'o');
hold on;
display("value of y for (i)");
lineA

new = newton_interpolation(x, y, a);
plot(a, new, 'o');
hold on;
display("\nvalue of y for (ii)");
new


x1 = [1 : 0.1 : 5];
n = size(x1)(2);
for i = 1:n
  y1(i) = newton_interpolation(x, y,x1(i));
end
plot(x1,y1);
hold on;