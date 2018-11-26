function res = FFTPredict(audioSignalData, fs, dtmf, keys)
    % fft变换后的频域函数
    p = abs(fft(audioSignalData,fs));       
    
    % fft变换后得到的第一个峰值对应的频率值
    row = find(p(650:950) == max(p(650:950))) + 649; 
    % fft变换后得到的第二个峰值对应的频率值
    col = find(p(1200:1700) == max(p(1200:1700))) + 1199;
    
    % 与标准频率作差得到的频率序列
    rf = abs(dtmf - row);          
    cf = abs(dtmf - col);
    % 求出最接近的频率的行号
    row = rf == min(rf);   
    % 求出最接近的频率的列号
    col = find(cf == min(cf)) - 4; 
    
    % 返回结果
    res = keys(row, col);
end