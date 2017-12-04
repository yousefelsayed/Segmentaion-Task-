function [ ] = segmentation( inputimg )
Lc = bwlabel(inputimg);
stats = regionprops(Lc,'all');
[x y] = size(stats);
for i=1:x
    figure, imshow(stats(i).Image);
    disp(stats(i))
end

end