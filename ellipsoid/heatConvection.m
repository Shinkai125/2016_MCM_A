%Һ���ڲ����ȶ�������
function heatConvection
global next_tcell;  %����״̬��Ԫ��
global length;      %Ԫ����ĳ����
global width;
global height;
global P;           %�ȶ���Ԫ���ƶ�����
global humanX_start;global humanX_end;  %����
global humanY_start;global humanY_end;
global humanZ_start;global humanZ_end;
global tcell_type; global ishuman;
 %�ȶ����ĸ��ʽ�������
      for x1=2:length-1
        for y1=2:width-1
            for z1=2:height-1
                %�ܿ�����
%                  if(x1<humanX_start-1||x1>humanX_end+1||y1<humanY_start-1||y1>humanY_end+1||z1<humanZ_start-1||z1>humanZ_end+1)
                    if(tcell_type(x1,y1,z1)==ishuman ||tcell_type(x1+1,y1,z1)==ishuman||tcell_type(x1-1,y1,z1)==ishuman||...
                         tcell_type(x1,y1+1,z1)==ishuman||tcell_type(x1,y1-1,z1)==ishuman||...
                         tcell_type(x1,y1,z1+1)==ishuman||tcell_type(x1,y1,z1-1)==ishuman)
                      continue;
                    else
                    %���ʺͱ߽�����
                    if (rand<P && z1<height-1 && y1<width-1 && x1<length-1 &&x1>2 &&y1>2 &&z1>2)  
                        if(rand<P&& next_tcell(x1,y1,z1)>next_tcell(x1,y1,z1+1))
                        temp=next_tcell(x1,y1,z1+1);
                        next_tcell(x1,y1,z1+1)=next_tcell(x1,y1,z1);
                        next_tcell(x1,y1,z1)=temp;
                        end
                        if(rand<P&& next_tcell(x1,y1,z1)>next_tcell(x1,y1+1,z1))   %ˮƽλ��ǰ����
                        temp=next_tcell(x1,y1+1,z1);
                        next_tcell(x1,y1+1,z1)=next_tcell(x1,y1,z1);
                        next_tcell(x1,y1,z1)=temp;
                        end
                        if(rand<P&&next_tcell(x1,y1,z1)>next_tcell(x1,y1-1,z1))   %ˮƽλ�ƺ����
                        temp=next_tcell(x1,y1-1,z1);
                        next_tcell(x1,y1-1,z1)=next_tcell(x1,y1,z1);
                        next_tcell(x1,y1,z1)=temp;
                        end
                        if(rand<P&&next_tcell(x1,y1,z1)>next_tcell(x1+1,y1,z1))   %ˮƽλ���Ҷ���
                        temp=next_tcell(x1+1,y1,z1);
                        next_tcell(x1+1,y1,z1)=next_tcell(x1,y1,z1);
                        next_tcell(x1,y1,z1)=temp;
                        end
                        if(rand<P&&next_tcell(x1,y1,z1)>next_tcell(x1-1,y1,z1))   %ˮƽλ�������
                        temp=next_tcell(x1-1,y1,z1);
                        next_tcell(x1-1,y1,z1)=next_tcell(x1,y1,z1);
                        next_tcell(x1,y1,z1)=temp;
                        end
                    end
                end
            end
        end
      end
end