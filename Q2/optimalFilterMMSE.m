function h = optimalFilterMMSE(a,p)
% Q2.1 - Returns the coefficients vector of the Optimal Filter

h = zeros(p,1); % Column vector - Coefficients of the Optimal Filter
rX = zeros(p); % p on p matrix - Auto correlation of X
rXD = zeros(p,1); % Column vector - Cross correlation of X & D

for i = 1:p
    for j = 1:p
        % Computing the auto correlation of X
        rX(i,j) = a^abs(i-j) + (i == j); % i-j=k , (i==j) -> 0 or 1
    end
    % Cumputing the cross correlation of X and D
    rXD(i) = a^abs(i-1);
end
h = linsolve(rX,rXD);
end