function res = GoertzelPredict(audioSignalData, fs, dtmf, keys)
    % NΪ�������еĳ���
    N = length(audioSignalData); 
    % ������������У�����8��Ŀ��Ƶ�ʵ��������ڸ���
    t = N / fs * dtmf;
    Power = zeros(1,8);
    % xΪ����ֵ����
    seq = audioSignalData(1:N);
    % ��ǰ�油����0����������ĵ��Ƽ���
    temp = zeros(1,N+2);
   
    % ����8��Ƶ�ʷֱ�����Ƶ�ʶ�Ӧ�ĵ�����Power
    for m = 1:8
        % �˲�ϵ��
        fil = cos((2 * pi * t(m)) / N) * 2;
        % ʹ��Goertzel�㷨���е��Ƽ���
        for i = 1:N
            temp(i+2) = fil .* temp(i+1) - temp(i) + seq(i);
        end
        % ����Power
        Power(m)=temp(N+2).^2 + temp(N+1).^2 - fil .* temp(N+2) * temp(N+1);
    end
    Power = abs(Power);
    % �����ӽ����������к�
    row = Power(1:4) == max(Power(1:4));
    % �����ӽ����������к�
    col = Power(5:8) == max(Power(5:8));
   
    res = keys(row, col);                 %�ҵ���Ӧ����
end