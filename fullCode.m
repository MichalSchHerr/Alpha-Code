Ex1 = load('Ex1.mat');
Ex2 = load('Ex2.mat');
Ex3 = load('Ex3.mat');

for i = 1:146
    FramesEx1(1,i) = plus("Ex1frame",i);
end
for i = 1:101
    FramesEx2(1,i) = plus("Ex2frame",i);
end
for i = 1:150
    FramesEx3(1,i) = plus("Ex3frame",i);
end

Ex1Xarr = cell(1,146);
%bulding an array
for(i = 1:146)
    currFrameFrusta = getfield(Ex1,FramesEx1{i});
    numOfFrusta = size(currFrameFrusta,2);
    currFrameFrustaXValues = [0];
    for j = 1:numOfFrusta
        currFrameFrustaXValues(1,j) = currFrameFrusta(1,j).Position(1,1); 
    end
    currFrameFrustaXValues(1,numOfFrusta+1) = 50; 
    currFrameFrustaXValuesCell = mat2cell(currFrameFrustaXValues,1,numOfFrusta+1);
    Ex1Xarr(1,i) = currFrameFrustaXValuesCell;
end

%sorting
for i = 1:146
    currFrameFrusta = Ex1Xarr{1,i};
    currFrameFrusta = sort(currFrameFrusta);
    Ex1Xarr{1,i} = currFrameFrusta;
end

for i = 1:146
    currFrameFrusta = Ex1Xarr{1,i};
    numOfFrusta = size(currFrameFrusta,2);
    countOfGaps = 0;

    %finding how many gaps
    for n = 1:numOfFrusta-1
        currL = currFrameFrusta(1,n+1) - currFrameFrusta(1,n);
        if(currL > 35)
            countOfGaps = countOfGaps + 1;
        end
    end
    if (countOfGaps == 0)
        continue;
    end

    %bulding a data for the gaps
    gaps = zeros(countOfGaps,2);
    countOfGaps = 0;
    for n = 1:numOfFrusta-1
        currL = currFrameFrusta(1,n+1) - currFrameFrusta(1,n);
        if(currL > 35)
            countOfGaps = countOfGaps + 1;
            gaps(countOfGaps,1) = currFrameFrusta(1,n);
            gaps(countOfGaps,2) = currL;
        end
    end
   
    %checking if need to add
    num = 78 - numOfFrusta;
    if(num == 0)
        continue;
    end

    %filling the gaps
    sumOfL = 0;
    for currLInArr = 1:countOfGaps
        sumOfL = sumOfL + gaps(currLInArr,2);
    end
    howToSplit = split(gaps,num,countOfGaps);
    currI = numOfFrusta + 1;
    for j = 1:countOfGaps 
        currGap = gaps(j,2);
        currX = gaps(j,1);
        Num2Add = howToSplit(1,j);
        L2Add = round(currGap/(Num2Add+1));
        for(k = 1:Num2Add)
            currX = currX + L2Add;
            currFrameFrusta(1,currI) = currX;
            currI = currI + 1;
        end
    end

    %sorting 
    currFrameFrusta = sort(currFrameFrusta);
    Ex1Xarr{1,i} = currFrameFrusta;
end

Ex2Xarr = cell(1,101);
%bulding an array
for(i = 1:101)
    currFrameFrusta = getfield(Ex2,FramesEx2{i});
    classOfFrame = class(currFrameFrusta);
    cla = 'double';
    if((cla == classOfFrame))
        if(currFrameFrusta == 0)
            continue
        end
    end
    numOfFrusta = size(currFrameFrusta,2);
    currFrameFrustaXValues = [0];
    for j = 1:numOfFrusta
        currFrameFrustaXValues(1,j) = currFrameFrusta(1,j).Position(1,1); 
    end
    currFrameFrustaXValues(1,numOfFrusta+1) = 30; 
    currFrameFrustaXValuesCell = mat2cell(currFrameFrustaXValues,1,numOfFrusta+1);
    Ex2Xarr(1,i) = currFrameFrustaXValuesCell;
end

%sorting
for i = 1:101
    currFrameFrusta = Ex2Xarr{1,i};
    if(currFrameFrusta == 0)
        continue;
    end
    currFrameFrusta = sort(currFrameFrusta);
    Ex2Xarr{1,i} = currFrameFrusta;
end

for i = 1:101
    currFrameFrusta = Ex2Xarr{1,i};
    if(currFrameFrusta == 0)
        continue;
    end
    numOfFrusta = size(currFrameFrusta,2);
    countOfGaps = 0;

    %finding how many gaps
    for n = 1:numOfFrusta-1
        currL = currFrameFrusta(1,n+1) - currFrameFrusta(1,n);
        if(currL > 25)
            countOfGaps = countOfGaps + 1;
        end
    end
    if (countOfGaps == 0)
        continue;
    end

    %bulding a data for the gaps
    gaps = zeros(countOfGaps,2);
    countOfGaps = 0;
    for n = 1:numOfFrusta-1
        currL = currFrameFrusta(1,n+1) - currFrameFrusta(1,n);
        if(currL > 25)
            countOfGaps = countOfGaps + 1;
            gaps(countOfGaps,1) = currFrameFrusta(1,n);
            gaps(countOfGaps,2) = currL;
        end
    end
   
    %checking if need to add
    num = 78 - numOfFrusta;
    if(num == 0)
        continue;
    end

    %filling the gaps
    sumOfL = 0;
    for currLInArr = 1:countOfGaps
        sumOfL = sumOfL + gaps(currLInArr,2);
    end
    howToSplit = split(gaps,num,countOfGaps);
    currI = numOfFrusta + 1;
    for j = 1:countOfGaps 
        currGap = gaps(j,2);
        currX = gaps(j,1);
        Num2Add = howToSplit(1,j);
        L2Add = round(currGap/(Num2Add+1));
        for(k = 1:Num2Add)
            currX = currX + L2Add;
            currFrameFrusta(1,currI) = currX;
            currI = currI + 1;
        end
    end

    %sorting 
    currFrameFrusta = sort(currFrameFrusta);
    Ex2Xarr{1,i} = currFrameFrusta;
end

Ex3Xarr = cell(1,150);
%bulding an array
for(i = 1:150)
    currFrameFrusta = getfield(Ex3,FramesEx3{i});
    classOfFrame = class(currFrameFrusta);
    cla = 'double';
    if((cla == classOfFrame))
        if(currFrameFrusta == 0)
            continue
        end
    end
    numOfFrusta = size(currFrameFrusta,2);
    currFrameFrustaXValues = [0];
    for j = 1:numOfFrusta
        currFrameFrustaXValues(1,j) = currFrameFrusta(1,j).Position(1,1); 
    end
    currFrameFrustaXValues(1,numOfFrusta+1) = 20; 
    currFrameFrustaXValuesCell = mat2cell(currFrameFrustaXValues,1,numOfFrusta+1);
    Ex3Xarr(1,i) = currFrameFrustaXValuesCell;
end

%sorting
for i = 1:101
    currFrameFrusta = Ex3Xarr{1,i};
    if(currFrameFrusta == 0)
        continue;
    end
    currFrameFrusta = sort(currFrameFrusta);
    Ex3Xarr{1,i} = currFrameFrusta;
end

for i = 1:150
    currFrameFrusta = Ex3Xarr{1,i};
    if(currFrameFrusta == 0)
        continue;
    end
    numOfFrusta = size(currFrameFrusta,2);
    countOfGaps = 0;

    %finding how many gaps
    for n = 1:numOfFrusta-1
        currL = currFrameFrusta(1,n+1) - currFrameFrusta(1,n);
        if(currL > 25)
            countOfGaps = countOfGaps + 1;
        end
    end
    if (countOfGaps == 0)
        continue;
    end

    %bulding a data for the gaps
    gaps = zeros(countOfGaps,2);
    countOfGaps = 0;
    for n = 1:numOfFrusta-1
        currL = currFrameFrusta(1,n+1) - currFrameFrusta(1,n);
        if(currL > 25)
            countOfGaps = countOfGaps + 1;
            gaps(countOfGaps,1) = currFrameFrusta(1,n);
            gaps(countOfGaps,2) = currL;
        end
    end
   
    %checking if need to add
    num = 78 - numOfFrusta;
    if(num == 0)
        continue;
    end

    %filling the gaps
    sumOfL = 0;
    for currLInArr = 1:countOfGaps
        sumOfL = sumOfL + gaps(currLInArr,2);
    end
    howToSplit = split(gaps,num,countOfGaps);
    currI = numOfFrusta + 1;
    for j = 1:countOfGaps 
        currGap = gaps(j,2);
        currX = gaps(j,1);
        Num2Add = howToSplit(1,j);
        L2Add = round(currGap/(Num2Add+1));
        for(k = 1:Num2Add)
            currX = currX + L2Add;
            currFrameFrusta(1,currI) = currX;
            currI = currI + 1;
        end
    end

    %sorting 
    currFrameFrusta = sort(currFrameFrusta);
    Ex3Xarr{1,i} = currFrameFrusta;
end

Ex1OpenClose = cell(1,146);
for i = 1:146
    currFrameFrustaXValues = Ex1Xarr{1,i};
    if(isempty(currFrameFrustaXValues))
        continue;
    end
    currFrameFrustaOpenClose = openClose(currFrameFrustaXValues);
    Ex1OpenClose{1,i} = currFrameFrustaOpenClose;
end

Ex2OpenClose = cell(1,101);
for i = 1:101
    currFrameFrustaXValues = Ex2Xarr{1,i};
    if(isempty(currFrameFrustaXValues))
        continue;
    end
    currFrameFrustaOpenClose = openClose(currFrameFrustaXValues);
    Ex2OpenClose{1,i} = currFrameFrustaOpenClose;
end

Ex3OpenClose = cell(1,150);
for i = 1:150
    currFrameFrustaXValues = Ex3Xarr{1,i};
    if(isempty(currFrameFrustaXValues))
        continue;
    end
    currFrameFrustaOpenClose = openClose(currFrameFrustaXValues);
    Ex3OpenClose{1,i} = currFrameFrustaOpenClose;
end

Ex1SubsArr = cell(1,146);
for i = 1:146
    currFrameFrustaOpenClose = Ex1OpenClose{1,i};
     if(isempty(currFrameFrustaOpenClose))
        continue;
     end
    currSubs = makesub(currFrameFrustaOpenClose);
    currSubs = makevaildsub(currSubs);
    Ex1SubsArr{1,i} = currSubs;
end

Ex2SubsArr = cell(1,101);
for i = 1:101
    currFrameFrustaOpenClose = Ex2OpenClose{1,i};
     if(isempty(currFrameFrustaOpenClose))
        continue;
    end
    currSubs = makesub(currFrameFrustaOpenClose);
    currSubs = makevaildsub(currSubs);
    Ex2SubsArr{1,i} = currSubs;
end

Ex3SubsArr = cell(1,150);
for i = 1:150
    currFrameFrustaOpenClose = Ex3OpenClose{1,i};
     if(isempty(currFrameFrustaOpenClose))
        continue;
    end
    currSubs = makesub(currFrameFrustaOpenClose);
    currSubs = makevaildsub(currSubs);
    Ex3SubsArr{1,i} = currSubs;
end

patterns = cell(1,1);
count = 0;
for i = 1:146
    arr = Ex1SubsArr{1,i};
    sz = size(arr,2);
    for j = 1:sz
        a = arr{1,j};
        c = countEx1{1,i}{1,j};
        f = Ex1SubsArr{1,i}{2,j};
        if(c>1)
            if isempty(patterns)
                count = count + 1;
                szz = size(a,2);
                b = mat2cell(a,1,szz);
                patterns(1,count) = b;
                patterns(2,count) = cell(1,1);
                patterns{2,count} = 1;
                addt(1,1) = 1;
                addt(1,2) = i;
                addt(1,3) = Ex1SubsArr{1,i}{2,j};
                add = mat2cell(addt,1,3);
                patterns(3,count) = add;
                continue;
            else
            if(check(a,patterns))
                index = check(a,patterns);
                if(checksuv(patterns,f,1,index))
                    continue;
                end
                currCount = patterns{2,index};
                newIndex = currCount+3;
                addt(1,1) = 1;
                addt(1,2) = i;
                addt(1,3) = Ex1SubsArr{1,i}{2,j};
                add = mat2cell(addt,1,3);
                patterns(newIndex,index) = add;
                currCount = currCount + 1;
                patterns{2,index} =  currCount;
            else
                count = count + 1;
                szz = size(a,2);
                b = mat2cell(a,1,szz);
                patterns(1,count) = b;
                patterns{2,count} = 1;
                addt(1,1) = 1;
                addt(1,2) = i;
                addt(1,3) = Ex1SubsArr{1,i}{2,j};
                add = mat2cell(addt,1,3);
                patterns(3,count) = add;
            end
            end
            
        end
    end
end

countEx1 = cell(1, 146);
countEx2 = cell(1, 101);
countEx3 = cell(1, 150);

for k = 1:146
    currFrame = Ex1SubsArr{1,k};
    if(isempty(currFrame))
        continue;
    end
    ksz = size(currFrame,2);
    for j = 1:ksz
        curr = currFrame{1,j};
        count = 0;
        fr = currFrame{2,j};
        for m = 1:146
            frameCom = Ex1SubsArr{1,m};
            if(isempty(frameCom))
                continue;
            end
            msz = size(frameCom,2);
            for n = 1:msz
                currCom = frameCom{1,n};
                if(isequal(curr,currCom))
                    count = count + 1;
                end
            end
        end
        for m = 1:101
            frameCom = Ex2SubsArr{1,m};
            if(isempty(frameCom))
                continue;
            end
            msz = size(frameCom,2);
            for n = 1:msz
                currCom = frameCom{1,n};
                if(isequal(curr,currCom))
                    count = count + 1;
                end
            end
        end
        for m = 1:150
            frameCom = Ex3SubsArr{1,m};
            if(isempty(frameCom))
                continue;
            end
            msz = size(frameCom,2);
            for n = 1:msz
                currCom = frameCom{1,n};
                if(isequal(curr,currCom))
                    count = count + 1;
                end
            end
        end
        countEx1{1,k}{1,j} = count;
        countEx1{1,k}{2,j} = fr;
    end
end

for k = 1:101
    currFrame = Ex2SubsArr{1,k};
    if(isempty(currFrame))
        continue;
    end
    ksz = size(currFrame,2);
    for j = 1:ksz
        curr = currFrame{1,j};
        count = 0;
        fr = currFrame{2,j};
        for m = 1:146
            frameCom = Ex1SubsArr{1,m};
            if(isempty(frameCom))
                continue;
            end
            msz = size(frameCom,2);
            for n = 1:msz
                currCom = frameCom{1,n};
                if(isequal(curr,currCom))
                    count = count + 1;
                end
            end
        end
        for m = 1:101
            frameCom = Ex2SubsArr{1,m};
            if(isempty(frameCom))
                continue;
            end
            msz = size(frameCom,2);
            for n = 1:msz
                currCom = frameCom{1,n};
                if(isequal(curr,currCom))
                    count = count + 1;
                end
            end
        end
        for m = 1:150
            frameCom = Ex3SubsArr{1,m};
            if(isempty(frameCom))
                continue;
            end
            msz = size(frameCom,2);
            for n = 1:msz
                currCom = frameCom{1,n};
                if(isequal(curr,currCom))
                    count = count + 1;
                end
            end
        end
        countEx2{1,k}{1,j} = count;
        countEx2{1,k}{2,j} = fr;
    end
end

for k = 1:150
    currFrame = Ex3SubsArr{1,k};
    if(isempty(currFrame))
        continue;
    end
    ksz = size(currFrame,2);
    for j = 1:ksz
        curr = currFrame{1,j};
        count = 0;
        fr = currFrame{2,j};
        for m = 1:146
            frameCom = Ex1SubsArr{1,m};
            if(isempty(frameCom))
                continue;
            end
            msz = size(frameCom,2);
            for n = 1:msz
                currCom = frameCom{1,n};
                if(isequal(curr,currCom))
                    count = count + 1;
                end
            end
        end
        for m = 1:101
            frameCom = Ex2SubsArr{1,m};
            if(isempty(frameCom))
                continue;
            end
            msz = size(frameCom,2);
            for n = 1:msz
                currCom = frameCom{1,n};
                if(isequal(curr,currCom))
                    count = count + 1;
                end
            end
        end
        for m = 1:150
            frameCom = Ex3SubsArr{1,m};
            if(isempty(frameCom))
                continue;
            end
            msz = size(frameCom,2);
            for n = 1:msz
                currCom = frameCom{1,n};
                if(isequal(curr,currCom))
                    count = count + 1;
                end
            end
        end
        countEx3{1,k}{1,j} = count;
        countEx3{1,k}{2,j} = fr;
    end
end

for i = 1:101
    arr = Ex2SubsArr{1,i};
    sz = size(arr,2);
    for j = 1:sz
        a = arr{1,j};
        c = countEx2{1,i}{1,j};
        f = Ex2SubsArr{1,i}{2,j};
        if(c>1)
            if isempty(patterns)
                count = count + 1;
                szz = size(a,2);
                b = mat2cell(a,1,szz);
                patterns(1,count) = b;
                patterns(2,count) = cell(1,1);
                patterns{2,count} = 1;
                addt(1,1) = 2;
                addt(1,2) = i;
                addt(1,3) = Ex2SubsArr{1,i}{2,j};
                add = mat2cell(addt,1,3);
                patterns(3,count) = add;
                continue;
            else
                if(check(a,patterns))
                index = check(a,patterns);
                if(checksuv(patterns,f,2,index))
                    continue;
                end
                currCount = patterns{2,index};
                newIndex = currCount+3;
                addt(1,1) = 2;
                addt(1,2) = i;
                addt(1,3) = Ex2SubsArr{1,i}{2,j};
                add = mat2cell(addt,1,3);
                patterns(newIndex,index) = add;
                currCount = currCount + 1;
                patterns{2,index} =  currCount;
            else
                count = count + 1;
                szz = size(a,2);
                b = mat2cell(a,1,szz);
                patterns(1,count) = b;
                patterns{2,count} = 1;
                addt(1,1) = 2;
                addt(1,2) = i;
                addt(1,3) = Ex2SubsArr{1,i}{2,j};
                add = mat2cell(addt,1,3);
                patterns(3,count) = add;
            end
            end
        end
    end
end

for i = 1:150
    arr = Ex3SubsArr{1,i};
    sz = size(arr,2);
    for j = 1:sz
        a = arr{1,j};
        c = countEx3{1,i}{1,j};
        f = Ex3SubsArr{1,i}{2,j};
        if(c>1)
            if isempty(patterns)
                count = count + 1;
                szz = size(a,2);
                b = mat2cell(a,1,szz);
                patterns(1,count) = b;
                patterns(2,count) = cell(1,1);
                patterns{2,count} = 1;
                addt(1,1) = 3;
                addt(1,2) = i;
                addt(1,3) = Ex3SubsArr{1,i}{2,j};
                add = mat2cell(addt,1,3);
                patterns(3,count) = add;
                continue;
            else
                 if(check(a,patterns))
                index = check(a,patterns);
                if(checksuv(patterns,f,3,index))
                    continue;
                end
                currCount = patterns{2,index};
                newIndex = currCount+3;
                addt(1,1) = 3;
                addt(1,2) = i;
                addt(1,3) = Ex3SubsArr{1,i}{2,j};
                add = mat2cell(addt,1,3);
                patterns(newIndex,index) = add;
                currCount = currCount + 1;
                patterns{2,index} =  currCount;
                else
                count = count + 1;
                szz = size(a,2);
                b = mat2cell(a,1,szz);
                patterns(1,count) = b;
                patterns{2,count} = 1;
                addt(1,1) = 3;
                addt(1,2) = i;
                addt(1,3) = Ex3SubsArr{1,i}{2,j};
                add = mat2cell(addt,1,3);
                patterns(3,count) = add;
                end
            end
        end
    end
end
