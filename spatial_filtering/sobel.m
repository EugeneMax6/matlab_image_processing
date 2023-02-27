%sobel±ßÔµ¼ì²â
function new_img=sobel(img,n)
if nargin<2
    n=3;        %Ä¬ÈÏÄ£°åÎª3*3
end
d=(n-1)/2;
[x y]=size(img);
img=double(img);
new_img=zeros(x,y);
%SobelËã×ÓÄ£°å
if n==3
    sobel_x = [-1,-2,-1;0,0,0;1,2,1];
    sobel_y = [-1,0,1;-2,0,2;-1,0,1];
elseif n==5
    sobel_x=[-1,-1,-2,-1,-1;-1,-1,-2,-1,-1;0,0,0,0,0;1,1,2,1,1;1,1,2,1,1];
    sobel_y=[-1,-1,0,1,1;-1,-1,0,1,1;-2,-2,0,2,2;-1,-1,0,1,1;-1,-1,0,1,1];
elseif n==7
    sobel_x=[-1,-1,-1,-3,-1,-1,-1;-1,-1,-1,-3,-1,-1,-1;-1,-1,-1,-3,-1,-1,-1;0,0,0,0,0,0,0;1,1,1,3,1,1,1;1,1,1,3,1,1,1;1,1,1,3,1,1,1];
    sobel_y=[-1,-1,-1,0,1,1,1;-1,-1,-1,0,1,1,1;-1,-1,-1,0,1,1,1;-3,-3,-3,0,3,3,3;-1,-1,-1,0,1,1,1;-1,-1,-1,0,1,1,1;-1,-1,-1,0,1,1,1];
end
for i=1+d:x-d
    for j=1+d:y-d
        t=img(i-d:i+d,j-d:j+d);
        G_x=sobel_x.* t;
        G_x=abs(sum(G_x(:)));
        G_y=sobel_y.*t;
        G_y=abs(sum(G_y(:)));
        sobel_xy=sqrt(G_x^2+G_y^2);
        new_img(i+1,j+1)=sobel_xy;
    end
end
new_img=uint8(new_img);
end