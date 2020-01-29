## Copyright (C) 2019 leo
## 
## This program is free software; you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation; either version 3 of the License, or
## (at your option) any later version.
## 
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
## 
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <http://www.gnu.org/licenses/>.

## -*- texinfo -*- 
## @deftypefn {} {@var{retval} =} forward_euler (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: leo <leo@euler>
## Created: 2019-11-16

function U = forward_euler (M,delta_t,delta_x,H,n,h_c,k,T_a)
  
  ## Determianar paso temporal en segundos
  t_inicio = 1;
  t_fin = 20;
  l = [t_inicio:delta_t:t_fin]; ## Rango temporal
  
  

  
  
  
  ##Ampliacion de la matriz M y modificacion para condicion 4
  tamanio_original = length(M(:,1));
  
  M(:,tamanio_original+n-1) = 0;
  for i = [tamanio_original - n + 2 : 1 : tamanio_original]
    M(i,i+n) = M(i,i+1);
  endfor
  M(tamanio_original,:) = M(tamanio_original-1,:);   
  
  
  ##Creacion de la matriz U  que contiene los resultados
  ##A medida que avanzan las columnas avanza el timepo
  U = zeros(length(M(1,:)),length(l) -1);
  for i = [tamanio_original + 2 : 1 : length(M(1,:))]
    U(i,:) = 0;#-(h_c/k) * 2 * delta_x * U(i-n,:) +  U(i-2*n,:);
    M(i,i-n) = T_a * h_c/k * delta_x;
    M(i,i-2*n) = 1;
  endfor
  

      ##Creacion de la matriz con la temperatura incial
  F = zeros(length(M(1,:)),length(l));
  for i = [1:1:length(l)]
    for j = [1:n:length(M(:,1))]
      F(j,i) = f(delta_x * j,l(i));
    endfor
  endfor
  ###Ciclo principal
  for i = [2:1:length(l)]
    U(:,i) = (M * U(:,i-1))+ F(:,i);
  endfor
  
  
  
endfunction
