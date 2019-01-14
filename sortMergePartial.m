function arrayNew = sortMergePartial(array)

if ((size(array,2)/2) >= 1)
    arrayOne = sortMergePartial(array(:,1:round(end/2)));
    arrayTwo = sortMergePartial(array(:,round(end/2)+1:end));
    arrayNew = zeros(size(arrayOne,1)+size(arrayTwo,1),1);
    endCycle = false;
    nOne = 1;
    nTwo = 1;
    while ~endCycle
        
        if (arrayOne(nOne) <= arrayTwo(nTwo))
            arrayNew(nOne+nTwo-1) = arrayOne(nOne);
            nOne = nOne + 1;
        else
            arrayNew(nOne+nTwo-1) = arrayTwo(nTwo);
            nTwo = nTwo + 1;
        end;
        
        if (nOne > size(arrayOne,1)) && (nTwo > size(arrayTwo,1))
            endCycle = true;
        end;
        
        if (nOne > size(arrayOne,1))
            for i = nOne+nTwo-1:size(arrayNew,1)
                arrayNew(i) = arrayTwo(i-nOne+1);
            end;
            endCycle = true;
        end;
        
        if (nTwo > size(arrayTwo,1))
            for i = nOne+nTwo-1:size(arrayNew,1)
                arrayNew(i) = arrayOne(i-nTwo+1);
            end;
            endCycle = true;
        end;
    end;
else
    arrayNew = array;
end;

end