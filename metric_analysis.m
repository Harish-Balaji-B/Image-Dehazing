% Metric Analysis for Method 1: Guided Image Filtering

% Initialize variables to store metric values
psnr_values_method1 = zeros(1, 13);
ssim_values_method1 = zeros(1, 13);

for i = 1:13
    % Load original and dehazed images
    original_image_filename = fullfile(['C:\Users\bhari\Downloads\sip\normal\normal_' num2str(i) '.jpg']);
    dehazed_image_filename = fullfile(['C:\Users\bhari\Downloads\sip\CAP\CAP_normal_' num2str(i) '.jpg']);
    
    original_image = imread(original_image_filename);
    dehazed_image = imread(dehazed_image_filename);

    % Resize images to a common size (adjust the size as needed)
    common_size = [256, 256];
    original_image = imresize(original_image, common_size);
    dehazed_image = imresize(dehazed_image, common_size);

    % Compute PSNR
    psnr_values_method1(i) = psnr(dehazed_image, original_image);

    % Compute SSIM
    ssim_values_method1(i) = ssim(dehazed_image, original_image);
end

% Display average PSNR and SSIM values for Method 1
average_psnr_method1 = mean(psnr_values_method1);
average_ssim_method1 = mean(ssim_values_method1);

disp('Method 1: Guided Image Filtering');
disp(['Average PSNR: ' num2str(average_psnr_method1)]);
disp(['Average SSIM: ' num2str(average_ssim_method1)]);

% Metric Analysis for Method 2: Dark Channel Prior with Morphological Operations

% Initialize variables to store metric values
psnr_values_method2 = zeros(1, 13);
ssim_values_method2 = zeros(1, 13);

for i = 1:13
    % Load original and dehazed images
    original_image_filename = fullfile(['C:\Users\bhari\Downloads\sip\normal\normal_' num2str(i) '.jpg']);
    dehazed_image_filename = fullfile(['C:\Users\bhari\Downloads\sip\dehazed\DCP_normal_' num2str(i) '.jpg']);
    
    original_image = imread(original_image_filename);
    dehazed_image = imread(dehazed_image_filename);

    % Resize images to a common size (adjust the size as needed)
    common_size = [256, 256];
    original_image = imresize(original_image, common_size);
    dehazed_image = imresize(dehazed_image, common_size);

    % Compute PSNR
    psnr_values_method2(i) = psnr(dehazed_image, original_image);

    % Compute SSIM
    ssim_values_method2(i) = ssim(dehazed_image, original_image);
end

% Display average PSNR and SSIM values for Method 2
average_psnr_method2 = mean(psnr_values_method2);
average_ssim_method2 = mean(ssim_values_method2);

disp('Method 2: Dark Channel Prior with Morphological Operations');
disp(['Average PSNR: ' num2str(average_psnr_method2)]);
disp(['Average SSIM: ' num2str(average_ssim_method2)]);

