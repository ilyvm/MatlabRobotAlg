% -------------------------------------------------------------------------
% Author: [Tiny][YuZhi]                      
% Contact: [tiny_h@163.com] 
% GitHub: [https://github.com/Tredin] 
% Zhihu:[https://www.zhihu.com/people/tiny_hq]
% Copyright (c) [2024] [Tiny][YuZhi]. All rights reserved.
% 
% This code is for academic, educational, and non-commercial use only.
% Unauthorized use, reproduction, or distribution is prohibited.
% 
% Disclaimer: This code is provided "as is" without any warranties. Use at your own risk.
% The author is not responsible for any robot or machine safety-related issues arising from the use of this code.
% -------------------------------------------------------------------------


%根据动力学模型公式计算角度、角速度、加速度下的力矩;Calculate the moment under angle, angular velocity and acceleration according to the dynamic model formula;


function tao = pend_cal_tao(acc,vel,theta)

    global Pi g;
    L = 1.0;

    theta = theta*pi/180.0;
    vel = vel*pi/180.0;
    acc = acc*pi/180.0;
   
    tao =(26*acc)/125 + (L*((2409*L*acc)/2000 - (2409*g*cos(theta))/1000))/2;%由pend_cal_formula()计算得到的；calculated from pend_cal_formula();

    tao = tao;

end









