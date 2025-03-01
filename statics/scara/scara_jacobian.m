% -------------------------------------------------------------------------
% Author: [Tiny][YuZhi]                      
% Contact: [tiny_h@163.com] 
% GitHub: [https://github.com/Tiny-HQ] 
% Zhihu:[https://www.zhihu.com/people/tiny_hq]
% Copyright (c) [2024] [Tiny][YuZhi]. All rights reserved.
% 
% This code is for academic, educational, and non-commercial use only.
% Unauthorized use, reproduction, or distribution is prohibited.
% 
% Disclaimer: This code is provided "as is" without any warranties. Use at your own risk.
% The author is not responsible for any robot or machine safety-related issues arising from the use of this code.
% -------------------------------------------------------------------------



function J = scara_jacobian(DH,q,opt)

    a1= DH.a(2); a2= DH.a(3); d3 = q(3)+DH.d(3);
    d1 = 0;d4 = 0.0;a3 = 0.0;

    a0 = 0;
    d2 = 0;

    if strcmp(opt,'deg')
        q = q*pi/180.0;
    elseif strcmp(opt,'rad')
       ;
    else
        q = q*pi/180.0;
    end

    if strcmp(opt,'deg')
        alpha= DH.alpha*pi/180.0;
        theta = DH.theta*pi/180.0;
    elseif strcmp(opt,'rad')
        ;
    else
        alpha= DH.alpha*pi/180.0;
        theta = DH.theta*pi/180.0;
    end
    
    q = q+theta;%theta��ƫ�� offset
    alpha0 = alpha(1); alpha1 = alpha(2); alpha2 = alpha(3);alpha3 = alpha(4); 
        
        
    T01 = create_link(q(1),d1,alpha0,a0,'rad');
    T12 = create_link(q(2),d2,alpha1,a1,'rad');
    T23 = create_link(q(3),d3,alpha2,a2,'rad');
    T34 = create_link(q(4),d4,alpha3,a3,'rad');


    J = zeros(6,4);
    
    z0 = [0 0 1]';p0 = [0 0 0 1]';
    z1 = splitT_R(T01)*z0;z2 = splitT_R(T01*T12)*z0;z3 = splitT_R(T01*T12*T23)*z0;
    z4 = splitT_R(T01*T12*T23*T34)*z0;
    p1 = T01*p0; p2 = T01*T12*p0;p3 = T01*T12*T23*p0;p4 = T01*T12*T23*T34*p0;
    p0 = p0(1:3); p1 = p1(1:3);  p2 = p2(1:3);  p3 = p3(1:3);  p4 = p4(1:3); 
    
    J(4:6,1) = z1; J(4:6,2) = z2; J(4:6,4) = z4; 
    J(1:3,1) = cross(z1,p4-p1);
    J(1:3,2) = cross(z2,p4-p2);
    J(1:3,3) = z3;
    J(1:3,4) = cross(z4,p4-p4);


end