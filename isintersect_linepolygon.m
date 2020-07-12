function b = isintersect_linepolygon(p0, p1, O)
[~,c] = size(O);
for j = 1:c
    Q = O{1,j};
    r(j) = isintersect_line1polygon(p0, p1, Q);
end 
if find(r==1)
    b = true;
else 
    b = false;
end
end 

function b = isintersect_line1polygon(p0, p1, Q)
Q = [Q Q(:,1)];
if (p0-p1) == 0
    xv = Q(1,:);
    yv = Q(2,:);
    b = inpolygon(p0(1),p0(2),xv,yv);
else
    tE = 0; tL = 1;
    ds = p1 - p0;
    for i = 1:(size(Q,2)-1)
        e = [(Q(:,i+1) - Q(:,i));0];
        normv = cross(e, [0;0;1]);
        ni = normv/norm(normv);
        n = ni(1:2);
        N = dot(-(p0 - Q(:,i)), n);
        D = dot(ds, n);
        if D == 0
            if N < 0
                b = false;
            end
        end
        t = N/D;
        if D < 0
            tE = max(tE, t);
            if tE > tL
                b = false;
            end
        elseif D > 0
            tL = min(tL, t);
            if tL < tE
                b = false;
            end
        end
    end
    if tE <= tL
        b = true;
    else
        b = false;
    end
end
end
