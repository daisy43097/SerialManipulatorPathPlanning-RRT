function [path, V, E] = RRT_serial(qI, qG, NumNodes, deltaq, B, max, L)
V = [qI];
E = [];
EI = [];
weights = [];
[~,c] = size(B);
for i = 1:c % ordering obstacles into ccw 
    D = B{1,i};
    o = ordering(D);
    B{1,i} = o;
end 
for k = 1:NumNodes
    qrand = [max*rand(4,1)];
    qnear = Nearest_config(qrand, V);
    Inear = find_config_index(qnear, V);
    q = New_config(qnear, qrand, deltaq);
    if isconfig_collision_free(q, B, L)
        if isintersect_linkpolygon(qnear, q, B, L) == 0
            qnew = q;
            V = [V qnew];
            Inew = size(V,2);
            E = [E [qnear;qnew]];
            EI = [EI [Inear;Inew]];
            weights = [weights [config_dist(qnear, qnew)]];
            if config_dist(qnew, qG) < 0.7 && isintersect_linkpolygon(qnew, qG, B, L) == 0
                n = size(V,2);
                G = ones(n)*Inf;
                for i = 1 : n
                    G(i,i) = 0;
                end
                for i = 1:size(EI,2)
                    G(EI(1,i),EI(2,i)) = 1;
                    G(EI(2,i),EI(1,i)) = 1;
                end
                route = dijkstra(G,1,Inew);
                path = [V(:,route) qG];
            end 
        end 
    end 
end 
