function currentcon = SaltGrab2(y,t,AgarCon)
    peak_setpoints = AgarCon*[0,0.4,0.7,0.1,0.13,0.15];
    peak_t = interp1(60*[0,12,24,36,48,60],peak_setpoints,t,'spline');
    %ysetpoints = peak_t*linspace(0,1,11);
    currentcon = peak_t*1/(1+exp(-1*(y-5)));% interp1(0:10,ysetpoints,y);
end