## Copyright (C) 2007 Resource
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
## @deftypefn {} {@var{retval} =} Gauss_pivoting (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Resource <Resource@RESOURCE-PC>
## Created: 2007-10-30

function [X] = Gauss_pivoting (A,B)
 ind=0;
 n=size(A)(1);
 for i= 1 : n
   max=A(i,i);
   ind=i;
   for k= i+1 : n
     if abs(max)<abs(A(k,i))
       max=A(k,i);
       ind=k;
     end
   end
   temp=A(i,:);
   A(i,:)=A(ind,:);
   A(ind,:)=temp;
   temp=B(i);
   B(i)=B(ind);
   B(ind)=temp;
   for j= 1 : i-1
     prev_row=A(j,:);
     pres_row=A(i,:);
     mul1=pres_row(j);
     mul2=prev_row(j);
     A(i,:)=(mul2*pres_row)-(mul1*prev_row);
     B(i)=(mul2*B(i))-(mul1*B(j));
   end
 end
 %%back substitution
 X(n)=B(n)/A(n,n);
 for i = n-1 : -1 : 1
   sum=0;
   for j=i+1 : n
     sum=sum+(A(i,j)*X(j));
   end
   X(i)=(B(i)-sum)*1.0/A(i,i);
 end
endfunction
