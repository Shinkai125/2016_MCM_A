%�˵Ķ����Ĵ��ǿ�ƶ���ģ��
function humanHit
global next_tcell;  %����״̬��Ԫ��
global length;global width;global height;      %Ԫ����ĳ����
global P_hit;       %���������ĸ���

for i1=3:length-3
    for j1=3:width-3
        for k1=3:height-3
            temp=NaN;temp_x=i1;temp_y=j1;temp_z=k1;
            if(rand <P_hit)
                %Ѱ��Ħ���ھ����¶���͵�
                for i2=i1-1:i1+1
                    for j2=j1-1:j1+1
                        for k3=k1-1:k1+1
                            if(next_tcell(i2,j2,k3)<temp)
                                temp=next_tcell(i2,j2,k3);
                                temp_x=i2;temp_y=j2;temp_z=k3;
                            end
                        end
                    end
                end
            %�����ҵ���Ԫ��
            temp=next_tcell(i1,j1,k1);
            next_tcell(i1,j1,k1)=next_tcell(temp_x,temp_y,temp_z);
            next_tcell(temp_x,temp_y,temp_z)=temp;
            end
            
        end
    end 
end

end
