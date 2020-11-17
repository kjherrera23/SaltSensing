function currentcon = SaltGrab(y,t,AgarCon)
    peak_setpoints = AgarCon*linspace(0,0.1,61);
    peak_t = interp1(60*[0:60],peak_setpoints,t);
    ysetpoints = peak_t*linspace(0,1,11);
    currentcon = interp1(0:10,ysetpoints,y);
end