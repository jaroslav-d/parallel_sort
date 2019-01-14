function array = sortBubble(array)
isSort = false;
cut = 0;
tic;
while (isSort ~= true)
    isSort = true;
    for i = 1:length(array)-1-cut
        if (array(i) > array(i+1))
            m = array(i);
            array(i) = array(i+1);
            array(i+1) = m;
            isSort = false;
        end;
    end;
    cut = cut + 1;
end;
toc
return

end