% nConst�Ƿֶ�С���еĳ���
function res = OverlapAddConvolution(l, h, nConst)
    % ����l�ĳ���
    lLength = length(l);
    % ����h�ĳ���
    hLength = length(h);
    % ����ֶ����еĳ���С��h���еĳ��ȵ����
    if nConst < hLength
        nConst = hLength + 1;
    end
    % ÿһ�ֶζξ������ĳ���
    convLength = nConst + hLength - 1;
    % ��ȡ���õ�ѭ������
    loopNum = ceil(lLength / nConst);
    % �����ڼ�¼��ǰС�ξ���Ľ������������
    lTemp = zeros(1, hLength - 1);
    l = [l, zeros(1, (loopNum + 1) * nConst - lLength)];
    % ����¼���ս������������
    res = zeros(1, (loopNum + 1) * nConst);
    
    for i = 0:loopNum
        % ������ֶ�����li�Ŀ�ʼλ��
        start = i * nConst + 1;
        % ʹ��Բ����������㵱ǰ�ε��߾��
        hTemp = ifft(fft(l(start : start + nConst - 1), convLength) .* fft(h, convLength));
        % ���ص��������
        hTemp(1 : hLength - 1) = hTemp(1 : hLength - 1) + lTemp;
        % ������Ĳ��ִ���lTemp�в�����һ������
        lTemp = hTemp(nConst + 1 : convLength);
        % �����μ����������������ж�Ӧ��λ��
        res(start : start + nConst - 1) = hTemp(1 : nConst); 
    end
    res = res(1:lLength+hLength-1);
end