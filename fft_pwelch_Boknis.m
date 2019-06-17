% load DataGeomar20182019 
% 
% %timeGeomar20182019 tGeomar20182019_s windDirectionGeomar20182019 ...
%  %   windGeomar20182019 airPressureGeomar20182019;  
%  
% load DataLH20182019
% 
% load DataBoknisEck2018_Oxy
% 
% load DataBoknisEck2018_Press
% 
% load DataBoknisEck2018_Salt
% 
% load DataBoknisEck2018_Temp
% 
% load DataBoknisEck2018_CurrentEastward_2m
% 
% load DataBoknisEck2018_CurrentNorthward_2m
% 
% load DataPrecipitation2018
% 
% %--------------------Interpolate data along time dimension-------------------
% len = 40000;
% k=1;
% for i=1:length(timeGeomar20182019)
%     if (posixtime(timeGeomar20182019(i))>=posixtime(timeOxy2018(1)))&&(posixtime(timeGeomar20182019(i))<posixtime(timeOxy2018(end)))
%         t_Geomar20182019(k)=timeGeomar20182019(i);
%                             
%         t_LH20182019(k)=timeLH20182019(i);
%         airPressure_Geomar20182019(k)=airPressureGeomar20182019(i);
%         windGeomar_20182019(k)=windGeomar20182019(i);
%         if isnan(windLH20182019(i))==1
%             windLH20182019(i)=0;
%         end; 
%         if isnan(windDirectionLH20182019(i))==1
%             windDirectionLH20182019(i)=0;
%         end; 
%         windLH_20182019(k)=windLH20182019(i);
%         windDirectionLH_20182019(k)=windDirectionLH20182019(i);
%         windDirectionGeomar_20182019(k)=windDirectionGeomar20182019(i);
%      
%         k=k+1;
%     end;        
% end;    
% 
% [norm_AirPress,int_timeGeomar20182019]=normData(airPressure_Geomar20182019,t_Geomar20182019,len);
% 
% [norm_Oxy,int_timeOxy20182019]=normData(dataOxy2018,timeOxy2018,len);
% [norm_Press,int_timePress20182019]=normData(dataPress2018,timePress2018,len);
% [norm_Salt,int_timeSalt20182019]=normData(dataSalt2018,timeSalt2018,len);
% [norm_Temp,int_timeTemp20182019]=normData(dataTemp2018,timeTemp2018,len);
% [norm_Precip,int_timePrecip20182019]=normData(dataPrecip10m2018,timePrecip10m2018,len);
% [norm_CurrentNorth,int_timeCurrNorth20182019]=normData(dataCurrentNorthward_2m2018,timeCurrNorthward_2m2018,len);
% [norm_CurrentEast,int_timeCurrEast20182019]=normData(dataCurrentEastward_2m2018,timeCurrEastward_2m2018,len);
% [norm_Temp,int_timeTemp20182019]=normData(dataTemp2018,timeTemp2018,len);
% 
% [norm_windLH,int_tLH20182019]=normData(windLH_20182019,t_LH20182019,len);
% [norm_windGeomar,int_timeGeomar20182019]=normData(windGeomar_20182019,t_Geomar20182019,len);
% [norm_windDirGeomar,int_timeGeomar20182019]=normData(windDirectionGeomar_20182019,t_Geomar20182019,len);
% [norm_windDirLH,int_timeLH20182019]=normData(windDirectionLH_20182019,t_LH20182019,len);
% 
% %-----------------Plot data ------------------------------
% 
% new_time=int_timeTemp20182019;
% 
% X=[norm_AirPress', norm_Oxy', norm_Salt', norm_Temp', norm_Press', norm_Precip', norm_windGeomar', norm_windDirGeomar', norm_windLH', norm_windDirLH', norm_CurrentEast', norm_CurrentNorth'];

load NormBoknis 
%X new_time
categories={'Air pressure','Oxygen','Salinity','Temperature','Pressure GEOMAR','Precipitation','Wind GEOMAR','Wind Dir GEOMAR',...
    'Wind Lighhouse','Wind Dir Lighthouse','East Current','North Current'};
for index=1:12
h=figure
sx=X(:,index);
L=length(new_time);
size(sx)

%--------------------Second plot for FFT spectrum ---------------
Fs = 1/(posixtime(new_time(2))-posixtime(new_time(1)));            % Sampling frequency
T = 1/Fs;             % Sampling period
t = (0:L-1)*T;        % Time vector

Y = fft(sx);

P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);

f = Fs*(0:(L/2))/L;
per=1./f/3600;
length(per)
subplot(2,1,1);
plot(per(1:10000),log(P1(1:10000))); % 182 days 
xlim([per(10000) per(1)]);
title_plot=strcat('Single-Sided Spectrum, ',categories(index));
title(title_plot);
xlabel('Time (hours)')
ylabel('|P1(f)|')

%--------------------Second plot for pwelch spectrum ---------------
window = floor(L/10);
noverlap = floor(L/100);
 
[pxx,f] = pwelch(sx,500,300,500,Fs,'centered','power');
[pxx,f,pxxc] = pwelch(sx,hamming(window),noverlap,window,Fs,...
    'ConfidenceLevel',0.95);
subplot(2,1,2);
per = 1./f/3600;
length(per)
plot(per,10*log10(pxx))
title_plot=strcat('Welchs power Spectrum, ',categories(index));
title(title_plot);
xlim([per(2000) per(1)]);
xlabel('Time (hours)')
ylabel('Magnitude (dB)')
name=char(strcat(categories(index),'.fig'));
savefig(h,name)
close(h)
clear h
end;