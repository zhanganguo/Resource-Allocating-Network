function ran = setup_ran(parameters, input_dimension, output_dimension)

ran.parameter.DISTANCE_MAX = parameters.DISTANCE_MAX;
ran.parameter.DISTANCE_MIN = parameters.DISTANCE_MIN;
ran.parameter.OVERLAP_FACTOR = parameters.OVERLAP_FACTOR;
ran.parameter.DECAY_CONSTANT = parameters.DECAY_CONSTANT;
ran.parameter.MAX_EPOCH = parameters.MAX_EPOCH;
ran.parameter.LEARNING_RATE = parameters.LEARNING_RATE;
ran.parameter.ERROR_THRESHOLD = parameters.ERROR_THRESHOLD;
ran.parameter.distance_threshold = parameters.DISTANCE_MAX;

ran.input_dimension = input_dimension;
ran.hidden_dimension = 0;
ran.output_dimension = output_dimension;

ran.Bout = zeros(output_dimension, 1);
ran.Wout = [];
ran.unit_centers = [];
ran.spread_constants = [];

end