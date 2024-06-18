%Create the initial Transmission map
function out_image = initialTransMap(minChannel)

    %Subtract min Channel from 1
    out_image = 1 - minChannel;

    %figure('Name',"Initial transmission map");
    %imshow(out_image);

end
