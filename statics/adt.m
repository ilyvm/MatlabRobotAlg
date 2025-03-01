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



%?????????????????????;



function ad = adt(T)

    R = T(1:3,1:3);
    P = T(1:3,4);
    
    ad = zeros(6,6);
    
    sp = S_alg(P);
    
    ad(1:3,1:3) = R;
    ad(4:6,1:3) = sp*R;
    ad(4:6,4:6) = R;


end


