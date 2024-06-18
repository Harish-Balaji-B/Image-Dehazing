%Create the minimum channel
function out_image = minimumChannel(input_image)
    
    %Get min intensity at each pixel
    out_image = min(input_image, [], 3);
end