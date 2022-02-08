% Q6 - Implementation of the game Slakes and Ladders
game_turns = zeros(1,400); % can win in 1 to 400 turns;
runs = 100000;
figure('Name','Plots of PMF \ CDF as function of number of steps to victory');

%% Computing the PMF of number of steps to victory
for i = 1:runs
    cur_game = SnakesAndLadders();
    game_turns(cur_game) = game_turns(cur_game) + 1;
end

turns_pmf = double(game_turns)/runs;
subplot(2,1,1); stem(1:400,turns_pmf);
title('PMF of number of steps to victory');
xlabel('Number of steps to victory');
ylabel('PMF');

%% Computing the CDF of number of steps to victory
turns_cdf = game_turns;
for i = 2:400
    turns_cdf(i) = turns_cdf(i) + turns_cdf(i-1);
end

turns_cdf = double(turns_cdf)/runs;
subplot(2,1,2); stairs(turns_cdf); % CDF of Discrete time is stairs function
title('CDF of number of steps to victory');
xlabel('Number of steps to victory');
ylabel('CDF');

turns_E = 0; % mean

% The mean of the number of throws to victory
for i = 1:400
    turns_E = turns_E + i *turns_pmf(i);
end

turns_E