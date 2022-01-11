function Gamma = ang_to_amp(ang, freq)
Gamma = (((freq / 2) / (2 * pi))^2 ) * (ang/12) * 0.5;
end