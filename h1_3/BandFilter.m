function res = BandFilter(Wpassband, Wstopband, Audio)
    % 波动（单位dB）
    Rp = 0.5;
    % 衰减（单位dB）
    Rs = 40;
    Wpassband = Wpassband / 22050;
    Wstopband = Wstopband / 22050;
    % （切比雪夫）II型滤波器阶的选择
    [n, Wn] = cheb2ord(Wpassband, Wstopband, Rp, Rs);
    [b, a] = cheby2(n, Rs, Wn);
    % 将得到的结果通过滤波器得到最终结果并返回
    res = filter(b, a, Audio);
end