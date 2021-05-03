 function [I] = Simpson(x, y)
 
%error checking 

k=diff(x)
disp(length(k))
for j=1:length(k)-1
if k(j)~=k(j+1);
error("x is not equally spaced")
return
end 


end
if length(x) ~= length(y)
    error (" x and y are not same length") 
end 

h=x(2)-x(1)

%Iwo=(1/3)*((15.7200)+(4*(15.5300))+(15.1900)) 
%Iw2=(1/3)*((15.19)+(4*(16.56))+(16.21)) 


%main integration code 


%trap rule only 
if length(x)==2
     warning("trap rule being used")
     I=h*(y(end)+y(end-1))/2; 
  
 
else if rem(length(x),2)>0  %normal simpsons rule
    I=0;
     k=1
for i=1:length(x)/2
   
    disp(y(k))
    disp(y(k+1))
    disp(y(k+2))
    Iw=(h/3)*(y(k)+(4*(y(k+1)))+y(k+2));
    
    disp(Iw)
    I=I+Iw
    k=k+2
   disp(I)
 end
  
else  %rem(length(x),2)==0 %simpsons rule and trap rule 
    Is=0;
for i=1:2:length(x)-2; %for loop for simpsons rule 
    disp(i)
    Io=(h/3)*(y(i)+4*(y(i+1))+y(i+2));
    Is=Is+Io
    disp(Io)
    disp(Is)
    
end
%traprule for last segment 
  warning("trap rule being used")
    It=h*(y(end)+y(end-1))/2;  
    disp(It)   
%adding both segments together 
     I=Is+It;
     disp(I)
    
end

 end 