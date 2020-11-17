[filename,pathname] = uigetfile('*.txt');
ImageData = textread(strcat(pathname,filename));
%%
Z_loc = ImageData(:,3);                             
No_Slices = find(Z_loc == Z_loc(1));
No_Slices = No_Slices(2) - 1; %% Calculates number of slices

Slice_positions = Z_loc(1:No_Slices);

Fixed_Z_loc = mod(ImageData(:,1),No_Slices);
UniqueFrames = ImageData(:,1);
%%
FileList = dir(strcat(pathname));
FileList(1:2) = [];
[i,y] = sort([FileList.datenum]);
SortedFL = FileList(y);
%%
for z = 1:No_Slices
    tps{z} = UniqueFrames(((Z_loc == Slice_positions(z))));
%     skippedframes{z} = find(diff(tps{z}) > No_Slices)+1;
%     append = 0:(length(skippedframes{z})-1);
%     skippedframes{z} = skippedframes{z} + append';
end
% tps tells us what file numbers we need to go to in order to find each tp
% of ever z position
%%
% delete(gcp)
% cluster = parcluster('local')
% cluster.NumWorkers = 18;
% parpool('local',18)
% Stack = zeros(2048,2048,No_Slices);
% parfor z = 1:No_Slices
%     z
%     t = 0;
%     CurrentFrame = zeros(2048,2048);
%     for image_no = [tps{1,z}]'
%         t = t+1;
%         CurrentFrame = CurrentFrame + (1/length(tps{1,z}))*double(imread(fullfile(pathname,SortedFL(image_no).name)));
%     end
%     Stack(:,:,z) = CurrentFrame;
% end
% %% Save Each Slice
% for z = 1:No_Slices
%     imwrite(uint16(Stack(:,:,z)),strcat('Data\101415\Hi_Res\Plane_',num2str(z,'%03d'),'.tif'))
% end
% Save Movies
delete(gcp)
cluster = parcluster('local')
cluster.NumWorkers = 6;
parpool('local',6)
%%
%path2 = 'T:\2017_03_20\GC6f_f1_cl\subMovie\';
 for i = 1:size(SortedFL,1)
    bad(i) = ismember('b',SortedFL(i).name);
 end

if sum(bad) == 1
    ind = find(bad);
    SortedFL(ind) = [];
end
%%
parfor z=1:50%No_Slices%floor(No_Slices/2)%floor(No_Slices/2):No_Slices
 if ~ismember(z,51)
     ouputFile = [pathname,sprintf('Fish1_back_slice%02d.tif',z)];
    z
    t = 0;
    x1 = 800;
    x2 = 1200;
    y1 = 500;
    y2 = 900;
    Movie = zeros(512,512,length([tps{1,z}]),'uint16');
    tmp = zeros(512,512,3,3600,'uint16');
    for image_no = [tps{1,z}(2:end)]'
        t = t+1
        Movie(:,:,t) = imread(fullfile(pathname,SortedFL(image_no).name));
    end
    %h5create([pathname,sprintf('%02d.hd5f',z)],'Slice',Inf)
    %h5write([pathname,sprintf('%02d.hd5f',z)],'Slice',Movie);
    isave(pathname,z,Movie);
    
    %subMovie = Movie(y1:y2,x1:x2,:);
    %isave(path2,z,subMovie);
    end
end
%%
for i = 1:size(SortedFL,1)
    bad(i) = ismember('b',SortedFL(i).name);
end
%save(strct(pathname,'Movies\Errors'),'skippedframes');