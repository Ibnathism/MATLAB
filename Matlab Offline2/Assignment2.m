shampooFileName = 'shampoo.csv';
shampooData = csvread(shampooFileName,1,0);

time = transpose(shampooData(:,1));
sales=transpose(shampooData(:,2));
figure;
plot1 = scatter(time,sales,100);
plot1_colorBar = colorbar;
xlabel('Time');
ylabel('Shampoo Sales');
hold on;
%%%%%Setting Up Zero Removed Perfect Data Sets for Interpolation%%%%%
sizeT=size(time);
sizeT=sizeT(2);
zeroRemovedSales=sales(sales~=0);
j=1;
k=1;

for i=1:sizeT
    
    if sales(i)~=0
        zeroRemovedTime(1,j)=time(1,i);
        j=j+1;
    else
        missingTime(k)=time(i);
         k=k+1;
    end
        
end
%%%%%%%%%%%%%%%%%
j=1;
k=1;

missingSalesLinSpline=zeros(1,length(missingTime));
for i=1:sizeT
    
    if sales(i)==0
       missingSalesLinSpline(k)=linear_spline(zeroRemovedTime,zeroRemovedSales,time(i));
        k=k+1;
    end
end
%%plot the missing Values Predicted From Linear Spline
color = linspace(10,10,length(missingTime));
plot1 = scatter(missingTime,missingSalesLinSpline,250,color,'filled');

