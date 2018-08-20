
%% Paremeters
l1=10;                 %Determines leg size, in this case we asume that upper and lower limb segments are the same size
% l2=4;
q1_Position=[0 16];    %Modify this parameter dependig on the leg size
xlimit=[-20 20];      %Modify this parameter dependig on the leg size
ylimit=[0 20];      %Modify this parameter dependig on the leg size
firstTouchPoint=20;    %Modify this parameter dependig on the leg size
%%
% slope1=zeros(1,6);
angleCount=0;

figure
% title(['Posture with  q1:  ' num2str(rad2deg(q1_F_Uplimit))  'and    q2:  ' num2str(rad2deg(q2_F_Uplimit)) '  (deg) '])
%     xlabel('cm')
%     ylabel('cm') 
%     hold on
%%
for i=1:2:45
    
%     i
    x(1) = q1_Position(1);
    y(1) = q1_Position(2);
    x(2) = q1_Position(1);
    y(2) = 0;
    x(3) = firstTouchPoint-i; 
    y(3) = 0;
    x(4) = q1_Position(1); 
    y(4) = q1_Position(2);
%    
    mid_Hip_x=(q1_Position(1)-x(3))/2;
    mid_Hip_y=(q1_Position(2)-y(3))/2;

%     plot(x(:),y(:));
%     hold on 
    if (x(3)<0)
    foot_q1_dist=sqrt(((x(1)+x(3))^2)+(y(1)-y(2))^2)
    else
    foot_q1_dist=sqrt(((x(1)-x(3))^2)+(y(1)-y(2))^2)   
    end
    max_dist=l1*2
    c=sqrt((l1^2-(foot_q1_dist/2)^2));
    
    slope=(y(3)-q1_Position(2))/(x(3)+q1_Position(1));
    deg=atand(slope);
    
    knee_push=[(mid_Hip_x+x(3))+(c*cosd(90+deg)) (mid_Hip_y+y(3))+(c*sind(90+deg))];
    knee_pull=[((mid_Hip_x+x(3))+(-c*cosd(90+deg))) ((mid_Hip_y+y(3))+(-c*sind(90+deg)))];
    
%     slope_l1=atand((knee_push(2)-y(1))/(knee_push(1)-x(1));
    
if(foot_q1_dist<=(l1*2))
    angleCount=angleCount+1;
    if (x(3)>q1_Position(1))

%         plot ([mid_Hip_x+x(3) (mid_Hip_x+x(3))+(-c*cosd(90+deg))], [mid_Hip_y+y(3) (mid_Hip_y+y(3))+(-c*sind(90+deg))]);
%         hold on
        subplot (4,1,1) 
        plot ([knee_pull(1) x(3)], [knee_pull(2) y(3)]);
        hold on
        subplot (4,1,1)
        plot  ([knee_pull(1) x(1)], [knee_pull(2) y(1)]);
        %a, hip, knee 
%         x1=[]
%         [deg1,deg2]=MeasureAngle (x1, y1, x2, y2)

%         slope_l1(angleCount)=atand(abs(y(1)-knee_pull(2))/abs(x(1)-knee_pull(2)));
        %% 
%         a(angleCount)=atand((knee_pull(2)-y(3))/(y(3)-knee_pull(1)))
        x1=[q1_Position(1) q1_Position(1) knee_pull(1) q1_Position(1)];
        y1=[knee_pull(2) q1_Position(2) knee_pull(2) knee_pull(2)];
        
        x2=[knee_pull(1) knee_pull(1) x(3) knee_pull(1)];
        y2=[knee_pull(2) y(3) y(3) knee_pull(2)];
        
       [deg1(angleCount),deg2(angleCount)]=MeasureAngle (x1, y1, x2, y2)
        
        
    else
    
%         plot ([mid_Hip_x+x(3) (mid_Hip_x+x(3))+(c*cosd(90+deg))], [mid_Hip_y+y(3) (mid_Hip_y+y(3))+(c*sind(90+deg))]);
%         hold on
        subplot (4,1,1);
        plot([knee_push(1) x(3)], [knee_push(2) y(3)]);
        hold on
        subplot (4,1,1);
        plot ([knee_push(1) x(1)], [knee_push(2) y(1)]);
        
%         slope_l1(angleCount)=atand((knee_push(2)-y(1))/(knee_push(2)-x(1)));  
%         a(angleCount)=atand((knee_pull(2)-y(3))/(y(3)-knee_pull(1)))
        
        x1=[q1_Position(1) q1_Position(1) knee_push(1) q1_Position(1)];
        y1=[knee_push(2) q1_Position(2) knee_push(2) knee_push(2)];
        
        x2=[knee_push(1) knee_push(1) x(3) knee_push(1)];
        y2=[knee_push(2) y(3) y(3) knee_push(2)]; 
        [deg1(angleCount),deg2(angleCount)]=MeasureAngle (x1, y1, x2, y2);

if (x(3)<knee_push(1))

deg2(angleCount)=-deg2(angleCount)
  end
    end
end
    xlim(xlimit);
    ylim(ylimit);
    pbaspect([1 (ylimit(1)-ylimit(2))/(xlimit(1)-xlimit(2)) 1])


    hold on
end

subplot (4,1,2)
plot (deg1)
    ylim([-60 50]);
subplot (4,1,3)
plot (deg2)
     ylim([30 100]);
     
subplot

Tendon_Limb_Design



    