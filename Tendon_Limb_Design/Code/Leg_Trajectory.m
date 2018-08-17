q1_U=30;
q2_U=40;
l1=10;
l2=11;
leftXLimit=20;
rightXLimit=20;
upperYLimit=20;
lowerYLimit=20;

% q1_F_Uplimit = -90+q1_U;
% q2_F_Uplimit=q2_U;

figure

% plot([0 0], [leftXLimit, rightXLimit],'k');

% hold on
% plot([upperYLimit, lowerYLimit],[0 0],'k');

% hold on



for i=1:10     
    x(1) = 5;
    y(1) = 5;
    x(2) = 5;
    y(2) = 0;
    x(3) = 0+i; 
    y(3) = 0;
    x(4) = x(1); 
    y(4) = x(1);
   
    mid_Hip_x=(x(1)-x(3))/2
    mid_Hip_y=(y(1)-y(3))/2
    
    slope=(y(3)-y(1))/(x(3)-x(1));
    deg=atand(slope);
%     y ? y1 = m(x ? x1)
    acosd(x(1))
    
    p= (-slope*(8-mid_Hip_x))+mid_Hip_y;  

    plot(x(:),y(:));
    hold on 
%     plot ([mid_Hip_x+x(3) 8], [mid_Hip_y+y(3) p]);

    plot ([mid_Hip_x+x(3) (mid_Hip_x+x(3))+(3*cosd(90+deg))], [mid_Hip_y+y(3) (mid_Hip_y+y(3))+(3*sind(90+deg))]);

    xlim([-10 10])
    ylim([-10 10])
%     xlim([-15 15]);
%     title(['Posture with  q1:  ' num2str(rad2deg(q1_F_Uplimit))  'and    q2:  ' num2str(rad2deg(q2_F_Uplimit)) '  (deg) '])
%     xlabel('cm')
%     ylabel('cm')

    hold on
end