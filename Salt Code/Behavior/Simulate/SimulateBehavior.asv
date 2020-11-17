Xwidth=2;
Ywidth=10;
Fcount = 48;
AgarList = [0,50,100,150,200,300,400];%-400,-100,-10,0];%
SlopeList = [0,0.125,0.25,0.5,1,2,4,8,16];
%,length(SlopeList));
usingDelta = 1;
if ~usingDelta
    SlopeList = SlopeList/100;
end
% DeltaDs = [];
% AllSs = [];
for i = 1:9
    PI{i} = zeros(Fcount,length(AgarList));
end
delete(gcp('nocreate'))
cluster = parcluster('local');
cluster.NumWorkers = 9;
parpool('local',9)

for S = 6;%1:length(SlopeList)
    PI{S} = zeros(Fcount,length(AgarList));
    S
    slope=SlopeList(S);
     o_track = [];
     x_track = [];
     y_track = [];
    for con = [1,7];%1:length(AgarList)
        AgarCon = AgarList(con);
        con
        for f = 1:Fcount
            x = 1;
            y = 5;
            o = pi/2;
            count = 1;
            %x_track(count) = x;
            %y_track(count) = y;

            prev_salt = 0;
            bin = [-90:1:90];
            %slope = 1;

            for t = 0:1:3600
                curr_salt = SaltGrab(y,t,AgarCon);
                delta_salt = curr_salt - prev_salt;
                %DeltaDs =[delta_salt,DeltaDs];
                %AllSs = [AllSs,curr_salt];
                prev_salt = curr_salt;
                if usingDelta
                    if delta_salt > 0
                        P = 0.55 -slope*delta_salt;
                    else
                        P = 0.55;
                    end
                else
                    P = 0.55 -slope*curr_salt;
                end
                TurnDist = calcTurnDist(P,4.5,3.5,0.6);
                Sort = cumsum(TurnDist);
                r = rand;
                inda = find(Sort > rand,1);
                angle = bin(inda)*pi/180;
                x = x+0.1*sin(o);
                y = y+0.1*cos(o);
                if x < 0
                    x = 0;
                    angle = pi;%sign((rand>0.5)-0.5)*pi/9;
                end
                if x > 2
                    x = 2;
                    angle = pi;%sign((rand>0.5)-0.5)*pi/9;
                end
                if y < 0
                    y = 0;
                    angle = pi;%sign((rand>0.5)-0.5)*pi/9;
                end
                if y > 10
                    y = 10;
                    angle =   pi;%sign((rand>0.5)-0.5)*pi/9;
                end
                o = wrapToPi(o + angle);
                o_track(f,count) = angle;
                y_track(f,count,con) = y;
                x_track(f,count) = x;
                count = count + 1;


            end
            f;
            PI{S}(f,con) = (sum(y_track(f,:,con) > 5) - sum(y_track(f,:,con) <= 5) )/length(y_track(f,:,con));
        end
    end
end
%%
load('RealData.mat')
CMap = colormap(magma(10))
figure
hold on
axis([0 400 -1 0.3])
xticks([0 200 400])
yticks([-1 -0.5 0])
xlabel('NaCl concentration (mM)')
ylabel('Preference index')
errorbar(AgarList,RealData(1,:),RealData(2,:),'CapSize',0,'Color',[0,0,0],'LineWidth',2)
for i = 1:size(PI,2)
errorbar(AgarList,median(PI{i}(:,:),1),std(PI{i}(:,:),[],1)/sqrt(Fcount/2),'--','Color',CMap(i,:),'CapSize',0)
end

%% Plot DI water prediction
load('RealData.mat')
%CMap = colormap(magma(10))
figure
hold on
%axis([-10 5 -0.2 0.5])
xticks([-3,-2,-1, 0])
yticks([-1 -0.5 0 0.5 1])
xticklabels({'-400 mM', '-100 mM','-10 mM','0 mM'})
xlabel('NaCl concentration (mM)')
ylabel('Preference index')
%bar(AgarList,RealData(1,:),RealData(2,:),'CapSize',0,'Color',[0,0,0],'LineWidth',2)
for i = 5;%1:size(PI,3)
    newPI = squeeze(PI(:,:,i));
    bar([-3,-2,-1,0],mean(newPI,1),'FaceColor',[0.5,0.5,0.5])
    errorbar([-3,-2,-1,0],mean(newPI,1),std(newPI,[],1)/sqrt(Fcount/2),'o','Color',[0,0,0],'CapSize',0)
end
axis([-4 1 -1 1])
%%
loc_hist = [];
figure
hold on
Cmap(1,:) = [0.7,0.7,0.7];
Cmap(7,:) = [1,0.3,0.3];
for con = [1,7]
    for f = 1:size(y_track,1)
        [n,b] = hist(y_track(f,:,con),linspace(0.5,9.5,18));
        loc_hist(f,:) = n/sum(n);
    end
    mean_lh = nanmean(loc_hist);
    se_lh = nanstd(loc_hist)./sqrt(size(y_track,1)/2);
    bar((10-b)*9.5/10,mean_lh,'FaceColor',Cmap(con,:))
    errorbar((10-b)*9.5/10,mean_lh,se_lh,'ok','CapSize',0)
    axis([0 9.5 0 0.3])
end
xticks([0:3:9])
yticks([0:0.1:0.3])

%%
figure
TurnDist = calcTurnDist(0,4.5,3.5,0.6);
bar([-90:90],TurnDist)
xlabel('D0')
ylabel('P')
axis([-90 90 0 0.1])
xticks([-90:45:90])
yticks([0:0.05:0.1])

%%
compare1 = meanNA(9:27);
compare2 = meanNC(9:27);
bin = [-90:10:90];
Test=compare2;
alist = 0.05:0.05:1; %0.45
blist = 4.5;%1:0.5:8;
clist = 3.5;%2.8:0.1:4.5;
dlist = 0.6;%0.1:0.1:1.5;
Error = [];

for a = 1:length(alist)
    for b = 1:length(blist)
        for c = 1:length(clist)
            for d = 1:length(dlist)
                gram = calcTurnDist(alist(a),blist(b),clist(c),dlist(d));
                Error(a,b,c,d) = sqrt(mean((gram-Test).^2));
            end
        end
    end
    a
end

minVal = min(min(min(min(Error))));
%AllA = sum(sum(sum(Error,4),3),2);
%minVal = min(sum(sum(sum(Error,4),3),2));
[ii,jj,kk,ll] = ind2sub(size(Error),find(Error == minVal));
minb =jj; minc=kk;mind=ll;
realgram = calcTurnDist(alist(ii),blist(jj),clist(kk),dlist(ll));
figure
hold on
plot(bin,Test,'--b')
plot(bin,realgram,'b')

