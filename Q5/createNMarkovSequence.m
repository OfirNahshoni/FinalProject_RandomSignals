function markov_arr = createNMarkovSequence(p0,P,N)
% Computing Markov Process according to propabilities matrix P
markov_arr = zeros(1,N);
markov_arr(1) = rand() <= p0(2);
for i = 2:N
    if(markov_arr(i-1) == 0)
        markov_arr(i) = rand() <= P(1,2);
    else % markov_arr(i-1) == 1
        markov_arr(i) = rand() <= P(2,2);
    end
end
end