function IzracunTabuleOut = tabula(segIn)    

    tabula=zeros(size(segIn));
%         % str2double(RefName(end-4)) <- to prebere ime (številko) lezije iz imena datoteke
%         % tabula(snip.seg == str2double(RefName(end-4)) ) = 1;
    tabula(segIn >= 1) = 1;

%     eval(['Tabula' num2str(p) '=tabula']);
%     pathName3='C:\Users\Andraz\Desktop\Faks\Mag.naloga\lesion_snips\ShrambaSegmentacij\';     %%%... shrani mojo segmentacijo v mapo ShrambaSegmentacij
%     fileName3= ['Tabula', num2str(p)];
%     imeSpremenljivkevWorksspaceu3=(['Tabula' num2str(p)]);
%     save([pathName3 fileName3], imeSpremenljivkevWorksspaceu3) % tale zadeva ti shrani

    IzracunTabuleOut = tabula;

end