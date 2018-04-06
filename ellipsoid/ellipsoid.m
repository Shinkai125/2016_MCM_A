%����ԡ��Һ����άԪ���Զ���ģ��
global tcell;
global length;global width;global height;
global tcell_type;
clc,clear;
%�������г�����
length=100;width=60;height=40;
%Ԫ��֮��ľ���
dis=1;
%���µ�ʱ������
t=1;
%ÿ���ڵ�ƽ���¶�
avg_t=zeros(t,1);
%�趨�¶ȵı仯��Χ
min_temperature=20;
max_temperature=42;
%���������λ�ã�ͬʱҲ���������a,b,c��ֵ
center_length=length/2; 
center_width=width/2;
center_height=height/2;
[x,y,z]=meshgrid(1:dis:width+1,1:dis:length+1,1:dis:height+1);
[m,n,p]=size(x);
length=m-1;width=n-1;height=p-1;
tcell=zeros(m,n,p);
%�����б����
tcell_type=ones(m,n,p);
%��ʼ�¶ȵ�ȷ��
% for a=1:length   
%     for b=1:width
%         for c=1:height
%             tcell(a,b,c)=randi([40 41]);
%         end
%     end
% end
%����Ľ���
for a=1:m   
    for b=1:n
        for c=1:p
            %����������
            %�����������ⲿ��Ԫ��
            if power((a-center_length),2)/center_length^2+power((b-center_width),2)/center_width^2+power((c-center_height),2)/center_height^2>1
                tcell(a,b,c)=NaN;
                tcell_type(a,b,c)=0;
            %�������������ϵ�Ԫ��
            elseif power((a-center_length),2)/center_length^2+power((b-center_width),2)/center_width^2+power((c-center_height),2)/center_height^2<1 &&...
                power((a-center_length),2)/center_length^2+power((b-center_width),2)/center_width^2+power((c-center_height),2)/center_height^2>0.9
                tcell_type(a,b,c)=1;
                tcell(a,b,c)=15;
            %�����������ڲ���Ԫ��
            else
                tcell_type(a,b,c)=2;
                tcell(a,b,c)=randi([40,41]);
            end
            %ȥ���ϰ���
            if (isnan(tcell(a,b,c))==0)&&c>center_height+1   
                tcell(a,b,c)=NaN;
                tcell_type(a,b,c)=0;
            end
            if( isnan(tcell(a,b,c))==0 &&c==height/2)  %������Ӵ�
                tcell(a,b,c)=10;
            end
        end
        
    end
end
% initTub();
%��ʼģ��ɢ��
for s=1:t
    fprintf('��%dʱ��\n',s);
    slice(x,y,z,tcell,[-1:length+1],[],[],'linear');
%     axis([1 length,1 width+1,1 height/2]);
    axis equal;
    shading flat;
    caxis([min_temperature max_temperature]); %����ˮ������ɫӳ���ϵ
    colormap jet;
    colorbar;
    grid on;
    drawnow;
    for i=1:length
        for j=1:width
            for k=1:height/2
                if (tcell_type(i,j,k)==1)
                    tcell(i,j,k)=tcell(i,j,k)-1;
                end
            end
        end
    end
%     tcell=tcell-1;
    avg_t(s)=getAvgTemp();
end

