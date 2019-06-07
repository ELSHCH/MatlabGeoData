
%-----------------------Read data from Kiel Lighthouse for year 2018 and 2019.
%
%         The files for every day are written in formats   "lt#day.2018",
%         "lt#day.2019" correspondingly
%---------------------------------------------------------------------------------

namelt2018 = strcat('lt',num2str(1,'%03d'),'.2018');

filelt2018= fopen(namelt2018,'r');

data2018 = fscanf(filelt2018,'%d %d %d %d %d %d %g %g %g %g %g %g %g %g %g %g',[16 inf]);

datalt2018 = data2018;

fclose(filelt2018);

for i=2:365
namelt2018 = strcat('lt',num2str(i,'%03d'),'.2018');

filelt2018= fopen(namelt2018,'r');

data2018 = fscanf(filelt2018,'%d %d %d %d %d %d %g %g %g %g %g %g %g %g %g %g',[16 inf]);

datalt2018 = [datalt2018, data2018];

fclose(filelt2018);
end;

namelt2019 = strcat('lt',num2str(1,'%03d'),'.2019');

filelt2019= fopen(namelt2019,'r');

data2019 = fscanf(filelt2019,'%d %d %d %d %d %d %g %g %g %g %g %g %g %g %g %g',[16 inf]);

datalt2019 = data2019;

fclose(filelt2019);

for i=2:134
namelt2019 = strcat('lt',num2str(i,'%03d'),'.2019');

filelt2019= fopen(namelt2019,'r');

data2019 = fscanf(filelt2019,'%d %d %d %d %d %d %g %g %g %g %g %g %g %g %g %g',[16 inf]);

datalt2019 = [datalt2019, data2019];

fclose(filelt2019);
end;
%-----------------------Read data from Geomar Roof for year 2018 and 2019.
%
%         The files for every day are written in formats   "me#day.2018",
%         "me#day.2019" correspondingly
%---------------------------------------------------------------------------------
nameme2018 = strcat('me',num2str(1,'%03d'),'.2018');

fileme2018= fopen(nameme2018,'r');

data2018 = fscanf(fileme2018,'%d %d %d %d %d %d %g %g %g %g %g %g %g %g %g %g %g %g %g %g %g',[21 inf]);

datame2018 = data2018;

fclose(fileme2018);

for i=2:365
nameme2018 = strcat('me',num2str(i,'%03d'),'.2018');

fileme2018= fopen(nameme2018,'r');

data2018 = fscanf(fileme2018,'%d %d %d %d %d %d %g %g %g %g %g %g %g %g %g %g %g %g %g %g %g',[21 inf]);

datame2018 = [datame2018, data2018];

fclose(fileme2018);
end;

nameme2019 = strcat('me',num2str(1,'%03d'),'.2019');

fileme2019= fopen(nameme2019,'r');

data2019 = fscanf(fileme2019,'%d %d %d %d %d %d %g %g %g %g %g %g %g %g %g %g %g %g %g %g %g',[21 inf]);

datame2019 = data2019;

fclose(fileme2019);

for i=2:134

nameme2019 = strcat('me',num2str(i,'%03d'),'.2019');

fileme2019= fopen(nameme2019,'r');

data2019 = fscanf(fileme2019,'%d %d %d %d %d %d %g %g %g %g %g %g %g %g %g %g %g %g %g %g %g',[21 inf]);

datame2019 = [datame2019, data2019];

fclose(fileme2019);
end;
size(datame2019)
%----------------------------------------------------------------------------------
% Create arrays that will contain yearly data for
% Geomar and for Kiel Lighthouse, for that purpose we concatenate daily data
%----------------------------------------------------------------------------------

for i=1:length(datalt2018(1,:))  % form time arrays for Kiel Lighthouse 

f =  strcat(num2str(datalt2018(2,i)),'.',num2str(datalt2018(3,i),'%02d'),'.',num2str(datalt2018(4,i),'%02d'),...
              string(' '),num2str(datalt2018(5,i),'%02d'),':',num2str(datalt2018(6,i),'%02d'));    
timeLH2018(i) = datetime(f,'InputFormat','yyyy.MM.dd HH:mm');          
tLH2018_s(i) = posixtime(timeLH2018(i));
  
end;
for i=1:length(datame2018(1,:))  % form time arrays for Geomar roof data

f =  strcat(num2str(datame2018(2,i)),'.',num2str(datame2018(3,i),'%02d'),'.',num2str(datame2018(4,i),'%02d'),...
              string(' '),num2str(datame2018(5,i),'%02d'),':',num2str(datame2018(6,i),'%02d'));
timeGeomar2018(i) = datetime(f,'InputFormat','yyyy.MM.dd HH:mm');          
tGeomar2018_s(i) = posixtime(timeGeomar2018(i));
end;          

for i=1:length(datalt2019(1,:)) % form time arrays for Geomar roof data

f =  strcat(num2str(datalt2019(2,i)),'.',num2str(datalt2019(3,i),'%02d'),'.',num2str(datalt2019(4,i),'%02d'),...
              string(' '),num2str(datalt2019(5,i),'%02d'),':',num2str(datalt2019(6,i),'%02d'));
timeLH2019(i) = datetime(f,'InputFormat','yyyy.MM.dd HH:mm');          
tLH2019_s(i) = posixtime(timeLH2019(i));

end;

for i=1:length(datame2019(1,:)) % form time arrays for Kiel Lighthouse 

f =  strcat(num2str(datame2019(2,i)),'.',num2str(datame2019(3,i),'%02d'),'.',num2str(datame2019(4,i),'%02d'),...
              string(' '),num2str(datame2019(5,i),'%02d'),':',num2str(datame2019(6,i),'%02d'));

timeGeomar2019(i) = datetime(f,'InputFormat','yyyy.MM.dd HH:mm');          
tGeomar2019_s(i) = posixtime(timeGeomar2019(i));
end;          
size(timeGeomar2018)         
timeGeomar20182019 = [timeGeomar2018, timeGeomar2019];
size(timeGeomar20182019)
tGeomar20182019_s = [tGeomar2018_s, tGeomar2019_s];

timeLH20182019 = [timeLH2018, timeLH2019];
tLH20182019_s = [tLH2018_s, tLH2019_s];

%-- form arrays for wind data and air pressure ---------------------------

windDirectionLH2018 = datalt2018(7,:);
windLH2018 = datalt2018(8,:);


windDirectionLH2019 = datalt2019(7,:);
windLH2019 = datalt2019(8,:);


windDirectionGeomar2018 = datame2018(7,:);
windGeomar2018 = datame2018(8,:);
airPressureGeomar2018 = datame2018(15,:);

windDirectionGeomar2019 = datame2019(7,:);
windGeomar2019 = datame2019(8,:);
airPressureGeomar2019 = datame2019(15,:);

windDirectionLH20182019 = [windDirectionLH2018, windDirectionLH2019];
windLH20182019 = [windLH2018, windLH2019];


windDirectionGeomar20182019 = [windDirectionGeomar2018, windDirectionGeomar2019];
windGeomar20182019 = [windGeomar2018, windGeomar2019];
airPressureGeomar20182019 = [airPressureGeomar2018, airPressureGeomar2019];

for i=1:length(timeGeomar20182019) 
  if (windDirectionGeomar20182019(i)>9999)
     windDirectionGeomar20182019(i)= nan; 
  end;
  if (windGeomar20182019(i)>9999)
     windGeomar20182019(i)= nan;
  end;
  if (airPressureGeomar20182019(i)>9999)
     airPressureGeomar20182019(i)=nan;
  end;
end;

for i=1:length(timeLH20182019) 
  if (windDirectionLH20182019(i)>9999)
      windDirectionLH20182019(i)= nan; 
  end;
  if (windLH20182019(i)>9999)
     windLH20182019(i)= nan; 
  end; 
end;

save DataGeomar20182019 timeGeomar20182019 tGeomar20182019_s windDirectionGeomar20182019 ...
    windGeomar20182019 airPressureGeomar20182019; 

save DataLH20182019 timeLH20182019 tLH20182019_s windDirectionLH20182019 ...
    windLH20182019 