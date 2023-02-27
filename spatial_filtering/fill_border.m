function G=fill_border(img,n,mode)
%��ͼ���Ե�������
[x y]=size(img);
G=zeros(x+n-1,y+n-1);   %�Ա߽�����ͼ������СΪ(x+n-1)*(y+n-1)
G((n-1)/2+1:x+((n-1)/2),(n-1)/2+1:y+((n-1)/2))=img;     %��ԭͼ�ĻҶ�ֵ�����µ�ͼ�����
%����mode�����Ͷ��µ�ͼ�����������
if isa(mode,'double')==1
    %�ⲿ�߽�ͨ��x�����
    G(1:(n-1)/2,1:y+n-1)=mode;
    G(x+(n-1)/2+1:x+n-1,1:y+n-1)=mode;
    G(1:x+n-1,1:(n-1)/2)=mode;
    G(1:x+n-1,y+(n-1)/2+1:y+n-1)=mode;
elseif strcmp(mode,'replicate')==1
    %���Ʊ߽�
    %�ȸ����ĸ��ǵĻҶ�ֵ
    G(1:(n-1)/2,1:(n-1)/2)=img(1,1);
    G(x+(n-1)/2:x+n-1,y+(n-1)/2:y+n-1)=img(x,y);
    G(1:(n-1)/2,y+(n-1)/2:y+n-1)=img(1,y);
    G(x+(n-1)/2:x+n-1,1:(n-1)/2)=img(x,1);
    %�����߽縴��
    for i=1:(n-1)/2
        G(i,(n-1)/2+1:y+(n-1)/2)=img(1,1:y);
        G(x+(n-1)/2+i,(n-1)/2+1:y+(n-1)/2)=img(x,1:y);
        G((n-1)/2+1:x+(n-1)/2,i)=img(1:x,1);
        G((n-1)/2+1:x+(n-1)/2,y+(n-1)/2+i)=img(1:x,y);
    end
elseif strcmp(mode,'symmetric')==1
    %�ر߽���о�����
    %�����¾�����
    for i=1:(n-1)/2
        G(i,(n-1)/2+1:y+(n-1)/2)=img((n-1)/2-i+1,1:y);
        G(x+(n-1)/2+i,(n-1)/2+1:y+(n-1)/2)=img(x-i+1,1:y);
    end
    %�����ҷ���
    for i=1:(n-1)/2
        G(1:x+n-1,i)=G(1:x+n-1,(n-1)/2-i+1);
        G(1:x+n-1,x+(n-1)/2+i)=G(1:x+n-1,y+(n-1)/2-i+1);
    end
elseif strcmp(mode,'circular')==1
    %��Ϊ��ά���ں���������չ
    G1=zeros(3*x,3*y);
    G1(1:x,1:y)=img;
    G1(1:x,y+1:2*y)=img;
    G1(1:x,2*y+1:3*y)=img;
    G1(x+1:2*x,1:y)=img;
    G1(x+1:2*x,y+1:2*y)=img;
    G1(x+1:2*x,2*y+1:3*y)=img;
    G1(2*x+1:3*x,1:y)=img;
    G1(2*x+1:3*x,y+1:2*y)=img;
    G1(2*x+1:3*x,2*y+1:3*y)=img;
    G=G1(x-(n-1)/2+1:2*x+(n-1)/2,y-(n-1)/2+1:2*y+(n-1)/2);
end
end