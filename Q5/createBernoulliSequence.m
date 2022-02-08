function brenoulli_arr = createBernoulliSequence(p,N)
% Returning sequence of bernoulli random process with propability p to get 1
    brenoulli_arr = zeros(1,N);
    for i = 1:N
        brenoulli_arr(i) = rand() <= p ;
    end
end