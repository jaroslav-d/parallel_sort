function array = sortBubbleOpenMP(array)
tic;
isSort = false;

while ~isSort
    d = [];
    isSortPar = true;
    arrayOne = array(1:2:end);
    arrayTwo = array(2:2:end);
    parfor i = 1:length(arrayOne)
        a = arrayOne(i);
        b = arrayTwo(i);
        [isSort,c] = sortTwoNumber(a,b);
        d = [d,c];
        isSortPar = isSortPar * isSort;
    end;
    array = d;
    isSort = isSortPar;
    if isSort
        break;
    end;
    d = [];
    arrayOne = array(2:2:end-1);
    arrayTwo = array(3:2:end-1);
    parfor i = 1:length(arrayOne)
        a = arrayOne(i);
        b = arrayTwo(i);
        [isSort,c] = sortTwoNumber(a,b);
        d = [d,c];
        isSortPar = isSortPar * isSort;
    end;
    array = [array(1),d,array(end)];
    isSort = isSortPar;
end;
toc
end