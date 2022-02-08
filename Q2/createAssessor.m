function D_assessor = createAssessor(h,X,p)
% Help function for Q2 - Creates the assessor of D
D_assessor = zeros(2000,1);

for n = 21:2000 % D Assessor
        for k = 1:p % Sum of multiply
            D_assessor(n) = D_assessor(n) + h(k) * X(n-k+1);
        end
end
end