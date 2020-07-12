function b = isconfig_collision_free(q, O, L)
j1 = [0;0]; % origin of the serial manipulator
j2 = [j1(1)+L*cos(q(1));j1(2)+L*sin(q(1))];
j3 = [j2(1)+L*cos(q(2));j2(2)+L*sin(q(2))];
j4 = [j3(1)+L*cos(q(3));j3(2)+L*sin(q(3))];
j5 = [j4(1)+L*cos(q(4));j4(2)+L*sin(q(4))];
j = [j1 j2 j3 j4 j5];
for i = 1:4
    r(i) = isintersect_linepolygon(j(:,i), j(:,i+1), O);
end 
if find(r==1)
    b = false;
else 
    b = true;
end 