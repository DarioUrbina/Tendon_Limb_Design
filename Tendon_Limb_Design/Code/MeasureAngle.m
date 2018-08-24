function [slope_b1_c1,slope_b2_c2]=MeasureAngle (x1, y1, x2, y2)


    %% Plots %%%%%%%%%%%%%%%Uncomment this section to test with TestingMeasuringAngle
%         figure %%%%%%%%%%%%Uncomment to test with TestingMeasuringAngle (Also uncomment plots)
% 
%     plot(x1,y1);                                  %Ploting a desplaced a triangle
%     hold on
%      plot(x2+x1(3),y2-y2(2)); %Perhaps get rid of this would workfor the complete project                     %Ploting a desplaced a triangle
% %     plot(x2,y2);     
%     xlim([-13 13]);
%     ylim([-13 13]);
    %% Getting slopes

    slope_a1_b1=(atand((y1(2)-y1(1))/(x1(2)-x1(1))));

    if (x1(3)>=x1(1))
        slope_b1_c1=90+(atand((y1(3)-y1(2))/(x1(3)-x1(2))));                              % Good
        slope_b2_c2=(atand((y2(3)-y2(2))/(x2(3)-x2(2))))+(90-slope_b1_c1) ;           % Good
    else
        slope_b1_c1=-(90-(atand((y1(3)-y1(2))/(x1(3)-x1(2)))));                           % Good
             if (x2(3)>=x2(1))
                slope_b2_c2=-(atand((y2(3)-y2(2))/(x2(3)-x2(2))))+(180-90+slope_b1_c1); % Good
%                   flag="Hi"
             else
%                 slope_b2_c2=180-atand((y2(3)-y2(2))/(x2(3)-x2(2)))+(180-90+slope_b1_c1) % Good
                 slope_b2_c2=90-(180-90-atand((y2(3)-y2(2))/(x2(3)-x2(2)))+(180-90+slope_b1_c1)); % Good
%                 flag="Hi"
             end

    end

end
