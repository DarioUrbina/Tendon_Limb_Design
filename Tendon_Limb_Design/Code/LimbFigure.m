function D = LimbFigure(q1_U, q2_U, l1, l2, leftXLimit, rightXLimit, upperYLimit, lowerYLimit)

q1_F_Uplimit = q1_U;
q2_F_Uplimit=q2_U;


figure
    x(1) = 0;
    y(1) = 0;
    x(2) = x(1) + l1 * cos((q1_F_Uplimit));
    y(2) = y(1) + l1 * sin((q1_F_Uplimit));
     x(3) = x(2) + l2 * cos((q2_F_Uplimit+q1_F_Uplimit)); %Here the angles need to be added in order to get q2 meassured from the first segment
%     x(3) = x(2) + l2 * cos(q2_F_Uplimit);    
     y(3) = y(2) + l2 * sin((q2_F_Uplimit+q1_F_Uplimit));
%     y(3) = y(2) + l2 * sin(q2_F_Uplimit);
    
    plot([0 0], [leftXLimit, rightXLimit],'k');
    hold on
    plot([upperYLimit, lowerYLimit],[0 0],'k');
    hold on

    plot(x(:),y(:));
%     xlim([-15 15]);
    title(['Posture with  q1:  ' num2str(rad2deg(q1_F_Uplimit))  'and    q2:  ' num2str(rad2deg(q2_F_Uplimit)) '  (deg) '])
    xlabel('cm')
    ylabel('cm')

    hold on
end
