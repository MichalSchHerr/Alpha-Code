function [b] = checksuv(patterns,f,frame,index)
b = 0;
sz = size(patterns,1);
for i = 3:sz
    currCell = patterns{i,index};
    if isempty(currCell)
        continue
    end
    currFrame = currCell(1,1);
    currFrusta = currCell(1,3);
    if(frame == currFrame && f == currFrusta)
        b = 1;
    end
end
end