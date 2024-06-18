# Image Dehazing

## Introduction
This study explores the effectiveness of two dehazing methods — DCP Morphology and CAP HLP — alongside the integration of Contrast Limited Adaptive Histogram Equalization (CLAHE) for image enhancement. DCP Morphology utilizes mathematical morphology for haze reduction, while CAP HLP employs haze-line and colour attenuation priors. The addition of CLAHE aims to further improve local contrast. Metric analysis, including PSNR, SSIM, and VIF, is conducted to quantitatively assess the performance of these techniques. Results from diverse hazy images provide insights into the strengths and limitations of each method, offering practical guidance for image dehazing in various applications.

## Dark Channel Prior using Morphology (DCP using Morphology)
This algorithm has three main objectives: 
* Estimate atmospheric light  
* Find the transmission map  
* Refine the transmission map 
Atmospheric light and the transmission map are computed using concepts similar to Dark Channel Prior. But to refine the transmission map, we used the concepts of morphology.

### Refining the transmission map:
* Perform closing operation on initial transmission map and reconstruct the image. This operation removes the small dark elements from the image. 
* Perform opening reconstruction on the transmission map. This operation removes small objects which are smaller than structuring element. On doing the this some small useful data might be lost in order to save it we store the removed objects. 
* Recover ranges from original image and add the removed small objects in order to get the refined transmission map 
* Feed the atmospheric light and refined transmission amp to ASM model to get the Dehazed image.

### Limitations of DCP using morphology
* Assumes colors are mostly pure.
* Assumes airlight is uniform.
* At least part of the image should show the sky.
* Useful for daytime, but not for nighttime.


## Colour attenuation prior using Haze lines prior
This algorithm is mixture of CAP and Haze line prior algorithms. 

The main objective of this algorithm: 
* Find the scene depth  
* Find the scaterring coefficient
* Estimate the air Light How to find scene depth
In order to find the scene depth we use CAP algorithm. This algorithm states that:

‘If the thickness of the haze increases the scene depth also increases’. 

Hence the scene depth of the image will be linearly dependent on the difference between brightness and saturation in the image. Using this we estimate the scene depth. 

### How to find scattering coefficient: 
In general scattering coefficient is kept constant as in most of the images the haze is evenly spread. But in case of satellite images the haze is inconsistent and unevenly spread. So the scattering coefficient must keep changing. Scattering coefficient directly depends on scene depth. Hence with an increase in scene depth, scatering coefficient increases exponentially. 

### How to find airlight:
In order to estimate the airLight we use Haze lines Prior. In this algorithm, we map the pixels in the image to RGB colorspace. Then the model takes these pixels as lines and these lines converge at a point. This point is airLight. Then we use a feature extraction model in order to find the origin point for this airLight. 
After finding scene depth,scaterring coefficient and estimating the airlight, we send these values to ASM model in order to get the dehazed image.

### Limitations of CAP using HLP
* Assumption of Homogeneous Haze.
* Sensitivity to Scene Complexity.
* Limited Effectiveness in Extreme Haze Conditions.
* Impact on Computational Resources
* Difficulty in Handling Non-uniform Illumination


## CLAHE Algorithm 
This algorithm defines two functions, clahe and clahe2, which can be used to apply the Contrast Limited Adaptive Histogram Equalization (CLAHE) algorithm to an image. 
The clahe function takes two parameters: 

* image: The input image, which should be a 2D array. 
* clipping_limit: A float value that sets the limit for contrast enhancement. Higher values allow for more contrast enhancement, but can also amplify noise in the image. The default value is 2.0. grid_size: A tuple that sets the size of the contextual regions, which are the small regions of the image that the algorithm adjusts the contrast of separately. The default value is (8, 8).

## Metric Analysis
For metric analysis of our code, we took 2 mothods:
* PSNR (Peak Signal-to-Noise Ratio)
* SSIM (Structural Similarity Index)
Peak Signal-to-Noise Ratio (PSNR) and Structural Similarity Index (SSIM) are metrics commonly used to evaluate the quality of images. Both metrics provide quantitative measures to assess how well a processed or compressed image compares to the original, with higher values indicating better quality.
