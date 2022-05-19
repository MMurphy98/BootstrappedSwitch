function T = PhaseOrder(x, Fi, Fs)
%use phase order to rearrange the data
%   
    step = Fi / Fs;
    N = length(x);
    index = linspace(1,N,N);

    if (isrow(x))
        x = x';
    end

    if (isrow(index))
        index = index';
    end

    % ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

    T = array2table([index, x], "VariableNames",{'Index', 'Value'});
    
    T.PhaseOrder = mod((T.Index * step), 1);
    
    T = sortrows(T, "PhaseOrder");


end