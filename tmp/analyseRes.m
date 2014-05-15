function analyseRes
    numPart = 10;
    errorRate = 0;
    for pID = 1:numPart
        rfileName = sprintf('score%02d.dat', pID);
        x = load(rfileName);
        meanValue = mean(x);
        [maxValue idx] = max(meanValue);
        if (idx == pID)
            printf('%d is correctly classified\n', pID);
        else
            printf('%d is misclassified\n', pID);
            errorRate++;
        end
    end
    printf('error rate is %f\n', errorRate/numPart);
end
