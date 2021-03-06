add_path();
model_name = 'imagenet-resnet-152-dag';
save_prefix = ['feature/oxford_building/',model_name,'_'];
file_name = importdata('feature/oxford_building/file_name.mat');
for i=1:numel(file_name)
    file_name{1,i} = ['data/oxbuild_images/',file_name{1,i}];
end
range = [5 9 16 17 19 21];
network = load(['model/',model_name,'.mat']);
if isfield(network,'vars')
    network = dagnn.DagNN.loadobj(network);
    network.mode = 'test';
    network.conserveMemory = false;
end
get_feature(file_name,range,save_prefix,network);

