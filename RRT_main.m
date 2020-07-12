clear
clc
qI = [0;0;0;0];
qG = [pi/6;pi/4;pi/3;pi/6];
NumNodes = 100;
deltaq = 0.1; %% step size of moving toward 
B = {[30 45 45 30; 12 12 15 15], [35 40 40 35;18 18 25 25], [15 20 20 15; 20 20 25 25]};
max = 2*pi;
L = 8; % length of one link of the serial manipulator
pg1 = polyshape([30 45 45 30], [12 12 15 15]);
plot(pg1)
hold on 
pg2 = polyshape([35 40 40 35], [18 18 25 25]);
plot(pg2)
hold on
pg3 = polyshape([15 20 20 15], [20 20 25 25]);
plot(pg3)
hold on
[path] = RRT_serial(qI, qG, NumNodes, deltaq, B, max, L)
v = VideoWriter('DaisyWu_Task1_RRT.avi');
v.FrameRate = 1;
open(v);
for i = 1:size(path,2)
    q = path(:,i);
    j1 = [0;0]; % origin of the serial manipulator
    j2 = [j1(1)+L*cos(q(1));j1(2)+L*sin(q(1))];
    j3 = [j2(1)+L*cos(q(2));j2(2)+L*sin(q(2))];
    j4 = [j3(1)+L*cos(q(3));j3(2)+L*sin(q(3))];
    j5 = [j4(1)+L*cos(q(4));j4(2)+L*sin(q(4))];
    j = [j1 j2 j3 j4 j5];
    plot([j1(1) j2(1) j3(1) j4(1) j5(1)], [j1(2) j2(2) j3(2) j4(2) j5(2)]);
    pause(2)
    cframe = getframe;
    writeVideo(v,cframe);
end 
close(v);

