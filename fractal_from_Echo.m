function [D, x, y] = fractal_from_Echo(E,nbins)

    F = fftshift( fft2(E) );     
    P = abs(F).^2;
    [n1, n2] = size(E);

    k1 = (-n1/2 : n1/2-1)'; 
    k2 = (-n2/2 : n2/2-1);

    P(1,:)=[];    
    P(:,1)=[];
    k1(1)=[];
    k2(1)=[];

    [K1, K2] = meshgrid(k2, k1);
    R = sqrt(K1.^2 + K2.^2);
    R = R(:);
    P = P(:);



    r_edges = linspace(min(R), max(R), nbins);
    rvec = 0.5*(r_edges(1:end-1) + r_edges(2:end));
    Pr = zeros(size(rvec));
    for i = 1:length(rvec)
        idx = R >= r_edges(i) & R < r_edges(i+1);
        Pr(i) = mean(P(idx));     
    end


    valid = Pr > 0;   
    x = log(rvec(valid));   
    y = log(Pr(valid));    

    coeff = polyfit(x, y, 1);
    beta = -coeff(1);        


    D = (5 - beta) / 2; 
end
