function extractData
indx = 2000:4000;
for pID = 1:20
    for wID = 1:2
        wfileName = sprintf('./extract/w%03dday%d.dat', pID, wID);
        rfileName = sprintf('w%03dday%d-raw.csv', pID, wID);

        x = load(rfileName);
        indx = 1:size(x,1);
        out = x(indx, 5);
        dlmwrite(wfileName, out, ' ');
    end
end
end
