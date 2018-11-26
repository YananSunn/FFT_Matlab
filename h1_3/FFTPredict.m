function res = FFTPredict(audioSignalData, fs, dtmf, keys)
    % fft�任���Ƶ����
    p = abs(fft(audioSignalData,fs));       
    
    % fft�任��õ��ĵ�һ����ֵ��Ӧ��Ƶ��ֵ
    row = find(p(650:950) == max(p(650:950))) + 649; 
    % fft�任��õ��ĵڶ�����ֵ��Ӧ��Ƶ��ֵ
    col = find(p(1200:1700) == max(p(1200:1700))) + 1199;
    
    % ���׼Ƶ������õ���Ƶ������
    rf = abs(dtmf - row);          
    cf = abs(dtmf - col);
    % �����ӽ���Ƶ�ʵ��к�
    row = rf == min(rf);   
    % �����ӽ���Ƶ�ʵ��к�
    col = find(cf == min(cf)) - 4; 
    
    % ���ؽ��
    res = keys(row, col);
end