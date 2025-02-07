function m = estimatem(steps)
sk1 = steps(length(steps));
sk = steps(length(steps) - 1);
%sk/sk1 = (m-1)/m;
%m(sk/sk1) = m - 1;
%(sk/sk1)m - m =- 1;
%m(sk/sk1 - 1) = -1;
%m = -1 / (sk/sk1 - 1);

m = 1 / (1 - abs(sk/sk1)); % elephant's version

% m = 1 / (1 - sk1/sk); % davide's version

end