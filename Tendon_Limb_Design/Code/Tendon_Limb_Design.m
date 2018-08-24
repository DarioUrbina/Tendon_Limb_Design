function Tendon_Limb_Design(q)

sizzze=size(q,1)

motorForce=49*.85; 	%[N]__tendon tensions that the Faulhaber23.. motors can generate, 49 N is in Stall Torque, we can't consider that value
F01 = motorForce; F02 = motorForce; F03 = motorForce;  %Force values 

r1 = .23; r2 = .23;                          % m
% r1 = 1; r2 = 1;
 
l1 = .08; l2 = .078;                           % m

F0 = diag([F01; F02; F03]);                 %Diagnal matrix for Fmax           

% R_Front = [+r1 -r1 -r1 ;                    % Moment arm matrices
%            0  -r2 r2 ];
        
R_Front = [-r1 -r1 +r1 ;                   % Moment arm matrices
            r2  -r2 0 ];

        
% q=[30 30;                       % Angle of the joints (for all the required postures)
%     30 20
% ];
        
% figure
for i=1:sizzze
        disp=i*100 
%         disp=0 ;                      

        J_inv_Front = Jinv(deg2rad(q(i,1)), deg2rad(q(i,2)), l1, l2);        %Inverse Jacobian
%          J_inv_Front = Jinv((q(i,1)), (q(i,2)), l1, l2);        %Inverse Jacobian

        % H_front =  R_Front * F0;                         %For torque space plots.

        H_front = J_inv_Front'* R_Front * F0;                % Fot force space plots.%
        
        % %       V1          V2          V3          V4   (force vectors)
        
%           x_F = [ H_front(1,3) H_front(1,2) H_front(1,1) ];
%           y_F = [H_front(2,3) H_front(2,2) H_front(2,1) ];
%           
        x_F = [H_front(1,1) H_front(1,2) H_front(1,3) ];
        y_F = [H_front(2,1) H_front(2,2) H_front(2,3) ];

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


                                                          %Showing force vectors
        plot([0+disp 0], [-5+disp 5],'k');
%         axis([-50 70 -50 70])
        hold on
        plot([-5+disp 5],[0+disp 0],'k');
        hold on
         quiver([0+disp 0+disp 0+disp],[0 0 0],x_F+disp,y_F);
        title('Feasible force set') %for q1:  ' num2str(q(i,1)) ',    q2:  ' num2str(q(i,2)) ' (rad) '])
        xlabel('X direction force')
        ylabel('Y direction force')
        hold on
        
        for j=1:8                                              %All positive linear combination of vectors: Minkowski sum! 
            vertex(j)=comb(j,1)*x_F(1)+ comb(j,2)*x_F(2)+ comb(j,3)*x_F(3);
            vertey(j)=comb(j,1)*y_F(1)+ comb(j,2)*y_F(2)+ comb(j,3)*y_F(3);
            plot(vertex+disp,vertey,'*')
            hold on
        end

        k = convhull(vertex,vertey);                            %Showing the convex polygon formed by the column space created by Minkoski sum                      
        plot(vertex(k)+disp,vertey(k),'r-',vertex+disp,vertey,'b*')

%         LimbFigure(q(i,1), q(i,2), l1, l2,-5,5,-5,5)

end

end
