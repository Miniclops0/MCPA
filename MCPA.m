%Connor Warden
%PA_3

clear all
close all

x = 0;
v = 0;
t = 0;

F = 1; % to keep it simple
m = 1;

dt = 1;
nt = 1000; % 1000 steps
np = 1;
v = zeros(np,1);
x = zeros(np,1);

re = 0;

for i = 2:nt %start at 2 because we already have the first point
    t(i) = t(i-1) + dt;
    
    v(:,i) = v(:,i-1) + F/m *dt;
    x(:,i) = x(:,i-1) + v(:,i-1)*dt + (F*dt^2)/m*2;
    p = 1 - exp(-dt/20);
    r = rand(np,1) < p;
    v(r,i) = v(r,i)*re;
    ave_v(i,:) = mean(v,2);
    
    plot(x(1,:),v(1,:),'r-');
    hold on
    plot(x(1,:),ave_v,'g*');
    title(['Average Velocity', num2str(ave_v(i)), 'm/s'])
    xlabel('x')
    ylabel('v')
    
    pause(0.01)
    
end


