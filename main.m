%% Training and test data generation
train_x = 4 * rands(1, 400);
train_y = 1.1 * (1-train_x+2*train_x.^2) .* exp(-train_x.^2/2);
test_x = -4 : 0.04 : 4;
test_y = 1.1 * (1-test_x+2*test_x.^2) .* exp(-test_x.^2/2);


%% Option Settings
options.numepochs = 50;
options.batchsize = 50;

%% Construct and Train RAN
ran = construct_ran(size(train_x,1), size(train_y,1), options);
ran = train_ran(ran, train_x, train_y);

%% Test Performance
outputs = test_ran(ran, test_x);

%% Result
error = outputs - test_y;

figure;
plot(test_y, 'b');
hold on;
plot(outputs', 'r');
hold on;
plot(error, 'black');
legend('target-y', 'actual-y', 'error');



