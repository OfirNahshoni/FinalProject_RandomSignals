function rX1X2 = estimateR(X1,X2)
% Function for Q4 - Computing Cross Correlation of 2 signals X1,X2
k = -15:15;
N = 31;
rX1X2 = zeros(length(k),1);

for i = 1 : length(k)
    if k(i) < 0
        for n = abs(k(i)):N-1
            rX1X2(i) = rX1X2(i) + (1/(N-abs(k(i)))) * X1(n)*X2(n + k(i)+1);
        end
    else
        for n = 1:(N-k(i))
            rX1X2(i) = rX1X2(i) + (1/(N-k(i))) * X1(n) * X2(n+k(i));
        end
    end
end
end