function res = OriginConvolution(l, h)
    % 序列l的长度
    lLength = length(l);
    % 序列h的长度
    hLength = length(h);
    % (f*g)卷积后得到的序列的长度
    L = lLength + hLength -1;
    % 将记录最终结果的数组清零
    res = zeros(1, L);
    % for循环依次计算卷积结果并存入记录结果的数组
    for i = 1:L
        for j = 1:hLength
            k = i - j + 1;
            if k >= 1 && k <= lLength
                res(i) = res(i) + l(k) * h(j);
            end
        end
    end
end
% 注意：
% function末尾必须加end的情况：该函数为嵌套函数