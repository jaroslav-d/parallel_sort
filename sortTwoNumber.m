function [isSort,array] = sortTwoNumber(array)

if (array(1) < array(2))
    return;
end;

if (array(1) > array(2))
    val = array(1);
    array(1) = array(2);
    array(2) = val;
    isSort = false;
end;
return;

end