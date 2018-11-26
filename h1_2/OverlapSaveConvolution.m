% N��DFT�ĵ���,��ÿ���������еĳ���
function res = OverlapSaveConvolution(l, h, N)
    % ����l�ĳ���
    lLength = length(l);
    % ����h�ĳ���
    hLength = length(h);
    % ÿ��С�ξ������Ч���ֵĳ���
    L = N - hLength + 1;  
    % ������Ч���ֵĳ���С��h���еĳ��ȵ����
    if L < hLength            
        L = hLength + 1;
    end
    % ��ȡ���õ�ѭ������
    loopNum = ceil(lLength / L);

    l = [zeros(1, hLength - 1), l];             
    l = [l, zeros(1, (loopNum + 1) * L - lLength)]; 
    % ����¼���ս������������
    res = zeros(1, (loopNum + 1) * L + hLength - 1);

    for i = 0:loopNum
        % ������ֶ�����li�Ŀ�ʼλ��
        start = i * L + 1; 
        % ��l������ȡ����������������
        lTemp = l(start : start + N - 1); 
        % ����õ���������h���еľ�����
        hTemp = ifft(fft(lTemp, N) .* fft(h, N));
        % ����������¼���������
        res(start + hLength - 1 : start + N - 1) = hTemp(hLength : N);
    end
    % �õ������صĽ��
    res = res(hLength : lLength + 2 * (hLength - 1));
end

