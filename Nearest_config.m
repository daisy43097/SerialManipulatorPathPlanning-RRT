function qnew = Nearest_config(q, V)
d = 1e10;
for i = 1:size(V,2)
    v = V(:,i);
    if config_dist(q,v) < d
        qnew = v;
        d = config_dist(q,v);
    end 
end 