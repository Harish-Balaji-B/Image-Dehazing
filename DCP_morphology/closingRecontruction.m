%Performs Morphological Reconstruction by closing
function out_image = closingRecontruction(input_image, SE_type, SE_size)

    %Create marker using image erosion
    SE = strel(SE_type,SE_size);
    img_marker = imdilate(input_image,SE);
        
    %Performs closing by recontrution
    out_image = imcomplement(imreconstruct(imcomplement(img_marker), imcomplement(input_image)));

end
