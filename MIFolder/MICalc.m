function [MI] = MICalc(normDFOF,Parameter)
    MI = zeros(1,size(normDFOF,1));
    bins = 0:0.05:1;
    T = size(normDFOF,2);
    tmp2 = discretize(mat2gray(Parameter),bins);
    for roi = 1:size(normDFOF,1)
        roi/size(normDFOF,1);
        tmp = normDFOF(roi,:);
        tmp = discretize(mat2gray(tmp),bins);
        for x = unique(tmp2)
            Xisx = tmp2 == x;
            P_x = sum(Xisx)/T;
            for y = unique(tmp)
                Yisy = tmp == y;
                P_y = sum(Yisy)/T; 
                P_xy = sum(Yisy & Xisx)/T;
                term = P_xy*log(P_xy/(P_x*P_y));
                term(isnan(term)) = 0;
                MI(roi) = MI(roi) + term;
            end
        end
    end
end