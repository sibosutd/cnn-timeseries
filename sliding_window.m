% use sliding window to generate data
clear all;
clc;

list = dir('data_csv/*.csv');
num = length(list);

WIN_SIZE = 30;

data = [];
labels = [];
set = [];

for i = 1 : num
    % get file name
    fname = list(i, 1).name;
    disp(['Reading' fname '...']);
    fdata = csvread(['data_csv/' fname]);
    for j = 1 : (size(fdata, 1) - WIN_SIZE + 1)
        fdataall(:,:,1,j) = fdata(j:(j+WIN_SIZE-1), :);
        labels = [labels ceil(i/10)];
        if mod(i, 10) ~= 0
            set = [set 1];
        else 
            set = [set 3];
        end
    end
    data = cat(4, data, fdataall);
end

imdb.images.data = single(data);
% imdb.images.data_mean = single(mean(data(:,:,:,set == 1), 4));
imdb.images.labels = labels;
imdb.images.set = set;

imdb.meta.sets = {'train', 'val', 'test'} ;
imdb.meta.classes = arrayfun(@(x)sprintf('%d',x),0:19,'uniformoutput',false) ;

% save imdb
save('data/imdb.mat', '-struct', 'imdb') ;
