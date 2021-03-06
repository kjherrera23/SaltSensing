clear variables
ID{1} = 'b';
ID{2} = 'f';
sides(1,:) = ones(1,17);
sides(2,:) = 2*ones(1,17);
sides = reshape(sides,1,[]);
T = 2000;
fcount = 1;
ff = [2,2,3,3,4,4,5,5,6,6,7,7,8,8,9,9,10,10,11,11,12,12,13,13,14,14,15,15,16,16,17,17];
%fid = [1:29];
pos = sides;
fid = ff;
clear ReReference;    
%% This will be used to construct the list of RefGrid to FloatingFrame coordinates that is contained in the registration file generated by running munger
pathname = strcat('G:\Dropbox\BRAINS\Taar12hKO\Registration\');
for i = [1:28] %fish

filename = sprintf('registration_f%d%s',fid(i),ID{pos(i)});
pathname2 = pathname;
filename2 = sprintf('F%d%s.nrrd',fid(i),ID{pos(i)});
%%
RegInfo = (importdata(strcat(pathname,filename)));
Coeffs = strsplit([RegInfo{25:end}]);
Coeffs = str2double(Coeffs);
FirstGarbage = find((Coeffs == 0) | (Coeffs > 100000000),1)
Coeffs(FirstGarbage:end) = [];
if isnan(Coeffs(end))
    Coeffs(end) = [];
end
if isnan(Coeffs(1))
    Coeffs(1) = [];
end
%Coeffs(isnan(Coeffs)) = [];

Coeffs = reshape(Coeffs(1:(end)),3,[])';

Coeffs(2:(end+1),:) = Coeffs;
First = str2double(strsplit(RegInfo{24}));
First(isnan(First)) = [];
Coeffs(1,:) = First;
tmpdims = strsplit(RegInfo{21});
dims(1) = str2double(tmpdims{3});
dims(2) = str2double(tmpdims{4});
dims(3) = (str2double(tmpdims{5}));
%Coeffs(136324:end,:) = []; %% This needs to be checked after using bigger brain. 136324 probably doesn't mean anything for ggother brains
%save(strcat(pathname,'\reformatted'),'Coeffs')
%%
%[filename3,pathname3] = uigetfile('Pick the Floating Image in original space');

%StackMatrix = double(importdata(fullfile(pathname3,filename3))); %unregistered .mat file


regimae = nrrdread(strcat(pathname2,filename2)); % corresponding registered nrrd file
%imshow(regimae(:,:,100))
Threshold = 0;%input('threshold = ')
% [filename2,pathname2] = uigetfile;
% 
% Coeffs = importdata(fullfile(pathname2,filename2));
%%
StackX = 512*0.95; % update with size of original image
StackY = 512*0.95;
StackZ = 50*4;

Reference = [Coeffs(:,2) Coeffs(:,1) Coeffs(:,3)]; 

ReReference(:,1) = StackY - Reference(:,1);
ReReference(:,2) =  StackX - Reference(:,2); %
ReReference(:,3) = Reference(:,3); %StackZ*4 -
%%
xgrid_n = dims(1);
xgrid_sz = 621; % in pixels (not microns)
ygrid_n = dims(2);
ygrid_sz = 1100; % in pixels (not microns)
zgrid_n = dims(3);
zgrid_sz = 138; % in pixels (not microns)
Xref = [linspace(0,xgrid_sz ,xgrid_n)]; % Current grids - domain of Reference in Microns
Yref = [linspace(0,ygrid_sz,ygrid_n)];
Zref = [linspace(0,zgrid_sz,zgrid_n)];

Ycoords = permute(reshape(ReReference(:,1),xgrid_n,ygrid_n,zgrid_n),[2,1,3]); % For each gridpoint in the reference brain, this is the y coordinate in test brain
% permute since grid points go across X then Y then Z
Xcoords = permute(reshape(ReReference(:,2),xgrid_n,ygrid_n,zgrid_n),[2,1,3]);
Zcoords = permute(reshape(ReReference(:,3),xgrid_n,ygrid_n,zgrid_n),[2,1,3]);


[Yr,Xr,Zr] = ndgrid(Yref,Xref,Zref); %Grids containing X,Y and Z coordinates in microns of each grid point 

intYref = griddedInterpolant(Yr,Xr,Zr,Ycoords,'spline'); % Interpolation of above (so y coordinate for all possible locations)
intXref = griddedInterpolant(Yr,Xr,Zr,Xcoords,'spline');
intZref = griddedInterpolant(Yr,Xr,Zr,Zcoords,'spline');

[umeterResY,umeterResX,umeterResZ] = ndgrid([0:1:(ygrid_sz)],[0:1:xgrid_sz],[0:1:zgrid_sz]);

Yspace = intYref(umeterResY,umeterResX,umeterResZ); % Y coordinate in temp brain for every micron stepped grid of reference brain. Domain spans reference brain
Xspace = intXref(umeterResY,umeterResX,umeterResZ);
Zspace = intZref(umeterResY,umeterResX,umeterResZ);

%% Realign the X,Y, and Z spaces
Yspace = flip(Yspace,1);
Xspace = flip(Xspace,1);
Zspace = flip(Zspace,1);
Yspace = flip(Yspace,2);
Xspace = flip(Xspace,2);
Zspace = flip(Zspace,2);

Yspace(end,:,:)= [];
Xspace(end,:,:)= [];
Zspace(end,:,:)= [];

Yspace(:,:,end) = [];
Xspace(:,:,end) = [];
Zspace(:,:,end) = [];

Yspace(regimae < Threshold) = 0;
Xspace(regimae < Threshold) = 0;
Zspace(regimae < Threshold) = 0;
%% SAVE DATA
emanhtap = flip(pathname);
isnumber = isstrprop(emanhtap, 'digit');
Convd = conv(double(isnumber),ones(1,6));
Convd(end-4:end) = [];
dvnoC = flip(Convd);
SubPath = pathname(find(dvnoC == max(dvnoC)):end);

% if exist(strcat('Data\',SubPath),'dir') ~= 7
%     mkdir('Data\',SubPath)
% end
save(strcat(pathname2,'\RegisteredPixels\',sprintf('translationf%d%s',fid(i),ID{pos(i)})),'Yspace','Xspace','Zspace')
end

% %% Everything Below is only necessary to check image
% [Xf,Yf,Zf] = ndgrid([1:1:512],[1:1:512],[1:4:200]);
% 
% CurrentFish = griddedInterpolant(Xf,Yf,Zf,StackMatrix,'nearest'); %use this to translate floating data to reference space
% %% LOOOOOOONG STEP
% 
% %%
% WarphiFish = CurrentFish(Yspace,Xspace,Zspace);
% % WarphiFish(end,:,:) = [];
% % WarphiFish(:,:,end) = [];
% %WarphiFish = flip(WarphiFish,1);
% %WarphiFish = flip(WarphiFish,2);
% % WarphiFish2(regimae < 6) = 0;
% 
% 
% %%
% % WarpFish = CurrentFish(ReReference);
% % ThreeDFish = reshape(WarpFish,203,299,91);
% % ThreeDFish = permute(ThreeDFish,[2,1,3]);
% % %% 
% % WarphiFish2 = WarphiFish - 4600;
% % WarphiFish2(WarphiFish2 > 2000) = 0;
% % WarphiFish2 = WarphiFish2/1000;
% % ok = nrrdWriter(strcat(pathname,'\Reconstruct.nrrd'),WarphiFish2,[1.0,1.0,1],[0,0,0],'raw');