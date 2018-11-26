function res = BandFilter(Wpassband, Wstopband, Audio)
    % ��������λdB��
    Rp = 0.5;
    % ˥������λdB��
    Rs = 40;
    Wpassband = Wpassband / 22050;
    Wstopband = Wstopband / 22050;
    % ���б�ѩ��II���˲����׵�ѡ��
    [n, Wn] = cheb2ord(Wpassband, Wstopband, Rp, Rs);
    [b, a] = cheby2(n, Rs, Wn);
    % ���õ��Ľ��ͨ���˲����õ����ս��������
    res = filter(b, a, Audio);
end