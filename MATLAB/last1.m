X0 = 1.5;
f_X0 = 2*X0^3 - 2*X0 - 5;
f_prime_X0 = 6*X0^2 - 2;
X1 = X0 - f_X0 / f_prime_X0;
X2 = X1 - (2*X1^3 - 2*X1 - 5) / (6*X1^2 - 2);
X3 = X2 - (2*X2^3 - 2*X2 - 5) / (6*X2^2 - 2);
fprintf('X1 = %.6f\n', X1);
fprintf('X2 = %.6f\n', X2);
fprintf('X3 = %.6f\n', X3)