
figure
l1=14;
l2=4;
q1_Position=[5 5];


for i=1:10     
    x(1) = q1_Position(1);
    y(1) = q1_Position(2);
    x(2) = q1_Position(1);
    y(2) = 0;
    x(3) = 0+i; 
    y(3) = 0;
    x(4) = q1_Position(1); 
    y(4) = q1_Position(2);
   
    mid_Hip_x=(q1_Position(1)-x(3))/2;
    mid_Hip_y=(q1_Position(2)-y(3))/2;
    
    slope=(y(3)-q1_Position(2))/(x(3)-q1_Position(1));
    deg=atand(slope);

    plot(x(:),y(:));
    hold on 
    
    foot_q1_distance=sqrt(((x(1)-x(2))^2)-(y(1)-y(2))^2);
    c=sqrt(l1^2-(foot_q1_distance/2));
    

    if (x(3)<q1_Position(1))
        plot ([mid_Hip_x+x(3) (mid_Hip_x+x(3))+(c*cosd(90+deg))], [mid_Hip_y+y(3) (mid_Hip_y+y(3))+(c*sind(90+deg))]);
    else
        plot ([mid_Hip_x+x(3) (mid_Hip_x+x(3))+(-c*cosd(90+deg))], [mid_Hip_y+y(3) (mid_Hip_y+y(3))+(-c*sind(90+deg))]);
    end
    xlim([-10 10]);
    ylim([-10 10]);
%     title(['Posture with  q1:  ' num2str(rad2deg(q1_F_Uplimit))  'and    q2:  ' num2str(rad2deg(q2_F_Uplimit)) '  (deg) '])
%     xlabel('cm')
%     ylabel('cm')

    hold on
end