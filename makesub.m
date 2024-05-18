function [final] = makesub(arrt)
sz = size(arrt,2);
count = 0;
for i = 1:sz-1
    for j = i+1 : sz
        count = count + 1;
        subset = arrt(1,i:j);
        subset = mat2cell(subset,1,(j-i+1));
        final(1,count) = subset;
        final{2,count} = i;
    end
end