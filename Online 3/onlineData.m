%GIVEN DATA
X = [1240; 1350; 1470; 1600; 1710; 1840; 1980; 2230; 2400; 2930];
Y = [1182; 1172; 1264; 1493; 1571; 1711; 1804; 1840; 1956; 1959];

%LINEAR REGRESSION
linA = polyRegress(@GaussJor, X, Y, 1);
linB = polyValue(linA, X);
display("Linear Regression Equation");
fprintf("y = %.0dx + %.0d\n\n", linA(1), linA(2));

plot(X, Y, 'o', X, linB), hold;

%POLYNOMIAL REGRESSION
pA = polyRegress(@GaussJor, X, Y, 2);
pB = polyValue(pA, X);
display("Polynomial Regression Equation");
fprintf("y = %.0dx^2 + %.0dx + %.0d\n\n", pA(3), pA(2), pA(1));

plot(X, Y, 'o', X, pB), hold;