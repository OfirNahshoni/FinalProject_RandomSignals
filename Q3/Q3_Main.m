% Q3 - Part 1
% pd is the probability for Detected
% pfa is the probability for False Alarm
h0 = sqrt(2.5) * randn(1000,1); % var = 2.5 , mean = 0.
h1 = sqrt(2.5) * randn(1000,1) + 5; % var = 2.5 , mean = 5.
tau1 = 2.5;
conf_matrix = calcConfMatrix(h0,h1,tau1);

pd1 = conf_matrix(2,2) / 1000 % TP/(TP + FN)
pfa1 = conf_matrix(1,2) / 1000 % FP/(FP + TN)

% Q3 - Part 2
% pd is an array that contains the probabilities for Detected
% pfa is an array that contains the probabilities for False Alarm
tau2 = 1:0.1:4;
pd2 = zeros(length(tau2),1);
pfa2 = zeros(length(tau2),1);

for i = 1:length(tau2)
    conf_matrix = calcConfMatrix(h0,h1,tau2(i));
    pd2(i) = conf_matrix(2,2) / 1000; % TP/(TP + FN)
    pfa2(i) = conf_matrix(1,2) / 1000; % FP/(FP + TN)
end

% Plot Detected Propabilities as a function of False Alarm Propabilities 
plot(pfa2,pd2);
xlabel('False Positive Propability (P_{fa})');
ylabel('True Positive Probability (P_{d})');