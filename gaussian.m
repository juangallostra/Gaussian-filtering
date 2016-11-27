%% Gaussian Filter

image=imread('circles.jpg');                % Load image

m=5;n=5;                                    % Define filter size: mxn

filter = gaussianf(7,1,m,n);				% Compute filter with 0 degrees rotation

S = imfilter(image,filter);					% Filter image

filter = gaussianf(7,1,m,n,45);             % Compute filter with 45 degrees rotation

S2 = imfilter(image,filter);                 

figure;                                     % Plot results
imshow(image), title('Original image')
figure;
subplot(1,2,1), imshow(S), title('Gaussian filtering 0º degrees rotation')
subplot(1,2,2), imshow(S2), title('Gaussian filtering 45º degrees rotation')

%% Noise removal

image=imread('Birds.tif');               % Load image

N = imnoise(image,'gaussian');           % Add Gaussian noise
N2 = imnoise(image, 'poisson');          % Add Poisson noise

m = 5; n = 5;                            % Define filter size
filter = gaussianf(2,2,m,n);             % Compute filter

Nf = imfilter(N,filter);                 % Filter image
N2f = imfilter(N2,filter);

figure;                                  % Plot results
imshow(image), title('Original image')
figure;
subplot(2,2,1), imshow(N), title('Gaussian noise')
subplot(2,2,2), imshow(Nf), title('Filtered Gaussian noise')
subplot(2,2,3), imshow(N2), title('Poisson noise')
subplot(2,2,4), imshow(N2f), title('Filered Poisson noise')
