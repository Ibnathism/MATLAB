Xmeasured = [1240; 1350; 1470; 1600; 1710; 1840; 1980; 2230; 2400; 2930];
Ymeasured = [1182; 1172; 1264; 1493; 1571; 1711; 1804; 1840; 1956; 1954];

A = multiLinearReg( Xmeasured, Ymeasured);%A is the Array Of a0,a1,a2...an

Ypredicted = polyValue(A, Xmeasured);


plot(Xmeasured, Ypredicted), hold;
%printf("y = %.0d + %.0dx +%.0dx^2\n\n", A2(1), A2(2),A2(3));