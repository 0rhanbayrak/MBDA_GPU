% coded by: Jose Camacho - josecamacho@ugr.es
% last modification: 30/Jun/20.

function prepare_data(folder)

fname = dir([folder '/out*']);

obs_l = cell(1,length(fname));
b = importdata([folder '/weights.dat']);
weight= b.data;
var_l = strtrim(strsplit(b.textdata{:},','));

x = zeros(length(fname),length(var_l));

for i=1:length(fname)

    timestamp = strsplit(fname(i).name,'output-');
    timestamp = strsplit(timestamp{2},'.dat');
    obs_l{i} = timestamp{1};
    x(i,:) = load(strcat(folder,'/',fname(i).name));
end

save ('parsed_data.mat','x','obs_l','var_l', 'weight')

