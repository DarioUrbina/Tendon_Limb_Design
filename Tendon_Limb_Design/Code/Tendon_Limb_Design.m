clear all
close all

	
F01 = 49; F02 = 49; F03 = 49; F04 = 49;     %Force values  
r1 = 10; r2 = 7; r3 = 8; r4 = 12;           %Moment arms 
l1 = 10; l2 = 10;                           % cm

F0 = diag([F01; F02; F03; F04]);            %Diagnal matrix for Fmax

R_Front = [-r1 -r1 r2 r2;                   % Moment arm matrices
            -r3 r4 -r3 r4];

q=[1.190800, 1.83641;                       % Angle of the joints (for all the required postures)
    1.062100, 1.87549;
    0.813389, 1.87549;
    0.700844, 1.83641;
    0.601398, 1.77215;
    0.518223, 1.68353;
    0.453598, 1.57080;
    0.409172, 1.43286;
    0.386661, 1.26610;
    0.389248, 1.06157]
        

for i=1:10
                               
        J_inv_Front = Jinv(q(i,1), q(i,2), l1, l2);        %Inverse Jacobian

        % H_front =  R_Front * F0;                         %For torque space plots.

        H_front = J_inv_Front'* R_Front * F0;                % Fot force space plots.%
        
        % %       V1          V2          V3          V4   (force vectors)
        x_F = [H_front(1,1) H_front(1,2) H_front(1,3) H_front(1,4)];
        y_F = [H_front(2,1) H_front(2,2) H_front(2,3) H_front(2,4)];
        
              comb=[0 0 0 0                                 %Combination for the Minkowski sum
                    0 0 0 1
                    0 0 1 0
                    0 0 1 1
                    0 1 0 0
                    0 1 0 1
                    0 1 1 0
                    0 1 1 1
                    1 0 0 0
                    1 0 0 1
                    1 0 1 0
                    1 0 1 1
                    1 1 0 0
                    1 1 0 1
                    1 1 1 0
                    1 1 1 1];
           vertex=zeros(16,1); 
           vertey=zeros(16,1);  


        figure                                                 %Showguing force vectors
        plot([0 0], [-5 5],'k');
        hold on
        plot([-5 5],[0 0],'k');
        hold on
        quiver([0 0 0 0],[0 0 0 0],x_F,y_F);
        title(['Feasible force set for   q1:  ' num2str(q(i,1)) ',    q2:  ' num2str(q(i,2)) ' (rad) '])
        xlabel('X direction force')
        ylabel('Y direction force')
        hold on
        
        for j=1:16                                              %All positive linear combination of vectors: Minkowski sum! 
            vertex(j)=comb(j,1)*x_F(1)+ comb(j,2)*x_F(2)+ comb(j,3)*x_F(3)+ comb(j,4)*x_F(4);
            vertey(j)=comb(j,1)*y_F(1)+ comb(j,2)*y_F(2)+ comb(j,3)*y_F(3)+ comb(j,4)*y_F(4);
            plot(vertex,vertey,'*')
            hold on
        end

        k = convhull(vertex,vertey);                            %Showing the convex polygon formed by the column space created by Minkoski sum                      
        plot(vertex(k),vertey(k),'r-',vertex,vertey,'b*')

        LimbFigure(q(i,1), q(i,2), l1, l2,-5,5,-5,5)

end

