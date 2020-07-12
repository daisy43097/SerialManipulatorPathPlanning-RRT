function ordered_A = ordering(A)
y = A(2,:);
x = A(1,:);
cx = mean(x);
cy = mean(y);
a = atan2(y-cy,x-cx);
[~,order] = sort(a);
x = x(order);
y = y(order);
ordered_A = [x;y];
end 
