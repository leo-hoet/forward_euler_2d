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
## @deftypefn {} {@var{retval} =} getMatrix (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: leo <leo@euler>
## Created: 2019-12-10

function A = getMatrix (U,n,m)
  l = length(U(1,:))
  A = zeros(m,n,l);
  
  for k = [1:1:l]
    cont = 1;
    for j = [1:n:n*m]
      for i = [0:1:n-1]
        A(cont,i+1,k)= U(j+i,k);
      endfor
      cont = cont +1;
    endfor
  endfor

  endfunction
