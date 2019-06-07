load DataGeomar20182019 

%timeGeomar20182019 tGeomar20182019_s windDirectionGeomar20182019 ...
 %   windGeomar20182019 airPressureGeomar20182019;  
 
load DataLH20182019 

%timeLH20182019 tLH20182019_s windDirectionLH20182019 ...
    % windLH20182019 airPressureLH20182019; 
figure;    
ax1=subplot(3, 1 ,1);
length(timeLH20182019)
length(airPressureLH20182019)
plot(timeLH20182019,airPressureLH20182019,'k');
hold on;
plot(timeGeomar20182019,airPressureGeomar20182019,'r');
xlim([timeGeomar20182019(1) timeGeomar20182019(end)]);
legend('LightHouse','Geomar');
title('Air Pressure');

ax2=subplot(3, 1 ,2);

plot(timeLH20182019,windDirectionLH20182019,'k');
hold on;
plot(timeGeomar20182019,windDirectionGeomar20182019,'r');
legend('LightHouse','Geomar');
title('Wind direction, deg');
xlim([timeGeomar20182019(1) timeGeomar20182019(end)]);

ax3=subplot(3, 1 ,3);

plot(timeLH20182019,windLH20182019,'k');
hold on;
plot(timeGeomar20182019,windGeomar20182019,'r');
xlim([timeGeomar20182019(1) timeGeomar20182019(end)]);
legend('LightHouse','Geomar');
title('Wind , m/s');

linkaxes([ax1,ax2,ax3],'x');