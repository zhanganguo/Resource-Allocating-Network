function ran = train_ran(ran, data_x, data_y)

ran.hidden_dimension_record = [];

for index = 1 : length(data_x(1,:))
    input = data_x(:, index);
    target_output = data_y(:, index);
    
    pratical_output = rbfnet(ran, input);

    current_error = target_output - pratical_output;
    
    if ran.hidden_dimension == 0
        current_min_distance = ran.parameter.DISTANCE_MAX;
    else
        overall_distance = dist(ran.unit_centers', input);
        current_min_distance = min(overall_distance);
    end
    
    if norm(current_error) >= ran.parameter.ERROR_THRESHOLD && ...
            current_min_distance >= ran.parameter.distance_threshold
        ran = AddHiddenUnit(ran, input, current_error, current_min_distance);
    else
        ran = FineTuning(ran, input, target_output);
    end
    
    if ran.parameter.distance_threshold > ran.parameter.DISTANCE_MIN
        ran.parameter.distance_threshold = ran.parameter.distance_threshold * ran.parameter.DECAY_CONSTANT;
    else
        ran.parameter.distance_threshold = ran.parameter.DISTANCE_MIN;
    end
    
    ran.hidden_dimension_record = [ran.hidden_dimension_record, ran.hidden_dimension];
end

