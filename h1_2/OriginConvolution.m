function res = OriginConvolution(l, h)
    % ����l�ĳ���
    lLength = length(l);
    % ����h�ĳ���
    hLength = length(h);
    % (f*g)�����õ������еĳ���
    L = lLength + hLength -1;
    % ����¼���ս������������
    res = zeros(1, L);
    % forѭ�����μ���������������¼���������
    for i = 1:L
        for j = 1:hLength
            k = i - j + 1;
            if k >= 1 && k <= lLength
                res(i) = res(i) + l(k) * h(j);
            end
        end
    end
end
% ע�⣺
% functionĩβ�����end��������ú���ΪǶ�׺���