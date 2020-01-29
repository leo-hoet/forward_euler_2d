## Copyright (C) 2019 leo
## 
## This program is free software; you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation; either version 3 of the License, or
## (at your option) any later version.

## Author: leo <leo@euler>
## Created: 2019-11-15



function [M,n,m] = cargar_matriz_forward (delta_x,delta_t,k,rho,c,L,H) 
  
  ###Definicion de parametros
  r = (delta_t * k) / (rho * c * (delta_x)^2);
  
  l = [0:delta_x:L];
  h = [0:delta_x:H];
  
  
  m = length(l); #5; #
  n = length(h); #4; #
  
  M = zeros(n*m,n*m);  ###Creacion de la matriz
  for i = [n+2:1:n*m] ##Carga diagonal y valores adyacentes
    M(i,i) = 1-4*r;
    M(i,i-1) = r;
    if (i+1 <= n*m)
      M(i,i+1) = r;
    endif
    if (i+n < n*m)
      M(i,i+n) = r;
    endif
    M(i,i-n) = r;
  endfor
  
  for i = [1:n:n*m]  ##Condicion I 
    M(i,:) = 0;
  endfor
  
  for i = [n:n:n*m] ##Condicion  II
    M(i,:) = M(i-1,:);
  endfor
  
  for i = [1:1:n] ## Condicion III
    M(i,:) = M(i+n,:);
  endfor
  
endfunction
