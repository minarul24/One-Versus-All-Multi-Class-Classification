%
%Author:     Minarul Shawon
%Date:       June 15, 2021
%

load X_iris.mat;

%Code from lab manual

X1 = X_iris(:,1:50);
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

%Classification of the data sets

Xtr = [ Xtr1 Xtr2 Xtr3];
Xte = [ Xte1 Xte2 Xte3];

Y1tr = [ones(1,35) -ones(1,70)];
Y2tr = [-ones(1,35) ones(1,35) -ones(1,35)];
Y3tr = [-ones(1,70) ones(1,35)];

%Using LRBC_newton function for the binary classification
[w1,c1] = LRBC_newton(Xtr, Y1tr, k);
[w2,c2] = LRBC_newton(Xtr, Y2tr, k);
[w3,c3] = LRBC_newton(Xtr, Y3tr, k);

%Normalizing the data sets
N_w1 = sqrt(sum(w1.*w1));
N_w2 = sqrt(sum(w2.*w2));
N_w3 = sqrt(sum(w3.*w3));
w1 = w1./N_w1;
w2 = w2./N_w2;
w3 = w3./N_w3;

%
[Ytr,Itr] = max([[Xtr; ones(1,105)].'*w1, [Xtr; ones(1,105)].'*w2, [Xtr; ones(1,105)].'*w3].');
[Yte,Ite] = max([[Xte; ones(1,45)].'*w1, [Xte; ones(1,45)].'*w2, [Xte; ones(1,45)].'*w3].');

fprintf('k = %i\n',k);
%Training Confusion Matrix and Classification Accuracy
fprintf('The Confusion Matrix for Training is:');

C_tr = transpose((confusionmat([ones(35,1); 2*ones(35,1); 3*ones(35,1)], Itr)))
A_tr = trace(C_tr)./sum(C_tr, 'all')*100;
fprintf('Training Accuracy: %.2f%% \n',A_tr);
%Testing Confusion Matrix and Classification Accuracy
fprintf('The Confusion Matrix for Testing is:');
C_te = transpose((confusionmat([ones(15,1); 2*ones(15,1); 3*ones(15,1)], Ite)))
A_te = trace(C_te)./sum(C_te, 'all')*100;
fprintf('Training Accuracy: %.2f%% \n',A_te);

%%end of code
