%--------- loading csv file ------------
%saving filename
TrainFileName = 'train.csv';
%reading the csv file = TrainFileName, from 2nd row = 1 and 1st column = 0 
TrainData = csvread(TrainFileName,1,0);

%--------- creating plot ----------------
%loading data
longitude = transpose(TrainData(:,1));
latitude = transpose(TrainData(:,2));
totalRooms = transpose(TrainData(:,3));
totalBedRooms = transpose(TrainData(:,4));
population = transpose(TrainData(:,5));
houseHolds = transpose(TrainData(:,6));
medianHouseHoldValue = transpose(TrainData(:,7)); 

%TASK 1:plotting longitude vs latitude
plot1 = scatter(longitude,latitude,population.*0.07,medianHouseHoldValue,'filled');
plot1_colorBar = colorbar;
colormap('jet');
plot1_colorBar.Label.String = 'Mean Household Value';
xlabel('longitude');
ylabel('latitude');

%TASK 2: Multilinear Regression
X=[longitude;latitude;totalRooms;totalBedRooms;population;houseHolds];
format short g
A=multiLinearRegression(X,medianHouseHoldValue);
%X = [ones(size(longitude)) ;longitude ;latitude ;totalRooms ;totalBedRooms ;population ;houseHolds];
%y=medianHouseHoldValue;
%A2 = regress(transpose(y),transpose(X))    % Removes NaN data

fprintf("Equation y=%d +%dx1 +%dx2 +%dx3 +%dx4 +%dx5 +%dx6  ",A(1),A(2),A(3),A(4),A(5),A(6),A(7));

%TASK3 : RMSE
testFileName = 'test.csv';
testData = csvread(testFileName,1,0);
%loading Test Data
test_longitude = transpose(testData(:,1));
test_latitude = transpose(testData(:,2));
test_totalRooms = transpose(testData(:,3));
test_totalBedRooms = transpose(testData(:,4));
test_population = transpose(testData(:,5));
test_houseHolds = transpose(testData(:,6));
test_medianHouseHoldValue = transpose(testData(:,7)); 
testX=[test_longitude;test_latitude;test_totalRooms;test_totalBedRooms;test_population;test_houseHolds];
format long ;
medianHouseHoldValuePredicted=predictY(A,transpose(testX));

testRMSE=RMSE(test_medianHouseHoldValue,medianHouseHoldValuePredicted);


