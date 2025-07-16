% Time vector
t = V_send.time;

% Extract signal values
v_send = V_send.signals.values;
v_recv = V_recv.signals.values;

i_send = I_send.signals.values;
i_recv = I_recv.signals.values;

s_send = S_send.signals.values;
s_recv = S_recv.signals.values;

%% === Plot 1: Voltages (Phase A, B, C) ===
figure('Name', 'Line-to-Neutral Voltages', 'NumberTitle', 'off');
for k = 1:3
    subplot(3,1,k);
    plot(t, v_send(:,k), 'r', t, v_recv(:,k), 'b--');
    title(['Phase ', char('A'+k-1), ' Voltage']);
    ylabel('Voltage (V)');
    xlabel('Time (s)');
    legend('Sending', 'Receiving');
    grid on;
end

%% === Plot 2: Currents (Phase A, B, C) ===
figure('Name', 'Line Currents', 'NumberTitle', 'off');
for k = 1:3
    subplot(3,1,k);
    plot(t, i_send(:,k), 'r', t, i_recv(:,k), 'b--');
    title(['Phase ', char('A'+k-1), ' Current']);
    ylabel('Current (A)');
    xlabel('Time (s)');
    legend('Sending', 'Receiving');
    grid on;
end

%% === Plot 3: Apparent Power ===
figure('Name', 'Apparent Power', 'NumberTitle', 'off');
subplot(1,1,1);
plot(t, s_send, 'r', t, s_recv, 'b--');
title('Total Apparent Power');
ylabel('Power (VA)');
xlabel('Time (s)');
legend('Sending', 'Receiving');
grid on;
