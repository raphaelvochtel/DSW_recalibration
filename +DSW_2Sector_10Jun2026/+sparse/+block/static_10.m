function [y, T, residual, g1] = static_10(y, x, params, sparse_rowval, sparse_colval, sparse_colptr, T)
residual=NaN(1, 1);
  T(7)=log(y(232));
  residual(1)=(T(7))-((1-params(10))*log(params(199))+params(10)*T(7)+x(6));
if nargout > 3
    g1_v = NaN(1, 1);
g1_v(1)=1/y(232)-params(10)*1/y(232);
    if ~isoctave && matlab_ver_less_than('9.8')
        sparse_rowval = double(sparse_rowval);
        sparse_colval = double(sparse_colval);
    end
    g1 = sparse(sparse_rowval, sparse_colval, g1_v, 1, 1);
end
end
