%������ԡ��Һ����άԪ���Զ���ģ��
clc,clear;
global tcell;       %��״̬��Ԫ��
global next_tcell;  %����״̬��Ԫ��
global length;global width;global height;      %Ԫ����ĳ����
global sum_cell;    %Ԫ�����ܸ��� 
global P;           %�ȶ���Ԫ���ƶ�����
global P_hit;       %���������ĸ���
global humanX_start;global humanX_end;  %����
global humanY_start;global humanY_end;
global humanZ_start;global humanZ_end;
global tcell_type;
global isHuman;         %�����б���
global isHeat;          %��Դ�б���
global isWater;         %ˮ�ı��
%�б����
tcell_type=zeros(length,width,height);
%Ԫ��֮��ľ���
dis=1;
%ʱ����
time=1500; 
%����Ƭ�������������壬���쳤���
length=40;width=60;height=20;
[x,y,z]=meshgrid(1:dis:length+1,1:dis:width+1,1:dis:height+1);
[m,n,p]=size(x);
length=m-1;width=n-1;height=p-1;
sum_cell=length*width*height;
%�趨�¶ȵı仯��Χ
min_temperature=20;
max_temperature=45;
%�ȶ�������
P=0.1;   
P_hit=0.5;
%��ͬ���Ƚ��ʼ��Ԫ����ȣ�Ԫ��������
disslayer_num=4;
%�趨����
lambda=0.6265;  %Һ��֮����ȵ���
% lambda=0.677;
lambda2=2.3;    %Һ��������֮����ȵ���
lambda3=0.2;    %Һ�������֮����ȵ���
lambda_human=0.1; %Һ��������֮����ȵ���
rho=995.6;
c=4174;
%��������
t=35;
%ÿ���ڵ�ƽ���¶�
avg_t=zeros(t,1);
%�趨��ʼ�¶�
tcell=zeros(length,width,height);
%��ʼ��ˮ��
for a=1:length
    for b=1:width
        for c=1:height
            tcell(a,b,c)=randi([0 0]);
        end
    end
end

initTub();
initHuman();

next_tcell=tcell;
%CA����
for i=1:t
%     format=sprintf('��%dʱ��',i);
%     text(1,1,1,format,'fontsize',10);
    fprintf('��%dʱ��\n',i);
    slice(x,y,z,tcell,[3],[],[],'cubic');  
%     axis([1 length+5 1 width+5 1 height+5]);
      axis equal;
    view(90,10);
    shading flat;
    caxis([min_temperature max_temperature]); %����ˮ������ɫӳ���ϵ
    colormap jet    %��׼��ɫ����
    colorbar
    drawnow;  %��ǰ���̻���
   
    %Һ���ڲ��ȴ����Լ�ɢ�ȹ���
    for x1=2:length-1
        for y1=2:width-1
            for z1=2:height-1     
                if(tcell_type(x1,y1,z1)==isHuman ||tcell_type(x1,y1,z1)==isHeat)
                      continue;
                else
                  %��������ȴ���   
                  if(tcell_type(x1+1,y1,z1)==isHuman||tcell_type(x1-1,y1,z1)==isHuman||...
                         tcell_type(x1,y1+1,z1)==isHuman||tcell_type(x1,y1-1,z1)==isHuman||...
                         tcell_type(x1,y1,z1+1)==isHuman||tcell_type(x1,y1,z1-1)==isHuman)
                    next_tcell(x1,y1,z1)=(lambda_human/(rho*c))*(time/(dis*dis))*(tcell(x1+1,y1,z1)+...
                    +tcell(x1-1,y1,z1)+tcell(x1,y1+1,z1)+...
                    tcell(x1,y1-1,z1)+tcell(x1,y1,z1+1)+tcell(x1,y1,z1-1)-6*tcell(x1,y1,z1))+...
                    +tcell(x1,y1,z1);
                  end
                    %���ұ�ɢ��
                  if(x1>1&&x1<disslayer_num||x1>length-disslayer_num && x1<length) 
                       next_tcell(x1,y1,z1)=(lambda/(rho*c))*(time/dis*dis)*...
                        (lambda*(tcell(x1,y1+1,z1)+tcell(x1,y1-1,z1)+tcell(x1,y1,z1+1)+tcell(x1,y1,z1-1)-4*tcell(x1,y1,z1))+...
                        lambda3*(tcell(x1-1,y1,z1)+tcell(x1+1,y1,z1)-2*tcell(x1,y1,z1)))+tcell(x1,y1,z1);
                   end
                   %ǰ���ɢ��
                   if(y1>1&&y1<disslayer_num||y1>width-disslayer_num && y1<width) 
                       next_tcell(x1,y1,z1)=(lambda/(rho*c))*(time/dis*dis)*...
                        (lambda*(tcell(x1+1,y1,z1)+tcell(x1-1,y1,z1)+tcell(x1,y1,z1+1)+tcell(x1,y1,z1-1)-4*tcell(x1,y1,z1))+...
                        lambda3*(tcell(x1,y1+1,z1)+tcell(x1,y1-1,z1)-2*tcell(x1,y1,z1)))+tcell(x1,y1,z1);
                   end
                   %�ױ�ɢ��
                   if(z1>1&&z1<disslayer_num)  
                       next_tcell(x1,y1,z1)=(lambda/(rho*c))*(time/dis*dis)*...
                        (lambda*(tcell(x1+1,y1,z1)+tcell(x1-1,y1,z1)+tcell(x1,y1+1,z1)+tcell(x1,y1-1,z1)-4*tcell(x1,y1,z1))+...
                        lambda3*(tcell(x1,y1,z1+1)+tcell(x1,y1,z1-1)-2*tcell(x1,y1,z1)))+tcell(x1,y1,z1);
                   end
                   %�����֮���ɢ��
                   if(z1>height-disslayer_num &&z1<height) 
                       next_tcell(x1,y1,z1)=(lambda/(rho*c))*(time/dis*dis)*...
                        (lambda*(tcell(x1+1,y1,z1)+tcell(x1-1,y1,z1)+tcell(x1,y1+1,z1)+tcell(x1,y1-1,z1)-4*tcell(x1,y1,z1))+...
                        lambda2*(tcell(x1,y1,z1+1)+tcell(x1,y1,z1-1)-2*tcell(x1,y1,z1)))+tcell(x1,y1,z1);
                   end
                   %Һ���ڲ��Ĵ���
                      next_tcell(x1,y1,z1)=(lambda/(rho*c))*(time/(dis*dis))*(tcell(x1+1,y1,z1)+...
                        +tcell(x1-1,y1,z1)+tcell(x1,y1+1,z1)+...
                        tcell(x1,y1-1,z1)+tcell(x1,y1,z1+1)+tcell(x1,y1,z1-1)-6*tcell(x1,y1,z1))+...
                        +tcell(x1,y1,z1);
                end
            end
        end
     end
    heatConvection(); %�ȶ�������
    humanHit();     %�˵��Ŷ�����
    
    tcell=next_tcell; 
    avg_t(i)=getAvgTemp(); %��ƽ���¶�
end