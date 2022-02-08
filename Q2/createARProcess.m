function D = createARProcess(a)
% Help function for Q2 - Cumputing the vector D - Ar Process
% U[n] - White gaussian noise process
D = zeros(2000,1);
U = sqrt(1-a^2) * randn(2000,1); % Mean = 0 , Var = 1-a^2 = 0.36

for i = 2:length(D)
    D(i) = a*D(i-1) + U(i); % D[n] = a*D[n-1] + U[n]
end
end