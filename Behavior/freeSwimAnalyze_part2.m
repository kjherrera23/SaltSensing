%%
clear variables
Part1 =  load('E:\2017_FreeSwimming\2017_FreeSwimming\0 mM\2017_09_05\Results.mat');
Part2 =  load('E:\2017_FreeSwimming\2017_FreeSwimming\0 mM\2017_09_06\Results.mat');
Part3 =  load('E:\2017_FreeSwimming\2017_FreeSwimming\0 mM\2017_09_09\Results.mat');
Part4 =  load('E:\2017_FreeSwimming\2017_FreeSwimming\0 mM\2017_09_11\Results.mat');
Salt0 = [Part1.AllFish2,Part2.AllFish2,Part3.AllFish2,Part4.AllFish2];

Part1 =  load('E:\2017_FreeSwimming\2017_FreeSwimming\50 mM\2017_09_18\Results.mat');
Part2 =  load('E:\2017_FreeSwimming\2017_FreeSwimming\50 mM\2017_09_19\Results.mat');
Salt50 = [Part1.AllFish2,Part2.AllFish2];
Salt50(1) = [];

Part1 =  load('E:\2017_FreeSwimming\2017_FreeSwimming\100 mM\2017_09_06\Results.mat');
Part2 =  load('E:\2017_FreeSwimming\2017_FreeSwimming\100 mM\2017_09_08\Results.mat');
Part3 =  load('E:\2017_FreeSwimming\2017_FreeSwimming\100 mM\2017_09_13\Results.mat');
Salt100 = [Part1.AllFish2,Part2.AllFish2,Part3.AllFish2];

Part1 =  load('E:\2017_FreeSwimming\2017_FreeSwimming\150 mM\2017_09_11\Results.mat');
Part2 =  load('E:\2017_FreeSwimming\2017_FreeSwimming\150 mM\2017_09_14\Results.mat');
Part3 =  load('E:\2017_FreeSwimming\2017_FreeSwimming\150 mM\2017_09_19\Results.mat');
Salt150 = [Part1.AllFish2,Part2.AllFish2,Part3.AllFish2];

Part1 =  load('E:\2017_FreeSwimming\2017_FreeSwimming\200 mM\2017_09_05\Results.mat');
Part2 =  load('E:\2017_FreeSwimming\2017_FreeSwimming\200 mM\2017_09_08\Results.mat');
Part3 =  load('E:\2017_FreeSwimming\2017_FreeSwimming\200 mM\2017_09_13\Results.mat');
Part4 =  load('E:\2017_FreeSwimming\2017_FreeSwimming\200 mM\2017_09_19\Results.mat');
Salt200 = [Part1.AllFish2,Part2.AllFish2,Part3.AllFish2,Part4.AllFish2];

Part1 =  load('E:\2017_FreeSwimming\2017_FreeSwimming\300 mM\2017_09_05\Results.mat');
Part2 =  load('E:\2017_FreeSwimming\2017_FreeSwimming\300 mM\2017_09_06\Results.mat');
Part3 =  load('E:\2017_FreeSwimming\2017_FreeSwimming\300 mM\2017_09_14\Results.mat');
Part4 =  load('E:\2017_FreeSwimming\2017_FreeSwimming\300 mM\2017_09_18\Results.mat');
Part5 =  load('E:\2017_FreeSwimming\2017_FreeSwimming\300 mM\2017_09_20\Results.mat');
Salt300 = [Part3.AllFish2,Part4.AllFish2,Part5.AllFish2];%[Part1.AllFish2,,Part2.AllFish2];
Salt300(1) = [];

Part1 =  load('E:\2017_FreeSwimming\2017_FreeSwimming\400 mM\2017_09_05\Results.mat');
Part2 =  load('E:\2017_FreeSwimming\2017_FreeSwimming\400 mM\2017_09_06\Results.mat');
Part3 =  load('E:\2017_FreeSwimming\2017_FreeSwimming\400 mM\2017_09_13\Results.mat');
Salt400 = [Part1.AllFish2,Part2.AllFish2,Part3.AllFish2];

Temp{1} = Salt0;
Temp{2} = Salt50;
Temp{3} = Salt100;
Temp{4} = Salt150;
Temp{5} = Salt200;
Temp{6} = Salt300;
Temp{7} = Salt400;

%%
Part1 =  load('E:\2017_FreeSwimming\2017_FreeSwimming\Ontogeny\4 dpf\0 mM\2017_09_23\Results.mat');
Part2 =  load('E:\2017_FreeSwimming\2017_FreeSwimming\Ontogeny\4 dpf\0 mM\2017_09_25\Results.mat');
Salt_4dpf_0mM = [Part1.AllFish2,Part2.AllFish2];

Part1 =  load('E:\2017_FreeSwimming\2017_FreeSwimming\Ontogeny\4 dpf\200 mM\2017_09_23\Results.mat');
Part2 =  load('E:\2017_FreeSwimming\2017_FreeSwimming\Ontogeny\4 dpf\200 mM\2017_10_11\Results.mat');
Salt_4dpf_200mM = [Part1.AllFish2,Part2.AllFish2];

Part1 =  load('E:\2017_FreeSwimming\2017_FreeSwimming\Ontogeny\5 dpf\0 mM\2017_09_24\Results.mat');
Salt_5dpf_0mM = [Part1.AllFish2];

Part1 =  load('E:\2017_FreeSwimming\2017_FreeSwimming\Ontogeny\5 dpf\200 mM\2017_09_24\Results.mat');
Salt_5dpf_200mM = [Part1.AllFish2];

Part1 =  load('E:\2017_FreeSwimming\2017_FreeSwimming\Ontogeny\6 dpf\0 mM\2017_09_25\Results.mat');
Salt_6dpf_0mM = [Part1.AllFish2];

Part1 =  load('E:\2017_FreeSwimming\2017_FreeSwimming\Ontogeny\6 dpf\200 mM\2017_09_25\Results.mat');
Salt_6dpf_200mM = [Part1.AllFish2];

Temp2{1} = Salt_4dpf_0mM;
Temp2{2} = Salt_4dpf_200mM;
Temp2{3} = Salt_5dpf_0mM;
Temp2{4} = Salt_5dpf_200mM;
Temp2{5} = Salt_6dpf_0mM;
Temp2{6} = Salt_6dpf_200mM;
%% Concentration plots
PI3 = [];
PI_std = [];
test = [1:7];
AllCons = [0,50,100,150,200,300,400];
H = [];
if length(test) > 1
    scale = 1/(length(test) - 1);
else
    scale = 0;
end
for conc = test
    AllX3 = [];
    PI4 = [];
    C = colormap(parula(10));%[0,0,0;0.2,0.2,0.2;1,5*scale,5*scale;1,4*scale,4*scale;1,3*scale,3*scale;1,2*scale,2*scale;1,0,0];
    AllFish2 =Temp{conc};
    noMove = [];
    for i = 1:size(AllFish2,2)
        dist = (sqrt(sum(diff(AllFish2(i).data(:,[1,2])).^2,2)));
        noMove(i) = sum(dist == 0)/length(dist);

    end
    AllFish2(noMove > 0.9) = [];

    AllX{conc} = [];
    AllY = [];
    PI_t = [];

    bins = [1:5000:300000];
    for b = 1:(length(bins)-1)
    PI_indiv = [];
    count = 1;
     for i = 1:length(AllFish2)
        if bins(b+1) < length(AllFish2(i).data)

        currFish = AllFish2(i).data(bins(b):bins(b+1),1);
        AllX{conc} = vertcat(AllX{conc},AllFish2(i).data(bins(b):bins(b+1),1));
        AllX2{conc}{i} = AllFish2(i).data(bins(1):bins(length(bins)),1);
        AllY = vertcat(AllY,AllFish2(i).data(bins(b):bins(b+1),2));
        PI2 = currFish < 495;
        PI_indiv(count) = (sum(PI2) - sum(~PI2))/length(PI2);%mean(currFish(~isnan(currFish)));%
        count = count + 1;
        end
        AllX3 = AllFish2(i).data(:,1);
        tmp = AllX3 <495;
        %tmp(1:floor(length(tmp)/2)) = [];
        PI4(count-1) = (sum(tmp) - sum(~tmp))/length(tmp);
     end
     hi = 1;
    PI = AllX{conc} <495;
    %pi(b,:) = PI_indiv;
    PI3(b,conc) = (sum(PI) - sum(~PI))/length(PI);
    PI_t(b,conc) = mean(PI_indiv);
    PI_std(b,conc) = std(PI_indiv)/sqrt(length(PI_indiv));
    PI_F(conc) = mean(PI4(2:end));
    PI_Fstd(conc) = std(PI4(2:end))/sqrt(length(PI4(2:end)));
    end
    IndivPI{conc} = PI4;
    hi2 = 1;
    figure(1)
    hold on
    c = C(conc,:);
    x = bins(1:(end-1))/(60*1000/12)+mean(diff(bins))/(60*2000/12);
    y1 = (PI3(:,conc)+PI_std(:,conc));
    y2 = (flip(PI3(:,conc)-PI_std(:,conc)));
    fill([x,flip(x)],[y1',y2'],C(conc,:)/4+0.5);
    h{conc} = plot(x,(PI3(:,conc)),'Color',C(conc,:),'LineWidth',3);
    axis([0 60 -1 1]);
    H =[H,h{conc}];
end
%%
for conc = [1:7]
    figure(1)
    hold on
    c = C(conc,:);
    x = bins(1:(end-1))/(60*1000/12)+mean(diff(bins))/(60*2000/12);
    y1 = (PI3(:,conc)+PI_std(:,conc));
    y2 = (flip(PI3(:,conc)-PI_std(:,conc)));
    fill([x,flip(x)],[y1',y2'],C(conc,:)/4+0.5);
    h{conc} = plot(x,(PI3(:,conc)),'Color',C(conc,:),'LineWidth',3);
    axis([0 60 -1 1]);
    H =[H,h{conc}];
end
yticks([-1:0.5:1])
xticks([0:15:60])
xlabel('Time (min)')
ylabel('Preference Index')
%%
clear PI
figure(1)
%legend(H,{'0 mM', '50 mM', '100 mM','150 mM','200 mM','300 mM','400 mM'})
xlabel('Time (min)')
ylabel('PI')
figure(2)
%errorbar(AllCons(test),(mean(PI3(:,test))),PI_Fstd(test),'k','LineWidth',3)
errorbar(AllCons(test),PI_F(test),PI_Fstd(test),'k','LineWidth',2,'CapSize',0)
load('Simulate\SimPIs.mat')
hold on
errorbar(AllCons(test),mean(PI),std(PI)/sqrt(size(PI,1)),'Color',[0.5,0.5,0.5],'LineWidth',2,'CapSize',0)
legend('Data','Simulation')
axis([0 400 -1 1])
yticks([-1:0.5:1])
xticks([0:100:400])
xlabel('Agar NaCl concentration (mM)')
ylabel('Preference Index')
RealData = vertcat(PI_F,PI_Fstd);
%%
close all
% figure(1)
% %legend(H,{'0 mM', '50 mM', '100 mM','150 mM','200 mM','300 mM','400 mM'})
% xlabel('Time (min)')
% ylabel('PI')
figure(2)
x = [100:100:800];
%errorbar(AllCons(test),(mean(PI3(:,test))),PI_Fstd(test),'k','LineWidth',3)
%bar(x,PI_F(test),'FaceColor',[0.6,0.6,0.6])
hold on
x = [100,0,0,0,0,0,200];
count = 1;
for f = test
    tmp = IndivPI{f};%AllBins{f} - 0;%AllBins{f}(1,:);
    MEAN(count) = mean(tmp(end,:));
    STD(count) = std(tmp(end,:))/sqrt(length(tmp(end,:)));
    bar(x(f),MEAN(count),50,'FaceColor',C(f,:))
    %errorbar(x(f),MEAN,STD,'ok','LineWidth',3)
    scatter(x(f)*ones(1,length(IndivPI{f})),IndivPI{f},30,[0,0,0])
    count = count+1;
end
errorbar(x(test),MEAN,STD,'ok','LineWidth',2)
axis([0 300 -1 1])
%xlabel('Starting concentration in agar (mM)')
xtickangle(45)
xticks([100,200])
yticks([-1:0.5:1])
%xticklabels({'mCherry (-) MTZ','mCherry (+) MTZ','1 uM Copper','Neomycin pre','Neomycin post'})
xticklabels({'0 mM','400 mM','800 mM','Control 400 mM NaCl','Neomycin 400 mM NaCl','Control 20 mM putrescine','Neomycin 20 mM putrescine'})
ylabel('Preference Index')
%%
figure
hold on
for i = [1,7]
    AllN = [];
    for f = 1:length(AllX2{i})
        [n,b] = hist(AllX2{i}{f},linspace(50,950,20));
        n = n/sum(n);
        AllN(f,:) = n;
    end
    n = nanmean(AllN);
    nstd = nanstd(AllN,[],1)/sqrt(size(AllN,1));
    h{i} = bar(10.2*(b(2:end -1)/950 -0.075),(n(2:end-1)),'FaceColor',C(i,:),'LineStyle','none')%,'LineWidth',1.7)
    errorbar(10.2*(b(2:end -1)/950 -0.075),(n(2:end-1)),(nstd(2:end-1)),'o','Color',[0,0,0],'LineWidth',1,'Marker','none','CapSize',0)%,'LineWidth',1.7)
end
xlabel('Distance from NaCl agar (cm)')
ylabel('Probability')
xticks([0:3:9])
yticks([0:0.1:0.3])
legend([h{1},h{7}],[{'Fish water'},{'NaCl'}])
axis([0 9.2 0 0.3])
%%                  
%% Ontogeny plots
PI3 = [];
PI_std = [];
test = [1,2,3,4,5,6];
AllCons = [0,50,100,150,200,300,400];
H = [];
if length(test) > 1
    scale = 1/(length(test) - 1);
else
    scale = 0;
end
for conc = test
    AllX3 = [];
    PI4 = [];
    C = [0.2,0.2,0.2;1,3*scale,3*scale;1,2*scale,2*scale;1,scale,scale;1,0,0];
    AllFish2 =Temp2{conc};
    noMove = [];
    for i = 1:size(AllFish2,2)
        dist = (sqrt(sum(diff(AllFish2(i).data(:,[1,2])).^2,2)));
        noMove(i) = sum(dist == 0)/length(dist);

    end
    AllFish2(noMove > 0.7) = [];

    AllX{conc} = [];
    AllY = [];
    PI_t = [];

    bins = [1:10000:300000];
    for b = 1:(length(bins)-1)
    PI_indiv = [];
    count = 1;
     for i = 1:length(AllFish2)
        if bins(b+1) < length(AllFish2(i).data)

        currFish = AllFish2(i).data(bins(b):bins(b+1),1);
        AllX{conc} = vertcat(AllX{conc},AllFish2(i).data(bins(b):bins(b+1),1));
        AllY = vertcat(AllY,AllFish2(i).data(bins(b):bins(b+1),2));
        PI2 = currFish < 495;
        PI_indiv(count) = (sum(PI2) - sum(~PI2))/length(PI2);%mean(currFish(~isnan(currFish)));%
        count = count + 1;
        end
        AllX3 = AllFish2(i).data(:,1);
        tmp = AllX3 <495;
        %tmp(1:floor(length(tmp)/2)) = [];
        PI4(count) = (sum(tmp) - sum(~tmp))/length(tmp);
     end
    PI = AllX{conc} <495;
    %pi(b,:) = PI_indiv;
    PI3(b,conc) = (sum(PI) - sum(~PI))/length(PI);
    PI_t(b,conc) = mean(PI_indiv);
    PI_std(b,conc) = std(PI_indiv)/sqrt(length(PI_indiv));
    PI_F(conc) = mean(PI4(2:end));
    PI_Fstd(conc) = std(PI4(2:end))/length(PI4(2:end));
    end
    hi2 = 1;
    %figure(4)
    %hold on
    %c = C(conc,:);
    
    %errorbar(bins(1:(end-1))/(60*1000/12),(PI3(:,conc)),PI_std(:,conc),'Color',c);
    %h{conc} = plot(bins(1:end-1)/(60*1000/12),(PI3(:,conc)),'Color',c,'LineWidth',3);
    %axis([0 60 -1 1]);
    %H =[H,h{conc}];
end
%%
figure(3)
hold on
%errorbar(AllCons(test),(mean(PI3(:,test))),PI_Fstd(test),'k','LineWidth',3)
errorbar([4,5,6],smooth(PI_F(1:2:end))+0.1,PI_Fstd(1:2:end),'k','LineWidth',3)
errorbar([4,5,6],PI_F(2:2:end),PI_Fstd(2:2:end),'r','LineWidth',3)
axis([3.5 6.5 -0.5 0.5])
xlabel('Age (dpf)')
set(gca,'XTick',[3,4,5,6])
ylabel('PI')
legend('0 mM', '200 mM')