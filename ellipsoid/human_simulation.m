clc,clear;
%�˵���ʼ�����꣬�˵ĺ�ȣ�������¶�
human_start=10; human_v=3; human_temperature=37;
%���ͱ��
ishuman=30;
%Ԫ��֮��ľ���
dis=1;
%ʱ����
time=5000; 
%����Ƭ�������������壬���쳤���
length=30;width=30;height=30;
[x,y,z]=meshgrid(1:dis:length,1:dis:width,1:dis:height);
sum_cell=length*width*height;
%�趨�¶ȵı仯��Χ
min_temperature=1;
max_temperature=50;
%��������
t=1000;
%ÿ���ڵ�ƽ���¶�
avg_t=zeros(t,1);
%�趨��ʼ�¶�
tcell=zeros(length,width,height);
%�б����
tcell_type=5*zeros(length,width,height);
%��ʼ��������״����
% for thick=human_start-1:human_start+human_v
%     for i=1:height
%         tcell(human_start-1,thick,i)=human_temperature;
%         tcell(human_start,thick,i)=human_temperature;
%         tcell(human_start+1,thick,i)=human_temperature;
%         tcell(human_start+2,thick,i)=human_temperature;
%     end
%     for i=height:-1:height/2
%         tcell(human_start-2,thick,i)=human_temperature;
%         tcell(human_start-1,thick,i)=human_temperature;
%         tcell(human_start+2,thick,i)=human_temperature;
%         tcell(human_start+3,thick,i)=human_temperature;
%     end
% end
for thick=4:6
    for i=6:15
        for j=1:3
            tcell(i,thick,j)=human_temperature;
        end
    end
    for i=13:15
        for j=1:height
            tcell(i,thick,j)=human_temperature;
        end
    end
end
%��ʼ���б����
for i=1:length
    for j=1:width
        for k=1:height
            if tcell(i,j,k)==ishuman
                tcell_type(i,j,k)=ishuman;
            end
        end
    end
end
             
slice(x,y,z,tcell,[5],[],[],'linear');
caxis([min_temperature max_temperature]); %����ˮ������ɫӳ���ϵ
shading flat;
colormap jet    %��׼��ɫ����
colorbar
drawnow;  %��ǰ���̻���

