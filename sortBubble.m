function array = sortBubble(array)
isSort = false;
tic;
while (isSort ~= true)
    isSort = true;
    for i = 1:length(array)-1
        if (array(i) > array(i+1))
            m = array(i);
            array(i) = array(i+1);
            array(i+1) = m;
            isSort = false;
        end;
    end;
end;
toc
return

end