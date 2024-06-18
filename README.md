# Image Dehazing

## Introduction
This study explores the effectiveness of two dehazing methods — DCP Morphology and CAP HLP — alongside the integration of Contrast Limited Adaptive Histogram Equalization (CLAHE) for image enhancement. DCP Morphology utilizes mathematical morphology for haze reduction, while CAP HLP employs haze-line and colour attenuation priors. The addition of CLAHE aims to further improve local contrast. Metric analysis, including PSNR, SSIM, and VIF, is conducted to quantitatively assess the performance of these techniques. Results from diverse hazy images provide insights into the strengths and limitations of each method, offering practical guidance for image dehazing in various applications.

## Dark Channel Prior using Morphology (DCP using Morphology)
This algorithm has three main objectives: 
* Estimate atmospheric light  
* Find the transmission map  
* Refine the transmission map 
Atmospheric light and the transmission map are computed using concepts similar to Dark Channel Prior. But to refine the transmission map, we used the concepts of morphology.

<strong>Refining the transmission map: </strong><br>
* Perform closing operation on initial transmission map and reconstruct the image. This operation removes the small dark elements from the image. 
* Perform opening reconstruction on the transmission map. This operation removes small objects which are smaller than structuring element. On doing the this some small useful data might be lost in order to save it we store the removed objects. 
* Recover ranges from original image and add the removed small objects in order to get the refined transmission map 
* Feed the atmospheric light and refined transmission amp to ASM model to get the Dehazed image.
