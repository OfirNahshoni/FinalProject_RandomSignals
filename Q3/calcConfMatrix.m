function confussion_matrix = calcConfMatrix(h0,h1,tau)
% Help function for Q3 - Computing Cunfusion Matrix for 
confussion_matrix = zeros(2,2);
% h0 and h1 are the actual signals
%               Predicted
% matrix :  ___| N  | P  |
%   Actual { N | TN | FP |
%   Actual { P | FN | TP |

for i = 1:1000
    if(h0(i) < tau) % TN - True Negative
        confussion_matrix(1,1) = confussion_matrix(1,1) + 1;
    else % FP - False Positive
        confussion_matrix(1,2) = confussion_matrix(1,2) + 1;
    end
end

for i = 1:1000
    if (h1(i) > tau) % TP - True Positive
        confussion_matrix(2,2) = confussion_matrix(2,2) + 1;
    else % FN - False Negative
        confussion_matrix(2,1) = confussion_matrix(2,1) + 1;
    end
end
end
