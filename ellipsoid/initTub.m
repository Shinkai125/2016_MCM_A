%��ʼ�¶�ȷ��
function initTub
global tcell;
global length;      %Ԫ����ĳ����
global width;
global height;
global tcell_type;
%�����¶�
air_temperature=15;
%ԡ�ױ��¶�
tub_temperature=25;
%��ʼ��ԡ���¶�
for a=1:length
    for b=1:width
        for c=1:height/2
            if(tcell_type(a,b,c)==2)  %Һ���ڲ�
                tcell(a,b,c)=randi([40,41]);
            elseif(tcell_type(a,b,c)==1) %ԡ�ױ���
                tcell(a,b,c)=tub_temperature;
            end
            if( isnan(tcell(a,b,c))==0 &&c==height/2)  %������Ӵ�
                tcell(a,b,c)=air_temperature;
            end
        end
    end
end


end
