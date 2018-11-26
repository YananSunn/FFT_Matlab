function res = GoertzelPredict(audioSignalData, fs, dtmf, keys)
    % N为采样序列的长度
    N = length(audioSignalData); 
    % 声音检测区段中，包含8个目标频率的完整周期个数
    t = N / fs * dtmf;
    Power = zeros(1,8);
    % x为采样值序列
    seq = audioSignalData(1:N);
    % 在前面补两个0，便于下面的递推计算
    temp = zeros(1,N+2);
   
    % 对于8个频率分别计算该频率对应的的能量Power
    for m = 1:8
        % 滤波系数
        fil = cos((2 * pi * t(m)) / N) * 2;
        % 使用Goertzel算法进行递推计算
        for i = 1:N
            temp(i+2) = fil .* temp(i+1) - temp(i) + seq(i);
        end
        % 计算Power
        Power(m)=temp(N+2).^2 + temp(N+1).^2 - fil .* temp(N+2) * temp(N+1);
    end
    Power = abs(Power);
    % 求出最接近的能量的行号
    row = Power(1:4) == max(Power(1:4));
    % 求出最接近的能量的列号
    col = Power(5:8) == max(Power(5:8));
   
    res = keys(row, col);                 %找到对应按键
end