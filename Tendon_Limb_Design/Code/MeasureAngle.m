close all

figure


x=[0 0 -21 0];
y=[0 10 0 0];

x2=[0 0 10 0];
y2=[0 1 0 0];

a=[0 0];
b=[0 4];
c=[3 0];
d=[0 0];

plot([a(1) b(1)],[a(2) b(2)]);              %PLoting a line  
hold on 
plot(x,y);                                  %Ploting a desplaced a triangle
hold on
% x(3)
plot(x2+x(3),y2-y2(2));                      %Ploting a desplaced a triangle



xlim([-13 13]);
ylim([-13 13]);


slope_a_b=(atand((y(2)-y(1))/(x(2)-x(1))))

if (x(3)>=x(1))
    slopea_b_c=90+(atand((y(3)-y(2))/(x(3)-x(2))))     %%Good
    slope_b2_c2=(atand((y2(3)-y2(2))/(x2(3)-x2(2))))+(90-slopea_b_c)        %%Good
else
    slopea_b_c=-(90-(atand((y(3)-y(2))/(x(3)-x(2)))))
         if (x2(3)>=x2(1))
            slope_b2_c2=-(atand((y2(3)-y2(2))/(x2(3)-x2(2))))+(180-90+slopea_b_c)
%             flag="Hi"
         else
             slope_b2_c2=180-atand((y2(3)-y2(2))/(x2(3)-x2(2)))+(180-90+slopea_b_c)
             flag="Hi"
         end
        
end

% slope_b2_c2=90+(atand((y2(3)-y2(2))/(x2(3)-x2(2))))-slopea_b_c




ang=atand((y(2)-y(1))/(x(2)-x(1)));
