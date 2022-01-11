%........FRECUENCIA Y AMPLITUD EXPERIMENTALES.......%
freq = 14.8;
amp_ang = 13.3;

%........ABRIENDO ARCHIVOS.........%
X = readmatrix( 'E:\mnustes_science\experimental_data\faraday_drift_03\f=14.8_a=13.3\X.txt' );
T = readmatrix( 'E:\mnustes_science\experimental_data\faraday_drift_03\f=14.8_a=13.3\T.txt' );
Z = readmatrix( 'E:\mnustes_science\experimental_data\faraday_drift_03\f=14.8_a=13.3\Z.txt' );

%........CALCULO DEL MÓDULO DEL PATRÓN.......%
Z_env = faraday_module(X, T, Z, 200, 'no', 'a=example.mat');

%........TRANSFORMACION DE UNIDADES.......%
[X_mm, Z_mm] = XZ_pix_to_mm(X, Z_env);
T_per = T_adimensional(T, freq);

%........AMPLITUD ANGULAR A GAMMA.......%
Gamma = ang_to_amp(amp_ang, freq);
round(Gamma, 2);
Gamma_str = num2str(Gamma, '%.3f');
f_str = num2str(freq, '%.1f');
a_str = num2str(amp_ang, '%.1f');
name = ['Gamma=' Gamma_str '.png'];
file_name = ['f=' f_str '_a=' a_str ];

%........GUARDAR DATOS COMO TXT.......%
writematrix(T_per, [file_name '/T_per.csv']);
writematrix(X_mm, [file_name '/X_mm.csv']);
writematrix(Z_mm, [file_name '/Z_mm.csv']);

%........GRÁFICOS.......%
plot = paperlike_plot_cmap(X_mm, T_per, Z_mm,'$x$ (mm)', '$t/T$','$|\psi| (mm)$');
exportgraphics(plot, name, 'Resolution', 1000)
fprintf('Terminé!')

