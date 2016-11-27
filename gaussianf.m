function f = gaussianf(sig_x, sig_y, m, n, alpha)
%   Compute the cell values of an m by n gaussian filter.
%   The gaussian function used to compute the cell values has its maximum 
%   located in the center of the specified m by n block.
%   The coordinates used as the gaussian function input values for each 
%   cell are the coordinates of the center of the cell.
%    
%   F = GAUSSIANF(m, n, sig_x, sig_y, alpha) computes a Gaussian filter
%   of size m by n with standard deviation in x axis sig_x, standard
%   deviation in y axis sig_y and rotated alpha degrees. If no alpha is
%   passed as an argument it is assumed to be 0.
%
    
    if nargin<5
        alpha = 0;
    end
    
    [yy,xx] = meshgrid(0.5:1:m,0.5:1:n);
    alpha = (alpha)*pi/180;

    % Rotate
    ynew = (yy-m/2)*sin(alpha)+(xx-n/2)*cos(alpha);
    xnew = -(xx-n/2)*sin(alpha)+(yy-m/2)*cos(alpha);

    % Compute filter cell values
    Gx = (1/(sig_x*sqrt(2*pi)))*exp(-((xnew).^2)/(2*sig_x^2));
    Gy = (1/(sig_y*sqrt(2*pi)))*exp(-((ynew).^2)/(2*sig_y^2));

    G  = Gx.*Gy;
    
    % Normalize
    f = G/sum(G(:));
end
    


