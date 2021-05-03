function [L, U, P] = luFactor(A)
    [m, n] = size(A); 
    
    %error checking 
if m~=n 
    error('matrix must be square'); 
end 
if  det(A)==0 
    ('singular error');
end

    L=eye(n); 
    P=eye(n); 
    U=A;
    
    %pivoting 
    %find row with largest magnitude coefficent 
for i=1:m-1
    pivot=max(abs(U(i:m,i)));
   for j=i:m
      if(abs(U(j,i))==pivot)
           ind=j;
       break;
      end
   end
        U([i,ind],i:m)=U([ind,i],i:m)
        L([i,ind],1:i-1)=L([ind,i],1:i-1)
        P([i,ind],:)=P([ind,i],:)
        
        
 %forward elimination 
        for j=i+1:m
            L(j,i)=U(j,i)/U(i,i)
            U(j,:)=U(j,i:m)-L(j,i)*U(i,i:m)
        end    
 %variable for column 2 
    x=i+1
 % eliminating x2 from column two 
 
           L(j,x)=U(j,x)/U(x,x)
           U(j,x:m)=U(j,x:m)-L(j,x)*U(x,x:m)
        
        pause;
w=P*A
c=L*U
disp(w)
disp(c)
end

end




