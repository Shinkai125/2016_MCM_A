%��ʼ�¶�ȷ��
function initTub
global tcell;
global tcell_type;
global length;      %Ԫ����ĳ����
global width;
global height;
global humanX_start;global humanX_end;
global humanY_start;global humanY_end;
global humanZ_start;global humanZ_end;
global isHeat;
global isWater;
isWater=1;
for a=2:length-1  
    for b=2:width-1
        for c=2:height-1
            tcell(a,b,c)=randi([40 41]);
            tcell_type(a,b,c)=isWater;
        end
    end
end
%�����¶�
air_temperature=20;
%ԡ�ױ��¶�
tub_temperature=30;
%��Եϸ����״̬����
tcell(1,:,:)=tub_temperature;  %��ԡ�׽Ӵ�����Ԫ�����¶�
tcell(:,1,:)=tub_temperature;
tcell(:,:,1)=tub_temperature;
tcell(length:length+1,:,:)=tub_temperature;
tcell(:,width:width+1,:)=tub_temperature;
tcell(:,:,height:height+1)=air_temperature; %�����ֱ�ӽӴ�����Ԫ�����¶�

%���ˮ��ͷ��Դ
isHeat=37;
hs_temperature=47.5;      %��Դ���¶�
hs_x=3;hs_y=3;   %��Դ����ʼ����
hs_length=2;hs_width=3;hs_height=7; %��Դ�ĳߴ�
% ������Դ0
for i=hs_x:hs_x+hs_length
    for j=hs_y:hs_width+hs_y
        for k=height:-1:height-hs_height
            tcell(i,j,k)=hs_temperature;
            tcell_type(i,j,k)=isHeat;
        end
    end
end
% hs_x=length/2;hs_y=3;   %��Դ����ʼ����
% hs_length=2;hs_width=2;hs_height=2; %��Դ�ĳߴ�
% for i=hs_x:hs_x+hs_length
%     for j=hs_y:hs_width+hs_y
%         for k=height:-1:height-hs_height
%             tcell(i,j,k)=hs_temperature;
%             tcell_type(i,j,k)=isHeat;
%         end
%     end
% end
% hs_x=length-3;hs_y=3;   %��Դ����ʼ����
% hs_length=2;hs_width=2;hs_height=2; %��Դ�ĳߴ�
% for i=hs_x:hs_x+hs_length
%     for j=hs_y:hs_width+hs_y
%         for k=height:-1:height-hs_height
%             tcell(i,j,k)=hs_temperature;
%             tcell_type(i,j,k)=isHeat;
%         end
%     end
% end
% hs_x=3;hs_y=width-3;   %��Դ����ʼ����
% hs_length=2;hs_width=2;hs_height=2; %��Դ�ĳߴ�
% for i=hs_x:hs_x+hs_length
%     for j=hs_y:hs_width+hs_y
%         for k=height:-1:height-hs_height
%             tcell(i,j,k)=hs_temperature;
%             tcell_type(i,j,k)=isHeat;
%         end
%     end
% end
% hs_x=length/2;hs_y=width-3;   %��Դ����ʼ����
% hs_length=2;hs_width=2;hs_height=2; %��Դ�ĳߴ�
% for i=hs_x:hs_x+hs_length
%     for j=hs_y:hs_width+hs_y
%         for k=height:-1:height-hs_height
%             tcell(i,j,k)=hs_temperature;
%             tcell_type(i,j,k)=isHeat;
%         end
%     end
% end
% hs_x=length-3;hs_y=width-3;   %��Դ����ʼ����
% hs_length=2;hs_width=2;hs_height=2; %��Դ�ĳߴ�
% for i=hs_x:hs_x+hs_length
%     for j=hs_y:hs_width+hs_y
%         for k=height:-1:height-hs_height
%             tcell(i,j,k)=hs_temperature;
%             tcell_type(i,j,k)=isHeat;
%         end
%     end
% end

%����
% humanX_start=20;humanX_end=24;
% humanY_start=width/2-3;humanY_end=width/2+3;
% humanZ_start=2;humanZ_end=height;
% tcell(humanX_start:humanX_end,humanY_start:humanY_end,humanZ_start:humanZ_end)=37.5;
end
