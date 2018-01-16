function practical_output = rbfnet(ran, input)

[~, input_count] = size(input);
if (ran.hidden_dimension == 0)
    practical_output = repmat(ran.Bout, 1, input_count);
else
    spread_mat = repmat(ran.spread_constants, 1, input_count);
    overall_distance = dist(ran.unit_centers', input);
    activation = radbas(overall_distance ./ spread_mat);
    %  practical_output = ran.Wout * activation + ran.Bout;
    practical_output = bsxfun(@plus, ran.Wout * activation, ran.Bout);
end

end