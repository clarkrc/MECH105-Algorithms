function [root, fx, ea, iter] = falsePosition(func, xl, xu, es, maxit, varargin)
  
%falsePosition finds the root of a function using false position method
% input:
%   func = name of function 
%   xl, xu = lower and upper guesses
%   es = desired relative error (default = 0.0001%)
%   maxit = maximum allowable iterations (default = 200)
%   varagin= additional parameters used by func
% output:
%   root = real root
%   fx = function value at root
%   ea = approximate relative error (%)
%   iter = number of iterations
format long

if nargin<3,error('at least 3 input arguments required'),end
if nargin<4||isempty(es), es = 0.000001;end
if nargin<5||isempty(maxit), maxit = 200;end
disp('go'); %shows start of code 
xf=xl;      %initialize xf
xnu=xu;     %initialize new upper guess
xnl=xl;     %initialize new lower guess
iter = 0;   %initialize itteriation counter
disp(func);  % display input function
disp(xl)  ;      % display lower guess input
disp(xu) ;       % display upper guess input
disp(es) ;       % display error threshold input
disp(maxit) ;    % display max itteration input

 
%test inputs

if ( func(xl) == 0 ) % test lower guess for lucky guess
    root = xl;
    return;
elseif ( func(xu) == 0 ) % thst upper guess for luck guess
    root = xu;
    return;
elseif ( func(xl) * func(xu) > 0 ) % test for bracketing
        error( 'no root between guesses' );

end

    disp 'bracket limits are good'

while (abs(func(xf))>es) % main loop repeat until error is below threshold
    
    disp 'test'
    ea=abs(func(xf))    % calculate error test result

    disp('xnu =')           % display loop test x values
    disp (xnu)
    disp ('xnl =')
    disp (xnl)
    disp('func(xnu)')   % display y values at test x values
    disp (func(xnu))
    disp ('func(xnl)')
    disp (func(xnl))
    
   % calculate x crossing
   
    xf= xnu-((func(xnu)*(xnl-xnu))/(func(xnl)-func(xnu)))
     
    if func(xf)>0   % test x crossing for sign
            xnu=xf;     % reassign upper test point if positive
        else
            xnl=xf;     % reassign lower test point if negitive
               
    disp('new xnu')     % display new loop test x values
    disp(xnu)
    disp('new xnl')
    disp(xnl)
    
    end
    
     iter=iter+1;       % increment counter
     disp('iteration =')
     disp(iter)         % display iteration count
                        % test iteration count
    if iter==maxit
      
       break
    end 
    
end

% display function outputs
    disp('error') 
    ea=func(xf)   % calculate error test result
    disp(ea)
    root=xf    
    fx=func(xf)

    disp('done')


 

end
