%Z_106 = readmatrix( 'E:\mnustes_science\experimental_data\faraday_drift_03\f=14.8_a=10.6\Z_mm.csv' );
%X_106 = readmatrix( 'E:\mnustes_science\experimental_data\faraday_drift_03\f=14.8_a=10.6\X_mm.csv' );
%T_106 = readmatrix( 'E:\mnustes_science\experimental_data\faraday_drift_03\f=14.8_a=10.6\T_per.csv' );

%Z_115 = readmatrix( 'E:\mnustes_science\experimental_data\faraday_drift_03\f=14.8_a=11.5\Z_mm.csv' );
%X_115 = readmatrix( 'E:\mnustes_science\experimental_data\faraday_drift_03\f=14.8_a=11.5\X_mm.csv' );
%T_115 = readmatrix( 'E:\mnustes_science\experimental_data\faraday_drift_03\f=14.8_a=11.5\T_per.csv' );

%Z_125 = readmatrix( 'E:\mnustes_science\experimental_data\faraday_drift_03\f=14.8_a=12.5\Z_mm.csv' );
%X_125 = readmatrix( 'E:\mnustes_science\experimental_data\faraday_drift_03\f=14.8_a=12.5\X_mm.csv' );
%T_125 = readmatrix( 'E:\mnustes_science\experimental_data\faraday_drift_03\f=14.8_a=12.5\T_per.csv' );

%Z_135 = readmatrix( 'E:\mnustes_science\experimental_data\faraday_drift_03\f=14.8_a=13.5\Z_mm.csv' );
%X_135 = readmatrix( 'E:\mnustes_science\experimental_data\faraday_drift_03\f=14.8_a=13.5\X_mm.csv' );
%T_135 = readmatrix( 'E:\mnustes_science\experimental_data\faraday_drift_03\f=14.8_a=13.5\T_per.csv' );

z_min_1 = min(min(Z_106));
z_min_2 = min(min(Z_115));
z_min_3 = min(min(Z_125));
z_min_4 = min(min(Z_135));

Z_106 = Z_106 - z_min_1;
Z_115 = Z_115 - z_min_2;
Z_125 = Z_125 - z_min_3;
Z_135 = Z_135 - z_min_4;

ajuste_1 = ((Z_106(1) - Z_106(end))/(X_106(1) - X_106(end))) * X_106;
ajuste_2 = ((Z_115(1) - Z_115(end))/(X_115(1) - X_115(end))) * X_115;
ajuste_3 = ((Z_125(1) - Z_125(end))/(X_125(1) - X_125(end))) * X_125;
ajuste_4 = ((Z_135(1) - Z_135(end))/(X_135(1) - X_135(end))) * X_135;

tiledlayout(5,4, 'Padding', 'none', 'TileSpacing', 'compact')
% Top plot
h(1) = nexttile(1, [4 1]);
imagesc(X_106, T_106, Z_106);
view([0 90]);
set(gca, 'fontsize', 15);
axis('xy')

h(2) = nexttile(2, [4 1]);
imagesc(X_115, T_115, Z_115);
set(gca, 'ytick',[], 'fontsize', 15);
axis('xy')

h(3) = nexttile(3, [4 1]);
imagesc(X_125, T_125, Z_125);
view([0 90]);
set(gca, 'ytick',[], 'fontsize', 15);
axis('xy')

h(4) = nexttile(4, [4 1]);
imagesc(X_135, T_135, Z_135);
set(gca, 'ytick',[], 'fontsize', 15);
axis('xy')

% Bottom plot
ax2_a = nexttile(17, [1 1]);
plot(X_106, Z_106(1, :), 'k');
xlim([X_106(1), X_106(end)])
ylim([0, 15])
grid on
set(gca, 'fontsize', 15, 'ytick', [0:3:12]);

ax2_b = nexttile(18, [1 1]);
plot(X_115, Z_115(1, :), 'k');
xlim([X_115(1), X_115(end)])
ylim([0, 15])
grid on
set(gca, 'fontsize', 15, 'ytick', [0:3:12]);

ax2_c = nexttile(19, [1 1]);
plot(X_125, Z_125(1, :), 'k');
xlim([X_125(1), X_125(end)])
ylim([0, 15])
grid on
set(gca, 'fontsize', 15, 'ytick', [0:3:12]);

ax2_d = nexttile(20, [1 1]);
plot(X_135, Z_135(1, :), 'k');
xlim([X_135(1), X_135(end)])
ylim([0, 15])
grid on
set(gca, 'fontsize', 15, 'ytick', [0:3:12]);

% colorbar
set(h, 'Colormap', parula(100), 'CLim', [0 15], 'fontsize', 15)
cbh = colorbar(h(end)); 
cbh.Layout.Tile = 'east'; 

linkaxes([h(1),ax2_a],'x');
linkaxes([h(2),ax2_b],'x');
linkaxes([h(3),ax2_c],'x');
linkaxes([h(4),ax2_d],'x');
linkaxes([ax2_a, ax2_b, ax2_c, ax2_d],'y');
xticklabels(h(1),{})
xticklabels(h(2),{})
xticklabels(h(3),{})
xticklabels(h(4),{})
yticklabels(ax2_b,{})
yticklabels(ax2_c,{})
yticklabels(ax2_d,{})
