function array = sortBubbleOpenMP(array)
% tic;
% isSort = false;
% tempArray = zeros(1,length(array)/2);
% for i = 1:2:length(array)-1
%     tempArray(1,round(i/2)) = array(i);
%     tempArray(2,round(i/2)) = array(i+1);
% end;
% while (isSort ~= true)
%     isSort = true;
%     parfor i = 1:length(tempArray)
%         tempArray(:,i) = sortBubble(tempArray(:,i));
%     end;
% end;
% k = 0;
% for i = 1:length(tempArray)
%     array(i+k) = tempArray(1,i);
%     array(i+1+k) = tempArray(2,i);
%     k = k + 1;
% end;
% toc
% return

tic;
isSort = false;
part = [0,1];
iteratorOne = 1:2:length(array);
iteratorTwo = 2:2:length(array)-1;

while ~isSort
    d = [];
    isSortPar = true;
    parfor i = 1:length(iteratorOne)
        ii = iteratorOne(i);
        c = array(ii+part);
        [isSort,c] = sortTwoNumber(c);
        d = [d,c];
        isSortPar = isSortPar * isSort;
    end;
    array = d;
    isSort = isSortPar;
    if isSort
        break;
    end;
    d = [];
    parfor i = 1:length(iteratorTwo)
        ii = iteratorTwo(i);
        c = array(ii+part);
        [isSort,c] = sortTwoNumber(c);
        d = [d,c];
        isSortPar = isSortPar * isSort;
    end;
    array = [array(1),d,array(end)];
    isSort = isSortPar;
end;

end