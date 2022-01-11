function [X_mm, Z_mm] = XZ_pix_to_mm(X, Z)
FC = 40/(653 - 538);
X_mm = FC * X;
X_mm = X_mm - (X_mm(end)/2)*ones(length(X_mm), 1);
Z_mm = FC * Z;
end