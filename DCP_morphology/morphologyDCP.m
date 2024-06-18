
%Finding Dark channel prior
function out_image = morphologyDCP(input_image, SE_type, SE_size)

    %Get min intensity at each pixel
    out_image = min(input_image, [], 3);
    
    %Morphologiacl Grayscale Erosion
    struct_elem=strel(SE_type,SE_size);
    out_image = imerode(out_image,struct_elem);
    
end
