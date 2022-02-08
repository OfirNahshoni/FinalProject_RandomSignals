% Q5 - Bernoulli and Markov Processes

%% Q5.1 - Bernoulli Process for p = 0.5
figure('Name','Q5.1 - Bernoulli Process for p = 0.5');
case_A = createBernoulliSequence(0.5,50);
subplot(2,1,1); stem(1:50,case_A);
title('First Bernoulli Process');
xlabel('N');
ylabel('Case A');
case_A = createBernoulliSequence(0.5,50);
subplot(2,1,2); stem(1:50,case_A);
title('Second Bernoulli Process');
xlabel('N');
ylabel('Case A');

%% Q5.2 - Bernoulli Process for p = 0.5
figure('Name','Q5.2 - Bernoulli Process for p = 0.8');
case_B = createBernoulliSequence(0.8,50);
subplot(2,1,1); stem(1:50,case_B);
title('First Bernoulli Process');
xlabel('N');
ylabel('Case B');
case_B = createBernoulliSequence(0.8,50);
subplot(2,1,2); stem(1:50,case_B);
title('Second Bernoulli Process');
xlabel('N');
ylabel('Case B');

%% Q5.3 - Markov sequence with length N=50 for different start values
figure('Name','Markov Process with different start values');
P = [0.6 0.4;
     0.1 0.9;];
p0_C = [0.5 0.5]; % Start value for [0.5,0.5]
p0_D = [0.2 0.8]; % Start value for [0.2,0.8]

% Case C
case_C = createNMarkovSequence(p0_C,P,50);
subplot(2,1,1); stem(0:49,case_C);
title('Markov Process for start value: p0 = [0.5,0.5]');
xlabel('N');
ylabel('Case C');

% Case D
case_D = createNMarkovSequence(p0_D,P,50);
subplot(2,1,2); stem(0:49,case_D);
title('Markov Process for start value: p0 = [0.2,0.8]');
xlabel('N');
ylabel('Case D');

%% Part 4
N = [50; 100 ;1000 ;10000];
A = zeros(length(N),1);
B = zeros(length(N),1);
C = zeros(length(N),1);
D = zeros(length(N),1);

for i = 1:length(N)
    A(i) = nnz(createBernoulliSequence(0.5,N(i))) / N(i);
    B(i) = nnz(createBernoulliSequence(0.8,N(i))) / N(i);
    C(i) = nnz(createNMarkovSequence(p0_C,P,N(i)))/ N(i);
    D(i) = nnz(createNMarkovSequence(p0_D,P,N(i)))/ N(i);
end

% The Table of the propabilities to get 1 after N iterations
table(N,A,B,C,D)

% Calculate the last propability to get 1 after 10K iterations
markov_max_C = p0_C * P^N(end)
markov_max_D = p0_D * P^N(end)

% From this plot we better understand the answer needed:
% plot(createNMarkovSequence(p0_D,P,N(4)))