%����Һ���ڲ����ȹ��ɵ���άԪ���Զ���ģ��
clc,clear;
global tcell;       %��״̬��Ԫ��
global next_tcell;  %����״̬��Ԫ��
global length;      %Ԫ����ĳ����
global width;
global height;
global sum_cell;         %Ԫ�����ܸ���
global m;global n;global p; %Ԫ���ߴ�
%Ԫ��֮��ľ���
dis=1;
%ʱ����
time=1;
%����Ƭ�������������壬���쳤���
length=20;width=20;height=20;
[x,y,z]=meshgrid(1:dis:length,1:dis:width,1:dis:height);
% [m,n,p]=size(x);
sum_cell=length*width*height;
%�趨�¶ȵı仯��Χ
min_temperature=10;
max_temperature=50;
%�趨����
lambda=0.6265;
rho=995.6;
c=4174;
%��������
t=100;
%ÿ���ڵ�ƽ���¶�
avg_t=zeros(t,1);
%�趨��ʼ�¶�
tcell=zeros(length,width,height);
for a=1:length-1  
    for b=1:width-1
        for c=1:height-1
            tcell(a,b,c)=randi([40,41]);
        end
    end
end
initTub;
% tcell(1:3,1:3:1:3)=NaN;
next_tcell=tcell;
%CA����
for i=1:t
%     format=sprintf('��%dʱ��',i);
%     text(1,1,1,format,'fontsize',10);
    fprintf('��%dʱ��\n',i);
%     axis([-7 7 -7 7 -8 8]);
    slice(x,y,z,tcell,length/2,width/2,[],'linear');
    shading flat;
    caxis([min_temperature max_temperature]); %����ˮ������ɫӳ���ϵ
    colormap jet    %��׼��ɫ����
    colorbar
    drawnow;  %��ǰ���̻���
    %����Ԫ����״̬
    %Һ���ڲ��ȶ���ģ�͵�Ԫ��״̬����
    for x1=2:length-1
        for y1=2:width-1
            for z1=2:height-1
                next_tcell(x1,y1,z1)=(lambda/(rho*c))*(time/(dis*dis))*(tcell(x1+1,y1,z1)+...
                    +tcell(x1-1,y1,z1)+tcell(x1,y1+1,z1)+...
                    tcell(x1,y1-1,z1)+tcell(x1,y1,z1+1)+tcell(x1,y1,z1-1)-6*tcell(x1,y1,z1))+...
                    +tcell(x1,y1,z1);
            end
        end
    end
    tcell=next_tcell; 
    avg_t(i)=getAvgTemp();
end