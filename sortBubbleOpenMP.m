function arraySorted = sortBubbleOpenMP(array,cluster)

c = cluster;
surplus = mod(length(array), c.NumWorkers);
if surplus ~= 0
    array = [array, repelem(NaN, c.NumWorkers - surplus)];
else
    array = [array, repelem(NaN, surplus)];
end;
arrayNew = reshape(array,[],c.NumWorkers);
parfor i = 1:size(arrayNew,2)
    arrayNew(:,i) = sortBubble(arrayNew(:,i));
end
arraySorted = sortMergePartial(arrayNew);

end