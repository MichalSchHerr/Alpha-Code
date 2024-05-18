function [final] = makevaildsub(arr)
    sz = size(arr,2);  % Get the number of elements in the cell array
    count = 0;
    final = {};  % Initialize the final cell array

    for i = 1:sz
        currArr = arr{1,i};  % Access the current cell element
        currSz = size(currArr,2);
        countOfOne = sum(currArr == 1);
        countOfZero = sum(currArr == 0);

        if countOfZero == 0 || countOfOne == 0 || currSz > 10
            continue;  % Skip if the current array doesn't contain both zeros and ones
        else
            count = count + 1;
            final{1,count} = currArr;  % Store the valid array in the final cell array
            final{2,count} = arr{2,i};
        end 
    end
end
