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
## @deftypefn {} {@var{retval} =} determinar_tiempo (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: leo <leo@euler>
## Created: 2019-11-16

function delta_t = determinar_tiempo (delta_x,k,rho,c,L,H)
  delta_t = (rho * c * (delta_x)^2 ) / (5 * k);
endfunction
