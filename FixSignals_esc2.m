clear variables

path = 'C:\Users\Engert\Dropbox\BRAINS\NaClscreen\ObjectBrains\'

ID{1} = '_back';
ID{2} = '_front';
fid = [3,3,4,4,5,5,6,6,7,7,8,8,9,9,10,10,11,11,12,12];
pos = [1,2,1,2,1,2,1,2,1,2,2,1,2,1,2,1,2,1,2];
BoF{1} = 'back';
BoF{2} = 'front';
for f = 4%17:22 % 11 14 16 needs fixing

name = sprintf('signalfish%d%s.mat',fid(f),ID{pos(f)});
load(strcat(path,name))
path2 = 'C:\Users\Engert\Dropbox\BRAINS\NaClscreen\ObjectBrains\TailData';
[removedframes] =  [BoutRemoval2_Esc(path2,sprintf('F%d%s.tdms',fid(f),ID{pos(f)}(2)))];
TimePoints = 1:600;
notHere = ismember(TimePoints,removedframes);
TimePoints(notHere) = [];
if size(AllSignals,1) < 600
    AllSignals = interp1(TimePoints,AllSignals,1:600);
end
name2 = strcat('interped',sprintf('F%d%s.mat',fid(f),ID{pos(f)}(2)));
save(strcat(path,name2),'AllSignals','-v7.3');
f
end