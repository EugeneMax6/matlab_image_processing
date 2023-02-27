%robert±ßÔµ¼ì²â
function new_img=robert(img)
[x y]=size(img);
img=double(img);
new_img=zeros(x,y);
H1= [1 0;0 -1]; H2 = [0 1; -1 0];           %RobertËã×ÓÄ£°å
for i=1:x-1
    for j=1:y-1
        t=img(i:i+1,j:j+1);
        G_x=H1.*t;
        G_x=abs(sum(G_x(:)));
        G_y=H2.*t;
        G_y=abs(sum(G_y(:)));
        G_xy=sqrt(G_x^2+G_y^2);
        new_img(i+1,j+1)=G_xy;
    end
end
new_img=uint8(new_img);
end