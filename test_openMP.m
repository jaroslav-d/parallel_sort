%% begin data
clear;
array = randperm(10000);
pp = parpool('local',2);
% delete(gcp('nocreate'));
%%
%   parallel sorts the bubble array
% for i = 1:100
    array = randperm(10000);
    tic;
    arraySorted = sortBubbleOpenMP(array,pp);
    t = toc;
    fprintf('Total sorting time: %1.4f second\n',t);
% end;
plot(arraySorted,'c*');
%%
%   parallel sorts the array by the method of successive minima
% for i = 1:100
    array = randperm(10000);
    tic;
    arraySorted = sortSelectOpenMP(array,pp);
    t = toc;
    fprintf('Total sorting time: %1.4f second\n',t);
% end;
plot(arraySorted,'c*');
%%
%   matlab sorting method
tic
arraySorted = sort(array);
t = toc;
fprintf('Total sorting time: %1.4f second\n',t);
%%
%   bubble sort method
for i = 1:100
    arrayTwo = sortBubble(array);
end;
%%
%   selection sort method
for i = 1:100
    arrayTwo = sortSelect(array);
end;