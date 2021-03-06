function Tendon_Limb_Design(q,Force,endPoint_Location,scaling_fator)

    sizze=size(q,1);
    Force=Force*scaling_fator;
    F01 = Force; F02 = Force; F03 = Force;     %Force values were randomly chosen 
    r1 = 2.3; r2 = 2.3;            %Moment arms obtained from Hwk 4 figure
    l1 = 8; l2 = 8;                           % cm

    F0 = diag([F01; F02; F03]);            %Diagnal matrix for Fmax

    R_Front = [-r1  r1 -r1 ;                   % Moment arm matrices
                -r2  0  r2];



for i=1:sizze
        disp=i*19;
%         disp=0 ;                      
        J_inv_Front = Jinv(deg2rad(q(i,1)), deg2rad(q(i,2)), l1, l2);       %Inverse Jacobian
%         J_inv_Front = Jinv((q(i,1)), (q(i,2)), l1, l2);        %Inverse Jacobian

        % H_front =  R_Front * F0;                         %For torque space plots.

        H_front = J_inv_Front'* R_Front * F0;                % Fot force space plots.%
        
        % %       V1          V2          V3          V4   (force vectors)
        x_F = [H_front(1,1) H_front(1,2) H_front(1,3)];
        y_F = [H_front(2,1) H_front(2,2) H_front(2,3)];
        
        comb=[0 0 0 
            0 0 1
            0 1 0
            0 1 1
            1 0 0
            1 0 1 
            1 1 0
            1 1 1];
           vertex=zeros(8,1); 
           vertey=zeros(8,1);  


%         figure                                                 %Showguing force vectors
          if (endPoint_Location~=0) 
%               quiver([endPoint_Location(i) endPoint_Location(i) endPoint_Location(i)],[0 0 0],x_F,y_F,'k','LineWidth', 3,'color',[.9 .9 .9 .9]);
%                quiver(endPoint_Location(i),0 ,x_F(1),y_F(1),'k','LineWidth', 2,'color',[0 0 1 .9],'MaxHeadSize',.5,'AutoScale','off' );
               quiver(endPoint_Location(i),0 ,x_F(1),y_F(1),'k','LineWidth', 2,'color',[0 0 0 .9],'MaxHeadSize',.5,'AutoScale','off' );

% plot([endPoint_Location(i),0] ;[x_F(1),y_F(1)])
              hold on
%                 quiver(endPoint_Location(i),0 ,x_F(2),y_F(2),'k','LineWidth', 2,'color',[1 0 0 .9],'MaxHeadSize',.5,'AutoScale','off' );
                quiver(endPoint_Location(i),0 ,x_F(2),y_F(2),'k','LineWidth', 2,'color',[0 0 0 .9],'MaxHeadSize',.5,'AutoScale','off' );

                
              hold on
%                 quiver(endPoint_Location(i),0 ,x_F(3),y_F(3),'k','LineWidth', 2,'color',[0 1 0 .9],'MaxHeadSize',.5,'AutoScale','off' );
                quiver(endPoint_Location(i),0 ,x_F(3),y_F(3),'k','LineWidth', 2,'color',[0 0 0 .9],'MaxHeadSize',.5,'AutoScale','off' );

              
          else
              quiver([disp disp disp],[0 0 0],x_F,y_F,'k','LineWidth', 3,'color',[0 0 1 .9]);
          end
          hold on
%         plot([0 0], [-5 5],'k');
%         hold on
%         plot([-5 5],[0 0],'k');
%         title(['Feasible force set [N]'])
%         xlabel('X direction force ')
%         ylabel('Y direction force [N]')
axis off
        hold on
        
        for j=1:8                                              %All positive linear combination of vectors: Minkowski sum! 
            vertex(j)=comb(j,1)*x_F(1)+ comb(j,2)*x_F(2)+ comb(j,3)*x_F(3);
            vertey(j)=comb(j,1)*y_F(1)+ comb(j,2)*y_F(2)+ comb(j,3)*y_F(3);
        end

        k = convhull(vertex,vertey);                            %Showing the convex polygon formed by the column space created by Minkoski sum                      
         if (endPoint_Location~=0)
           plot(vertex(k)+endPoint_Location(i),vertey(k),'r-')
         else
            plot(vertex(k)+disp,vertey(k),'r-')
         end


%         LimbFigure(q(i,1), q(i,2), l1, l2)
%                 LimbFigure(deg2rad(q(i,1)), deg2rad(q(i,2)), l1, l2)


end

end
