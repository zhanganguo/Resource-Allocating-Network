function ran = construct_ran(input_dimension, output_dimension, options)

%% 参数设置
opts.DISTANCE_MAX        = 5;                 % 最大距离阈值
opts.DISTANCE_MIN        = 0.05;               % 最小距离阈值
opts.OVERLAP_FACTOR      = 0.87;              % 重叠系数
opts.DECAY_CONSTANT      = 0.977;             % 衰减常数
opts.MAX_EPOCH           = options.numepochs; % 权值训练循环次数
opts.LEARNING_RATE       = 0.01;              % 学习率
opts.ERROR_THRESHOLD     = 0.02;              % 误差阈值
opts.distance_threshold  = opts.DISTANCE_MAX;     % 距离阈值

ran = setup_ran(opts, input_dimension, output_dimension);

end