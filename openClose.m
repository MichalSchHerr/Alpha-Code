function [ar] = openClose(arr)
for i = 1:77
    L = arr(1,i+1) - arr(1,i);
    if(L > 10)
        ar(1,i) = 1;
    end
    if(L <= 10)
        ar(1,i) = 0;
    end
end
end