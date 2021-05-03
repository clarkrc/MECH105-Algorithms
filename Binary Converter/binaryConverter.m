function [base2] = binaryConverter(base10)
%binary A simple function to convert a base10 number to binary
%   Inputs:
%       base10 - A number in base10
%   Outputs:
%       base2 - The base10 number converted to binary
if base10==0
    y=0;
end 
s=0;
i=0;
while base10>0 
    i=i+1;
    if mod(base10,2)==1 || s==1
        y(i)= mod(base10,2);
        s=1;
    end 
    
    base10=floor(base10/2);
end 

base2=flip(y);

end