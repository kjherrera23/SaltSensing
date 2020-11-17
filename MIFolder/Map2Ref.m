function [Remapped] = Map2Ref(paramFish,transform,microscope,res)
    %% res is 0.75 for some , 0.95 for others
    paramFish = (paramFish(1:end,1:end,:));
    paramFish = double(paramFish);
    paramFish2 = zeros(size(paramFish,1)+2,size(paramFish,2)+2,size(paramFish,3)+2);
    paramFish2(2:(end-1),2:(end-1),2:(end-1)) = paramFish;
    if microscope == 2
        [Xf,Yf,Zf] = ndgrid(0.7*[0:1:513],0.7*[0:1:513],[-6,-2,2,8*[1:1:19]]);%[-2,1:8:8*(size(paramFish,3)),162]); % microns
        paramFish2 = zeros(size(paramFish,1)+2,size(paramFish,2)+2,size(paramFish,3)+2);
        paramFish2(2:(end-1),2:(end-1),2:(end-1)) = paramFish;
    else
        [Xf,Yf,Zf] = ndgrid(res*[1:1:512],res*[1:1:512],[1:4:200]);
        paramFish2 = zeros(size(paramFish,1),size(paramFish,2),size(paramFish,3));
        paramFish2 = paramFish;
    end
    if isa(paramFish,'double')
        CurrentFish = griddedInterpolant(Xf,Yf,Zf,paramFish2,'nearest');
    else
        CurrentFish = griddedInterpolant(Xf,Yf,Zf,paramFish2,'nearest');
    end
    WarphiFish = CurrentFish(transform.Yspace,transform.Xspace,transform.Zspace);
    Remapped = (WarphiFish(:,:,1:1:end));
end