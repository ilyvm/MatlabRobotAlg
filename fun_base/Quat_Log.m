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

function [lnq] = Quat_Log(q)
   
    limit = 0.0001;
    q_ = Quat_Unit(q);    
    cosa = q_(1);sina = sqrt(q_(2)^2+q_(3)^2+q_(4)^2);
    if((abs(cosa-1)<limit)||(abs(cosa+1)<limit))
        theta = 0;
        n = [0 0 0 0];
        lnq = 2*theta*n;      
    else
        theta = atan2(sina,cosa);
        n1 = q_(2)/sin(theta);n2 = q_(3)/sin(theta);n3 = q_(4)/sin(theta);
        n = [0 n1 n2 n3];
        lnq = 2*theta*n;
    end
 
end
