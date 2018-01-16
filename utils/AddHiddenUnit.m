function ran = AddHiddenUnit(ran, input, current_error, current_min_distance)
   
ran.hidden_dimension = ran.hidden_dimension + 1;
ran.unit_centers = [ran.unit_centers input];
ran.Wout = [ran.Wout current_error];
ran.spread_constants = [ran.spread_constants; ...
    ran.parameter.OVERLAP_FACTOR * current_min_distance];
    
end