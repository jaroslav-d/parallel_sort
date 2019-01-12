function [arrayOne,arrayTwo] = divideArrayForBubbleSort(array,cutter)

arrayOne = zeros(1,length(array)/2);
arrayTwo = zeros(1,length(array)/2);
q = true;
for i = 1 + cutter:2:length(array) - cutter
    if (q)
        arrayOne(round(i/2)) = array(i);
        arrayOne(round(i/2)+1) = array(i+1);
    else
        arrayTwo(round(i/2)-1) = array(i);
        arrayTwo(round(i/2)) = array(i+1);
    end;
    q = ~q;
end;
return

end