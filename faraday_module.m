function Z_env = faraday_module(X, T, Z, intensity, save, name)
[upper, lower] = envelope(Z);
Z_env = zeros(length(Z(:, 1)), length(Z(1, :)));
for i = 1:length(Z(1, :))
    Z_env(:, i) = smooth(T, upper(:, i), intensity, 'loess');
end
fprintf('Tranquilo/a, ya terminé de buscar el módulo!')
if save == "si"
save(name, 'Z_env', 'X', 'T')
end
end