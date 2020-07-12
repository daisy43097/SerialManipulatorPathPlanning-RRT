function i = find_config_index(q, V)
[~,c] = find(V == q);
i = c(1);
% if c(1) == c(2)
%     i = c(1);
% end 