%Remove objects smaller that are clearer than the environment
function out_image = removedSmallObjects(transMap1, transMap3)

    %Take te difference of the two images
    out_image = double(transMap1) - double(transMap3);


end
