%Refine the Transmission map
function out_image = refineTransmissionMap(transMap_img, noSmallObject_img)

    %Transform by summing the images
    out_image = transMap_img + noSmallObject_img;
    
    %figure("Name","Refined Transmission Map");
    %imshow(out_image);
end
