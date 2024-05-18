function [index] = check(a,arr)
sz = size(arr,2);
index = 0;
for i = 1:sz
    currPat = arr{1,i};
    b = isequal(a,currPat);
    if(b)
        index = i;
        return
    end

end
index = 0;
return