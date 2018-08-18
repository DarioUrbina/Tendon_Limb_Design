
figure
l1=4;
l2=4;
q1_Position=[0 10];
xlimit=[-20 40];
ylimit=[-5 10];
lastTouchPoint=-6;



for i=1:20     
    x(1) = q1_Position(1);
    y(1) = q1_Position(2);
    x(2) = q1_Position(1);
    y(2) = 0;
    x(3) = lastTouchPoint+i*2; 
    y(3) = 0;
    x(4) = q1_Position(1); 
    y(4) = q1_Position(2);
   
    mid_Hip_x=(q1_Position(1)-x(3))/2;
    mid_Hip_y=(q1_Position(2)-y(3))/2;
    
    slope=(y(3)-q1_Position(2))/(x(3)-q1_Position(1));
    deg=atand(slope);

%     plot(x(:),y(:));
    hold on 
    
    foot_q1_distance=sqrt(((x(1)-x(2))^2)-(y(1)-y(2))^2);
    c=sqrt(l1^2-(foot_q1_distance/2));
    

    if (x(3)<q1_Position(1))
%         plot ([mid_Hip_x+x(3) (mid_Hip_x+x(3))+(c*cosd(90+deg))], [mid_Hip_y+y(3) (mid_Hip_y+y(3))+(c*sind(90+deg))]);
%         hold on
        plot ([(mid_Hip_x+x(3))+(c*cosd(90+deg)) x(3)], [(mid_Hip_y+y(3))+(c*sind(90+deg)) y(3)]);
        hold on
        plot ([(mid_Hip_x+x(3))+(c*cosd(90+deg)) x(1)], [(mid_Hip_y+y(3))+(c*sind(90+deg)) y(1)]);

    else
%         plot ([mid_Hip_x+x(3) (mid_Hip_x+x(3))+(-c*cosd(90+deg))], [mid_Hip_y+y(3) (mid_Hip_y+y(3))+(-c*sind(90+deg))]);
%         hold on
        plot ([(mid_Hip_x+x(3))+(-c*cosd(90+deg)) x(3)], [(mid_Hip_y+y(3))+(-c*sind(90+deg)) y(3)]);
        hold on
        plot ([(mid_Hip_x+x(3))+(-c*cosd(90+deg)) x(1)], [(mid_Hip_y+y(3))+(-c*sind(90+deg)) y(1)]);
    end
    xlim(xlimit);
    ylim(ylimit);
    pbaspect([1 (ylimit(1)-ylimit(2))/(xlimit(1)-xlimit(2)) 1])
%     title(['Posture with  q1:  ' num2str(rad2deg(q1_F_Uplimit))  'and    q2:  ' num2str(rad2deg(q2_F_Uplimit)) '  (deg) '])
%     xlabel('cm')
%     ylabel('cm')

    hold on
end