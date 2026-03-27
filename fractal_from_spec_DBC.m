function [FD,x,y] = fractal_from_spec_DBC(Z1)

G = 256;   

Z1 = double(Z1);
[M, N] = size(Z1);


zmin_all = min(Z1(:));
zmax_all = max(Z1(:));
if zmax_all == zmin_all
    FD = 2;
    return
end


Zg = (Z1 - zmin_all) ./ (zmax_all - zmin_all);   
Zg = Zg * (G-1);
Zg = max(0, min(G-1, Zg));  

maxPow = floor(log2(min(M,N)));
s_list = 2 .^ (0:maxPow);   

Nr = zeros(1, length(s_list));

for j = 1:length(s_list)
    s = s_list(j);
    rows = floor(M / s);
    cols = floor(N / s);

    if rows < 1 || cols < 1
        Nr(j) = NaN;
        continue;
    end

    count = 0;
    h = s;  
    for r = 1:rows
        r0 = (r-1)*s + 1;
        r1 = r*s;
        for c = 1:cols
            c0 = (c-1)*s + 1;
            c1 = c*s;
            block = Zg(r0:r1, c0:c1);
            zmax = max(block(:));
            zmin = min(block(:));
            Nj = ceil( (zmax - zmin + 1) / h );
            count = count + Nj;
        end
    end
    Nr(j) = count;
end

valid = ~isnan(Nr) & (Nr>0);
s_valid = s_list(valid);
Nr_valid = Nr(valid);


if length(s_valid) < 2
    FD = NaN;
    warning('有效尺度过少，无法拟合分形维数。');
    return;
end

x = log(1 ./ s_valid);
y = log(Nr_valid);
p = polyfit(x, y, 1);
D = p(1);
FD = D;
end
