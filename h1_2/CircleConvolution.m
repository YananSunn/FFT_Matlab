function res = CircleConvolution(l, h)
    % 序列l的长度
    lLength = length(l);
    % 序列h的长度
    hLength = length(h);
    % 为两个序列补零，使序列长度都变为 lLength + hLength - 1
    l = [l, zeros(1, hLength - 1)];
    h = [h, zeros(1, lLength - 1)];
    % 序列的DFT
    DFTl = fft(l);
    DFTh = fft(h);
    % IFFT得到结果
    
    % 注意：*为矩阵相乘 .*为元素相乘
    res = ifft(DFTl .* DFTh);
end