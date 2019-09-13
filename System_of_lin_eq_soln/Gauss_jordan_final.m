## Copyright (C) 2018 Resource
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
## @deftypefn {} {@var{retval} =} Gauss_jordan_final (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Resource <Resource@RESOURCE-PC>
## Created: 2018-05-24

function [X,Y] = Gauss_jordan_final (A,B)
  n=size(A)(1);
  for i=1:n
    for j=i+1:n
      pres_row=A(i,:);
      prev_row=A(j,:);
      mul1=pres_row(j);
      mul2=prev_row(j);
      A(i,:)=(mul2*pres_row)-(mul1*prev_row);
      B(i)=(mul2*B(i))-(mul1*B(j));
    end
  end
  for i = 1 : n
    for j= 1 : i-1
     prev_row=A(j,:);
     pres_row=A(i,:);
     mul1=pres_row(j);
     mul2=prev_row(j);
     A(i,:)=(mul2*pres_row)-(mul1*prev_row);
     B(i)=(mul2*B(i))-(mul1*B(j));
   end
 end
 for i= 1 : n
   B(i)=B(i)/A(i,i);
   A(i,i)=1;
 end
 
 X=A
 Y=B
endfunction
