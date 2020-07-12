function [route, cost] = dijkstra(graph, ninit, ngoal)
n=size(graph,1);
dist(1:n) = inf;   % it stores the shortest distance between the source node and any other node;
prev =[];    % Previous node, informs about the best previous node known to reach each  network node 
dist(ninit) = 0;
U = [1:n];
while ismember(ngoal,U)
    [~,index]=min(dist(U));
    C = U(index);
    U(index) = [];
    for v=1:n
        if graph(C,v)>0 && graph(C,v) ~= inf
            if(dist(C)+graph(C,v))<dist(v)
                dist(v)=dist(C)+graph(C,v);
                prev(v)=C;
            end
        end
    end
end
prev_goal = [];
x = ngoal;
while prev(x) ~= ninit
    prev_goal = [prev_goal prev(x)];
    x = prev(x);
end
reverse = [prev_goal ninit];
r_route = [ngoal reverse];
route = flip(r_route);
cost = dist(ngoal);