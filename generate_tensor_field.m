function K = generate_tensor_field(kx,ky,theta)
temp = (kx-ky).*sin(theta).^2;
K = [kx-temp ky+temp 0.5*(kx-ky).*sin(2*theta)];
