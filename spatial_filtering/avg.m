function new_img=avg(img,n,mode)
%��ֵ�˲�
%img��ͼ�����nΪģ���С(n��n),mode�Ǳ�Ե��䷽ʽ
if(nargin<3)    
    mode=0;    %ͼ���ⲿ�߽�Ĭ����0���
end
[x y]=size(img);
new_img=zeros(x,y);
filled_img=fill_border(img,n,mode);     %��ͼ����б߽����

%���ֵ����䵽�µ�ͼ�����new_img
for i=1:x
    for j=1:y
        %ÿһ��n��n��ģ���������ֵ���������ĵĻҶ�
      new_img(i,j)=sum(sum(filled_img(i:i+n-1,j:j+n-1)))/(n*n);
    end
end
new_img=uint8(new_img);
end