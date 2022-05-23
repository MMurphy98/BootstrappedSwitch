function T = PhaseOrder(x, Fi, Fs)
%use phase order to rearrange the data;
%   x:  input data;
%   Fi: input frequency;
%   Fs: sample frequency;  

    step = Fi / Fs;
    N = length(x);
    index = linspace(1,N,N);

% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    % transpose the martix
    if (isrow(x))
        x = x';
    end

    if (isrow(index))
        index = index';
    end
    
% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    % create the table for output
    T = array2table([index, x], "VariableNames",{'Index', 'Value'});
    
    T.PhaseOrder = mod((T.Index * step), 1);
    
    % sorted the table by PhaseOrder
    T = sortrows(T, "PhaseOrder");

end