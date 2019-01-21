function array = sortSelect(array)

tic;
for i = 1:length(array)
    least = i;
    for ii = least+1:length(array)
        if (array(least) > array(ii))
            least = ii;
        end;
    end;
    tmp = array(i);
    array(i) = array(least);
    array(least) = tmp;
end;
toc
return

end