function [Score,offset] = GcampRegress(normDFOF,Parameter)
    %gpu_normDFOF = gpuArray(normDFOF);
    %gpu_Parameter = gpuArray(Parameter);

    Score = zeros(1,size(normDFOF,1));
    roinums = (1:size(normDFOF,1));
    offset = Score;
    for roi = roinums

        [crossCore,lags] = xcorr(normDFOF(roi,:),Parameter,5,'coeff');
               
        [Score(roi),ind] = max((crossCore));
        offset(roi) = lags(ind);
    end
end