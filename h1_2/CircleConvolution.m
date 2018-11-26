function res = CircleConvolution(l, h)
    % ����l�ĳ���
    lLength = length(l);
    % ����h�ĳ���
    hLength = length(h);
    % Ϊ�������в��㣬ʹ���г��ȶ���Ϊ lLength + hLength - 1
    l = [l, zeros(1, hLength - 1)];
    h = [h, zeros(1, lLength - 1)];
    % ���е�DFT
    DFTl = fft(l);
    DFTh = fft(h);
    % IFFT�õ����
    
    % ע�⣺*Ϊ������� .*ΪԪ�����
    res = ifft(DFTl .* DFTh);
end