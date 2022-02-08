% Question 2 - Computing the Optimal Filter that minimizes the MSE
% D[n] = a * D[n-1] + U[n] - AR Process AR: rD = Var(U) * a^k/(1-a^2)
% U[n] - White gaussian noise process
% V[n] - White noise process
% X[n] = D[n] + V[n]
% h[k] - Coefficients vector of the optimal filter
% D_assessor[n] - Column vector - Result from filtering X[n]
% mse - Column vector, represents the MSE's
figure('Name','Q2: Optimal Filter h[k] minimizes the MSE');

%% Q2.2 - Simulation of a=0.8 and different values of p
a = 0.8;
mse = ones(20,1);

D = createARProcess(a);
V = randn(2000,1); % Mean = 0 , Var = 1
X = D + V;

for p = 1:20
    h = optimalFilterMMSE(a,p);
    D_assessor = createAssessor(h,X,p);
    mse(p) = mean((D(21:end) - D_assessor(21:end)).^2);
end

subplot(1,2,1); plot(mse);
title('MSE as function of p');
ylabel('mse(p)');
xlabel('p');

%% Q2.3 - Simulation of different values of a and p=10
a = 0.1:0.1:0.9;
p = 10;
mse = zeros(length(a),1);

for i = 1:length(a)
    h = optimalFilterMMSE(a(i),p);
    D = createARProcess(a(i));
    V = randn(2000,1); % Mean = 0 , Var = 1
    X = D + V;
    D_assessor = createAssessor(h,X,p);
    mse(i) = mean((D(21:end) - D_assessor(21:end)).^2);
end

subplot(1,2,2); plot(a,mse);
title('MSE as function of a');
ylabel('mse(a)');
xlabel('a');