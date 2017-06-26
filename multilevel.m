rgb1 = imread('1-30-(2).jpg');
rgb2 = imread('1-30.jpg');

img1 = imresize(rgb1,0.09);
img2 = imresize(rgb2,0.09);

Width = size(img1,2);
Height = size(img1,1);

im1 = rgb2gray(img1);
im2 = rgb2gray(img2);

thresh1 = multithresh(im1,7);
seg_im1 = imquantize(im1,thresh1);
im1_multilev = label2rgb(seg_im1);
figure(1);
imshow(im1_multilev);

thresh2 = multithresh(im2,7);
seg_im2 = imquantize(im2,thresh2);
im2_multilev = label2rgb(seg_im2);
figure(2);
imshow(im2_multilev);

level = abs(seg_im2 - seg_im1);
out_pos = find(level>4);
display(size(out_pos));
img2 = reshape(img2,[124416,3]);
for i = 1:size(out_pos)
    img2(out_pos(i),:) = [255,0,0];
end
img2 = reshape(img2,[Height,Width,3]);
figure(3);
imshow(img2);

return;