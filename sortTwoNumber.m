function [isSort,array] = sortTwoNumber(numberOne,numberTwo)

isSort = true;
if (numberOne < numberTwo)
    array = [numberOne,numberTwo];
    return;
else
    array = [numberTwo,numberOne];
    isSort = false;
end;

end