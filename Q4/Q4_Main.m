% Q4 - Plotting the graphs in 19.8
ps = 0.6;
n = 0:30;

%% Figures 19.6(a+b)
% Ploting 2 neurons - Quiescent & Stimulated
figure('Name','Figures 19.6 - a,b');
% Quiescent nets of neurons
Xq = createBernoulliSequence(0.1,31);
subplot(1,2,1); stem(n,Xq);
title('19.6a - Quiescent neuron');
ylabel('x[n]');
xlabel('n');

% Stimulated net of neurons
Xs = createBernoulliSequence(0.6,31);
subplot(1,2,2); stem(n,Xs);
title('19.6b - Stimulated neuron');
ylabel('x[n]');
xlabel('n');

%% Figures 19.7(a+b)
% Ploting cross correlation of unconnected neurons nets & connected neurons
% nets
figure('Name','Figures 19.7 - a,b');
% Unconnected neuron
k = -4:4;
subplot(1,2,1);
r12_unconnected = (ps^2) * ones(length(k),1);
stem(k,r12_unconnected);
title('Figure 19.7a - Unconnected neurons');
ylabel('rX1X2[k]');
xlabel('k');

% Two connected nets of neurons
n0 = 2;
r12_connected = r12_unconnected;
r12_connected(n0+5)  = r12_connected(n0+5) + ps*(1-ps);
subplot(1,2,2);
stem(k,r12_connected);
title('Figure 19.7b - Connected neurons in n0=2');
ylabel('rX1X2[k]');
xlabel('k');

%% Figures 19.8(a+b+c)
% Ploting 3 WSS random processes = 3 nets of neurons
figure('Name','Figures 19.8 - a,b,c');
X1 = createBernoulliSequence(0.6,31);
X2 = createBernoulliSequence(0.6,31);
X3 = zeros(31,1);
X3(n0+1:end) = X1(1:end-n0); % X3[n] = X1[n-n0]

subplot(1,3,1); stem(n,X1);
title('Figure 19.8a - Neuron 1');
ylabel('x1[n]');
xlabel('n');
subplot(1,3,2); stem(n,X2);
title('Figure 19.8b - Neuron 2');
ylabel('x2[n]');
xlabel('n');
subplot(1,3,3); stem(n,X3);
title('Figure 19.8c - Neuron 3');
ylabel('x3[n]');
xlabel('n');

%% Figures 19.9(a+b)
% Cross correlation estimation of 2 Processess (2 nets of neurons)
figure('Name','Figures 19.9 - a,b');
k = -5:5;
N = 31;
% Cross correlation of unconnected Processes X1 & X2
rX1X2_estimation = estimateR(X1,X2);
subplot(1,2,1); stem(k,rX1X2_estimation(11:21));
title('Figure 19.9a - Cross Correlation estimated of Unconnected neurons X1 , X2');
ylabel('rX1X2  estimation[k]');
xlabel('k');

% Cross correlation of connected Processes X1 & X3
rX1X3_estimation = estimateR(X1,X3);
subplot(1,2,2); stem(k,rX1X3_estimation(11:21));
title('Figure 19.9b - Cross Correlation estimated of Connected neurons X1 , X3');
ylabel('rX1X3  estimation[k]');
xlabel('k');