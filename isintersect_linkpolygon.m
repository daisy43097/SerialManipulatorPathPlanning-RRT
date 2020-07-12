function b = isintersect_linkpolygon(q1, q2, O, L)
L1 = [0;0];
L2 = [0;0];
for i = 1:4
    L1(:,i+1) = [L1(1,i)+L*cos(q1(i)); L1(2,i)+L*sin(q1(i))];
    L2(:,i+1) = [L2(1,i)+L*cos(q2(i)); L2(2,i)+L*sin(q2(i))];
end 
for j = 1:5
    r(i) = isintersect_linepolygon(L1(:,j), L2(:,j), O);
end 
if find(r==1)
    b = true;
else 
    b = false;
end 
