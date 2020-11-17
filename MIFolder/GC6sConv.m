function [regressor] = GC6sConv(Parameter,lambda,TL)
    kernel(1:3) = [0,0.75,1];
    for t = 4:150
        kernel(t) = exp(-1*(t-3)/lambda);
    end
    
    regressor = conv(kernel,Parameter);
    regressor(TL:end) = [];
    regressor(1:150) = min(regressor);
end