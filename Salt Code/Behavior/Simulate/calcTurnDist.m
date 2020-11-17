function [Output] = calcTurnDist(a,b,c,d)
    p = a;
    n = 10000;
    Fwd = normrnd(0,b,1,ceil(n*p));   
    Turn = lognrnd(c,d,1,ceil(n*(1-p)/2));
    Turn(Turn > 90) = [];
    Turn2 = -1*lognrnd(c,d,1,ceil(n*(1-p)/2));
    Turn2(Turn2 < -90) = [];
    AllSwims = [Fwd,Turn,Turn2];
    [n] = hist(AllSwims,-90:1:90);
    Output = n/sum(n);
end