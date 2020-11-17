clear variables
lambda1 = 41;
lambda2 = 281;
gain = 101;
saltpower = 16;
weight = 2;
x_track =[];
y_track = [];

freq = 1;
Xwidth=2;
Ywidth=10;
PI = [];
angle = 0;
AgarList = [0,50,100,150,200,300,400];
for con = [7];%1:length(AgarList)
    AgarCon = AgarList(con)
    for f = 1:8
        x = 1;
        y = 5;
        o = 0;
        count = 1;
        x_track(f,count,1:7) = x;
        y_track(f,count,1:7) = y;
        o_track(f,count,1:7) = 0;
        OnCells = 0;
        OffCells = 0;
        count = 2;
        prev_salt = 0;
        bin = [-90:0.1:90];
        slope = 1;

        for t = 1:1:36000
            curr_salt = SaltGrab(y,t/10,AgarCon);
            
            dOndt = (curr_salt - OnCells(t))/lambda1;
            dOffdt = (1*OnCells(t) - OffCells(t))/lambda2;%(salt(t) - OffCells(t))/lambda2;
            OnCells(t+1) = OnCells(t) + dOndt + 0.0*rand;%(rand-0.5);
            OffCells(t+1) = OffCells(t) + dOffdt + 0.0*rand;%(rand-0.5);
            rate_tmp = ((OnCells(t+1))-(weight*OffCells(t+1)));
            rate = (1./(1+gain*exp(-1*rate_tmp/saltpower)));
            rate2 = (rate)*freq;%(rate-0.15)*0.2;
            %rate2(rate2<= 0) = 0.0001;
            
            
            delta_salt = rate-0.01;
            runD(t) = delta_salt;
            %prev_salt = curr_salt;
            %if delta_salt > 0
                P = 0.55 -(25*(delta_salt));
                runP(t) = P;
            %else
                %P = 0.55;
            %end
            TurnDist = calcTurnDist(P,4.5,3.5,0.6);
            if mod(t,1.3) == 0
            Sort = cumsum(TurnDist);
            r = rand;
            inda = find(Sort > rand,1);
            angle = bin(inda)*pi/180;
            x = x+0.1*sin(o);
            y = y+0.1*cos(o);
            if x < 0
                x = 1;
%                 if angle > pi/2
%                     angle = pi+(pi-angle);
%                 else
%                     angle = -1*angle;
%                 end
            end
            if x > 2
                x = 1;
                %angle = pi;
%                  if angle > (pi+pi/2)
%                     angle = 2*pi-angle;
%                 else
%                     angle = pi+(pi-angle);
%                 end
            end
            if y < 0
                y = 0;
                angle = pi;
            end
            if y > 10
                y = 10;
                angle =  pi;
            end
            o = wrapToPi(o + angle);
            o_track(f,count,con)= o;
            y_track(f,count,con) = y;
            x_track(f,count,con) = x;
            count;
            else
                o_track(f,count,con) = o_track(f,count - 1,con);
                y_track(f,count,con) = y_track(f,count - 1,con);
                x_track(f,count,con) = x_track(f,count - 1,con);
            end
            AllAngles(count) = angle;
            count = count + 1;
            
            
        end
        f
        PI(f,con) = (sum(y_track(f,:,con) > 5) - sum(y_track(f,:,con) < 5) )/length(y_track(f,:,con));
    end
end
%%
figure(1)
hold on
n =[];
for i = 1:16
    [n(i,:),b] = hist(10-y_track(i,:,7),[1:0.5:10]);
    n(i,:) = n(i,:)/sum(n(i,:));
end
errorbar(b,mean(n),std(n)/sqrt(8))