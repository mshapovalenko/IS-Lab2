x = 0.1 : 1/50 : 1;
d = (1 + 0.6*sin(2*pi*x/0.7)+0.3*sin(2*pi*x))/2;

w_11 = randn(1);
b_11 = randn(1);
w_12 = randn(1);
b_12 = randn(1);
w_13 = randn(1);
b_13 = randn(1);
w_14 = randn(1);
b_14 = randn(1);
w_15 = randn(1);
b_15 = randn(1);

w_21 = randn(1);
b_21 = randn(1);
w_22 = randn(1);
b_22 = randn(1);
w_23 = randn(1);
b_23 = randn(1);
w_24 = randn(1);
b_24 = randn(1);
w_25 = randn(1);
b_25 = randn(1);
y = zeros (1, 46);
for indx = 1:100000
for index = 1:46
    y_1 = 1/(1+exp(-x(index)*w_11-b_11));
    y_2 = 1/(1+exp(-x(index)*w_12-b_12));
    y_3 = 1/(1+exp(-x(index)*w_13-b_13));
    y_4 = 1/(1+exp(-x(index)*w_14-b_14));
    y_5 = 1/(1+exp(-x(index)*w_15-b_15));
    
    y(index) = y_1*w_21 + y_2*w_22 + y_3*w_23 + y_4*w_24 + y_5*w_25;
    d(index) = (1 + 0.6*sin(2*pi*x(index)/0.7)+0.3*sin(2*pi*x(index))/2);
    e(index) = d(index) - y(index);
n = 0.3;
w_21 = w_21 + n*e(index)*y_1;
w_22 = w_22 + n*e(index)*y_2;
w_23 = w_23 + n*e(index)*y_3;
w_24 = w_24 + n*e(index)*y_4;
w_25 = w_25 + n*e(index)*y_5;

b_21 = b_21 + n*e(index)*1;
b_22 = b_22 + n*e(index)*1;
b_23 = b_23 + n*e(index)*1;
b_24 = b_24 + n*e(index)*1;
b_25 = b_25 + n*e(index)*1;

delta1 = y_1*(1-y_1)*e(index)*w_21;
w_11 = w_11 + n*delta1*x(index);
delta2 = y_2*(1-y_2)*e(index)*w_22;
w_12 = w_12 + n*delta2*x(index);
delta3 = y_3*(1-y_3)*e(index)*w_23;
w_13 = w_13 + n*delta3*x(index);
delta4 = y_4*(1-y_4)*e(index)*w_24;
w_14 = w_14 + n*delta4*x(index);
delta5 = y_5*(1-y_5)*e(index)*w_25;
w_15 = w_15 + n*delta5*x(index);

b_11 = b_11 + n*delta1;
b_12 = b_12 + n*delta2;
b_13 = b_13 + n*delta3;
b_14 = b_14 + n*delta4;
b_15 = b_15 + n*delta5;
end;
end;
for index = 1:46
    y_1 = 1/(1+exp(-x(index)*w_11-b_11));
    y_2 = 1/(1+exp(-x(index)*w_12-b_12));
    y_3 = 1/(1+exp(-x(index)*w_13-b_13));
    y_4 = 1/(1+exp(-x(index)*w_14-b_14));
    y_5 = 1/(1+exp(-x(index)*w_15-b_15));
    
    y(index) = y_1*w_21 + y_2*w_22 + y_3*w_23 + y_4*w_24 + y_5*w_25;
    d(index) = (1 + 0.6*sin(2*pi*x(index)/0.7)+0.3*sin(2*pi*x(index))/2);
    e(index) = d(index) - y(index);
end;
figure, plot(x, d, 'kx', x, y, 'rx');