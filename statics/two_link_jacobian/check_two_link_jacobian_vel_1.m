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

%+---+-----------+-----------+-----------+-----------+-----------+
%| j |     theta |         d |         a |     alpha |    offset |
%+---+-----------+-----------+-----------+-----------+-----------+
%|  1|         q1|         d1|         a0|     alpha0|          0|
%|  2|         q2|         d2|         a1|     alpha1|          0|
%|  3|         q3|         d3|         a2|     alpha2|          0|
%+---+-----------+-----------+-----------+-----------+-----------+

%+---+-----------+-----------+-----------+-----------+-----------+
%| j |     theta |         d |         a |     alpha |    offset |
%+---+-----------+-----------+-----------+-----------+-----------+
%|  1|          0|          0|          0|        0.0|          0|
%|  2|          0|          0|         L1|        0.0|          0|
%|  3|          0|          0|         L2|        0.0|          0|
%+---+-----------+-----------+-----------+-----------+-----------+


clc;
clear;



L1 = 1.0;
L2 = 2.0;

DH.d(1) = 0;DH.d(2) = 0;DH.d(3) = 0;
DH.a(1) = 0;DH.a(2) = L1;DH.a(3) = L2;
DH.alpha(1) = 0;DH.alpha(2) = 0;DH.alpha(3) = 0;

Ts = 0.001;
qs = [10 20 -35 15 30 0];
seq = 0:Ts:pi;
sinq = 30*sin(seq);


lengthq = length(seq);
q = zeros(2,lengthq);
dq = 30*sin(seq+pi/2);
ddq = 30*sin(seq+pi);

for i = 1:lengthq   
    q(1,i) = qs(1)+sinq(i);
    q(2,i) = qs(2)+sinq(i);
end


v = zeros(6,lengthq);
dv = zeros(2,lengthq);

v_h = zeros(2,lengthq);
dv_h = zeros(2,lengthq);



p = zeros(6,lengthq);

for i = 1:lengthq
     
    J =  cal_two_link_jacobian(DH,q(:,i)','deg');
   v(:,i) = J*(dq(i)*pi/180*[1 1])';
   
  %   J =  cal_two_link_jacobian(DH,q(:,i)','deg');
 
   [T] = two_link_fkine(DH,q(:,i)','deg');
   p(:,i) = (htr2zyx(T))';   
   
end

% use matrix, and some 
if 1
    figure;
    subplot(2,1,1);
    plot(v(1,:),'r');hold on;
    plot(diff(p(1,:))/Ts);
    subplot(2,1,2);
    plot(v(2,:),'r');hold on;
    plot(diff(p(2,:))/Ts);
end









