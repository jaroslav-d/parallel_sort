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
array = randperm(10);
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

%%

array = randperm(10000);
c = parcluster;
array = [array, repelem(NaN, mod(length(array), c.NumWorkers))];
arrayNew = reshape(array,[],c.NumWorkers);
parfor i = 1:size(arrayNew,2)
    arrayNew(:,i) = sortBubble(arrayNew(:,i));
end

%%
spmd
    N = 3;
    Y = randi(2) - 1;   % Random 0 or 1
    X = randperm(N);          % Replicated on every worker
    C1 = codistributed(X); % Partitioned among the workers
end

%%
array = 10000:-1:1;
array = [array,NaN,NaN];
% arrayTwo = sortBubbleOpenMP(array);
arrayTwo = sortBubble(array);