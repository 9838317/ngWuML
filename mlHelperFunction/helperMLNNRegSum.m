%this function easily sums all the (parameters[i] .* parameters[i])

function [ result ] = helperMLNNRegSum( varargin )

    lenArgVec = length(varargin);

    result = 0;
    
    for i = 1:lenArgVec
        varargin{i}(1,:) = 0;
        result = result + sum(sum(varargin{i} .* varargin{i}));
    end
    
end

