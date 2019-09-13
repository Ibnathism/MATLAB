function rmse = RMSE(yMeasured, yPredicted)
n=size(yMeasured)
n=n(2);
rmse=0;
for i=1:n
    rmse=rmse+(yMeasured(i)-yPredicted(i))*(yMeasured(i)-yPredicted(i));
    
end
rmse=sqrt(rmse);
end