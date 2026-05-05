function out = test(dp)

    d = dp;
    cg = zeros(1, dp-1);
    cg(1) = 1;

    for i = 1:dp
        cg = cg + (1/i) * [0, cg(1:end-1)];
    end

    ch = zeros(1, dp-1);
    ch(1) = 1;

    for i = dp+1 : 2*dp
        ch = ch + (1/i) * [0, ch(1:end-1)];
    end

    L = [];

    while ch(2) < cg(2)

        c = ch - cg;
        d = d + 1;

        ch = ch + (1/(d+dp)) * [0, ch(1:end-1)];

        sign_changes = 0;
        for i = 1:length(c)-1
            if c(i)*c(i+1) < 0
                sign_changes = sign_changes + 1;
            end
        end

        L(end+1) = sign_changes;
    end

    out = [max(L), dp, d];
end