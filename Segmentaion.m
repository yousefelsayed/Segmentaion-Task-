function [] = Segmentaion( input_img,Vendor )
%Lc = bwlabel(input_img);
bounds = regionprops(input_img,'BoundingBox','Area','Image');
[x w] = size(bounds);
KK=bounds(2);
X=bounds;
indx=1;
maxarea=0;
smaxarea=0;
boundbox=0;
for j=1:x
   if(KK.Area <= X(j).Area )
      maxarea=X(j).Area ;
      indx=j;
      KK.Area=maxarea;    
   else
       continue;
   end
  
end
if(indx==1)
KK=bounds(2);
else
KK=bounds(1);   
end
for j=1:x
   if(KK.Area <= X(j).Area&&j~=indx )
      smaxarea=X(j).Area ;
      KK.Area=smaxarea;    
   else
       continue;
   end
  
end
%%%%%%%%%%
for i =1 : x
    if(X(i).Area==smaxarea)
        boundbox=X(i).BoundingBox;
    else 
        continue;
    end
end
%  disp(maxarea);
%  disp(smaxarea);
% disp(boundbox);
I2 = imcrop(Vendor,boundbox);
I3=preBonus(I2);
Bonus(I3);
end

