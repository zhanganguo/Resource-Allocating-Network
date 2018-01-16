function ran = FineTuning(ran, input, target_output)

if (ran.hidden_dimension == 0)
    ran.Bout = target_output;
    return;
end
for epoch = 1 : ran.parameter.MAX_EPOCH
    overall_distance = dist(ran.unit_centers', input);
%     current_min_distance = min(overall_distance);
    activation = radbas(overall_distance ./ ran.spread_constants);
    practical_output = ran.Wout * activation + ran.Bout;
    current_error = target_output - practical_output;
    if (norm(current_error) < ran.parameter.ERROR_THRESHOLD)
        break;
    end
    ran.Bout = ran.Bout + ran.parameter.LEARNING_RATE * current_error;
    ran.Wout = ran.Wout + ran.parameter.LEARNING_RATE * current_error * activation';
    for i = 1 : ran.hidden_dimension
        delta_unit_center = 2 * (input - ran.unit_centers(:,i))*activation(i)*ran.Wout(:,i)'*current_error/...
            (ran.spread_constants(i)^2);
        ran.unit_centers(:,i) = ran.unit_centers(:,i) + ran.parameter.LEARNING_RATE * delta_unit_center;
        
    end
end

end