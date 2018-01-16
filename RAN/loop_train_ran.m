function ran = loop_train_ran(ran, x, y)

pratical_output = rbfnet(ran, x);

current_error = y - pratical_output;

if ran.hidden_dimension == 0
    current_min_distance = ran.parameter.DISTANCE_MAX;
else
    overall_distance = dist(ran.unit_centers', x);
    current_min_distance = min(overall_distance);
end

if norm(current_error) >= ran.parameter.ERROR_THRESHOLD && ...
        current_min_distance >= ran.parameter.distance_threshold
    ran = AddHiddenUnit(ran, x, current_error, current_min_distance);
else
    ran = FineTuning(ran, x, y);
end

if ran.parameter.distance_threshold > ran.parameter.DISTANCE_MIN
    ran.parameter.distance_threshold = ran.parameter.distance_threshold * ran.parameter.DECAY_CONSTANT;
else
    ran.parameter.distance_threshold = ran.parameter.DISTANCE_MIN;
end

ran.hidden_dimension_record = [ran.hidden_dimension_record, ran.hidden_dimension];

end