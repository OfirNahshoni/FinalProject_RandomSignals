% Q1 - Computing the histograms and PDF functions of Z
figure('Name','Q1: Z = sqrt(12/N)*sum(Xi)');

%% N = 1 - Rectangle
z = zeros(10000,1);
N = 1;
a = -0.5;
b = 0.5;
for i = 1:10000
    Xi = a + (b-a)*rand(N,1);
    z(i) = sqrt(12/N)*sum(Xi);
end

subplot(3,1,1);

% The etimation of the PDF of z using Histogram
h1 = histogram(z,'Normalization','pdf','DisplayName','Histogram of Z - Estimation');
h1.NumBins = 100;

% computing the real PDF of Z, Rectangle
dt = 0.001;
a = -0.5*sqrt(12/N);
b = 0.5*sqrt(12/N);
x = [a:dt:b];
plot(x,(1/sqrt(12/N))*ones(size(x)),'Color','r','DisplayName','The real PDF of Z');
title('Rectangle for N = 1');

%% N = 2 - Triangle
z = zeros(10000,1);
N = 2;
a = -0.5;
b = 0.5;
for i = 1:10000
    Xi = a + (b-a)*rand(N,1);
    z(i) = sqrt(12/N)*sum(Xi);
end

subplot(3,1,2);

% The etimation of the PDF of z using Histogram
h2 = histogram(z,'Normalization','pdf','DisplayName','Histogram of Z = Etimation');
h2.NumBins = 100;
hold on;

% Computing the real PDF of Z ,the convolution between 2 rectangles: PDF(X1) * PDF(X2)
dt = 0.1;
a = -0.5*sqrt(12/N);
b = 0.5*sqrt(12/N);
t = a:dt:b;
x = (1/sqrt(12/N)) * double(t == t);
x = conv(x,x) .* dt;
t = -(b-a):dt:(b-a);
plot(t,x,'Color','r','DisplayName','The real PDF of Z');
title('Triangle for N = 2');
legend;

z = zeros(10000,1);
%% N = 6 - Gaussian
N = 6;
a = -0.5;
b = 0.5;

for i = 1:10000
    Xi = a + (b-a)*rand(N,1);
    z(i) = sqrt(12/N)*sum(Xi);
end

subplot(3,1,3);

% The etimation of the PDF of z using Histogram
h3 = histogram(z,'Normalization','pdf','DisplayName','Histogram of Z - Estimation');
h3.NumBins = 100;
hold on;

% Computing the real PDF of z, Gaussian
dt = 0.0001;
a = -N*0.5*sqrt(12/N);
b = N*0.5*sqrt(12/N);
x = [a:dt:b];
gauss = (1/(sqrt(2*pi))) * exp(-(x.^2)/2);
plot(x,gauss,'Color','r','DisplayName','The real PDF of Z - Gaussian');
title('Standard Gaussian for N = 6');
legend;