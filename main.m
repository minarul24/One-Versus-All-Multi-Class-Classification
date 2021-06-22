%
%Author:     Minarul Shawon
%Date:       June 15, 2021
%

load X_iris.mat;

%Code from lab manual

X1 = X-iris(:,1:50);
Xtr1 = X1(:,1:35);
Xte1 = X1(:,36:50);
X2 = X_iris(:,51:100);
Xtr2 = X2(:,1:35);
Xte2 = X2(:,36:50);
X3 =  X_iris(:,101:150);
Xtr3 = X3(:,1:35);
Xte3 = X3(:,36:50);

%End of lab code

%Newton Criteria, setting Newton Iteration ot k=5
k =5;



