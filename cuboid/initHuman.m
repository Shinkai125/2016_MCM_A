function initHuman
global length;global width;global height;
global tcell;global tcell_type; global isHuman;
global human_start; global human_v; global human_temperature;
%�˵���ʼ�����꣬�˵ĺ�ȣ�������¶�
human_start=15; human_v=3; human_temperature=37;
%���ͱ��
isHuman=30;
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
bottom_thick=4; %�°�����
top_thick=6;    %�ϰ�����
for thick=4:8
    for i=20:length-2  %�°�����
        for j=3:2+bottom_thick  %�°�����
            tcell(i,thick,j)=human_temperature;
        end
    end
    for i=length-2-top_thick:length-2    %�ϰ�����
        for j=3:height %�ϰ���߶�
            tcell(i,thick,j)=human_temperature;
        end
    end
end
            
%��ʼ���б����
for i=1:length
    for j=1:width
        for k=1:height
            if tcell(i,j,k)==human_temperature
                tcell_type(i,j,k)=isHuman;
            end
        end
    end
end
end