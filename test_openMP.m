% array = round(rand(1,10^3)*10^2);
% [arrayOne,arrayTwo] = divideArrayForBubbleSort(array,0);

%% without openmp
array = round(rand(1,10^3)*10^2);
newArray = sortBubble(array);

%% with openmp
array = round(rand(1,10^5)*10^2);
tic;
% p = gcp(); % get the current parallel pool
f = parfeval(p,@sortBubble,1,array);
value = fetchOutputs(f);
toc

%%  
array = randperm(numel(1:10));
part = [0,1];
%%
iterator = 1:2:length(array);
d = [];
parfor i = 1:length(iterator)
    ii = iterator(i);
    c = array(ii+part);
    c = sortTwoNumber(c);
    d = [d,c];
end;
array = d;
%%
d = [];
iterator = 2:2:length(array)-1;
parfor i = 1:length(iterator)
    ii = iterator(i);
    c = array(ii+part);
    c = sortTwoNumber(c);
    d = [d,c];
end;
array = [array(1),d,array(end)];
