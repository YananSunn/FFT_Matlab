% N是DFT的点数,即每段输入序列的长度
function res = OverlapSaveConvolution(l, h, N)
    % 序列l的长度
    lLength = length(l);
    % 序列h的长度
    hLength = length(h);
    % 每次小段卷积的有效部分的长度
    L = N - hLength + 1;  
    % 处理有效部分的长度小于h序列的长度的情况
    if L < hLength            
        L = hLength + 1;
    end
    % 上取整得到循环次数
    loopNum = ceil(lLength / L);

    l = [zeros(1, hLength - 1), l];             
    l = [l, zeros(1, (loopNum + 1) * L - lLength)]; 
    % 将记录最终结果的数组清零
    res = zeros(1, (loopNum + 1) * L + hLength - 1);

    for i = 0:loopNum
        % 计算出分段序列li的开始位置
        start = i * L + 1; 
        % 从l序列中取出参与计算的子序列
        lTemp = l(start : start + N - 1); 
        % 计算得到子序列与h序列的卷积结果
        hTemp = ifft(fft(lTemp, N) .* fft(h, N));
        % 将结果存入记录结果的数组
        res(start + hLength - 1 : start + N - 1) = hTemp(hLength : N);
    end
    % 得到待返回的结果
    res = res(hLength : lLength + 2 * (hLength - 1));
end

