function [Score,offset,W1,W2,HalfLife] = GcampRegress_basis(normDFOF,Parameter,rfs)
    %gpu_normDFOF = gpuArray(normDFOF);
    %gpu_Parameter = gpuArray(Parameter);
    rfs = rfs;
    res = 0.1;
    Score = zeros(1,size(normDFOF,1));
    offset = Score;
    W1 = Score;
    W2 = Score;
    HalfLife = W2;
    roinums = (1:size(normDFOF,1));
    weights = (-1:res:1);
%     roi = gpuArray(0);
%     w1 = gpuArray(-1);
%     w2 = gpuArray(-1);
    lambda = 2;
    basis1 = GC6sConv(Parameter(1,:),lambda);
    basis2 = GC6sConv(Parameter(2,:),lambda);
    for roi = roinums
        for w1 = weights
               w2 = sqrt(1 - w1.^2);
                    Regressor = w1*mat2gray(basis1(rfs)) + w2*mat2gray(basis2(rfs));
                    [crossCore,lags] = xcorr(normDFOF(roi,:),Regressor,0,'coeff');
                    %corrcoef(Parameters(1,:),normDFOF(1:299,roi))
                    tmpScore = max((crossCore));
                    if tmpScore > (Score(roi))
                        [absval,idx] = max((crossCore));
                        Score(roi) = 1*absval;
                        offset(roi) = lags(idx);
                        W1(roi) = w1;
                        W2(roi) = w2;
                        HalfLife(roi) = lambda;
                    end
                    %offset=0;
         end

      end
end