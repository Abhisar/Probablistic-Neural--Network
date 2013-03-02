train1=csvread('iris_train.csv');
train1=train1(:,1:4);
input1=csvread('iris_in.csv');
input1=input1(:,1:4);
min_train=min(train1);
max_train=max(train1);
min_in=min(input1);
max_in=max(input1);
for k=.1:.9
    
    for i=1:75
    for j=1:4
        train1(i,j)=(train1(i,j)-min_train(j))/(max_train(j)-min_train(j));
        input1(i,j)=(input1(i,j)-min_in(j))/(max_in(j)-min_in(j));
    end
    end
result=zeros(1,75);

temp=zeros(1,3);
for i=1:75
    sum=0;
    for j=1:25
        sum=sum+ exp(-([(input1(i,1)-train1(j,1))^2+(input1(i,2)-train1(j,2))^2+(input1(i,3)-train1(j,3))^2+(input1(i,4)-train1(j,4))^2])/k^2);
    end
    temp(1,1)=sum/25;
    sum=0;
     for j=26:50
        sum=sum+ exp(-([(input1(i,1)-train1(j,1))^2+(input1(i,2)-train1(j,2))^2+(input1(i,3)-train1(j,3))^2+(input1(i,4)-train1(j,4))^2])/k^2);
    end
    temp(1,2)=sum/25;
    sum=0;
     for j=51:75
        sum=sum+ exp(-([(input1(i,1)-train1(j,1))^2+(input1(i,2)-train1(j,2))^2+(input1(i,3)-train1(j,3))^2+(input1(i,4)-train1(j,4))^2])/k^2);
    end
    temp(1,3)=sum/25;
    b=max(temp);
    [m1,n1]=find(temp(1,:)==b);
    result(i)=n1;
end
end
    
        
        
        
        
        
        
