function [y, T, residual, g1] = static_21(y, x, params, sparse_rowval, sparse_colval, sparse_colptr, T)
residual=NaN(5, 1);
  residual(1)=(0)-(y(172)+y(171)+y(169)+y(170));
  residual(2)=(1+params(2)*y(169))-(y(185)*(1+y(195)));
  residual(3)=(1+params(2)*y(170))-(y(186)*(1+y(195)));
  residual(4)=(1+params(2)*y(171))-(y(187)*(1+y(195)));
  residual(5)=(1+params(2)*y(172))-(y(188)*(1+y(195)));
if nargout > 3
    g1_v = NaN(12, 1);
g1_v(1)=(-1);
g1_v(2)=params(2);
g1_v(3)=(-1);
g1_v(4)=params(2);
g1_v(5)=(-1);
g1_v(6)=params(2);
g1_v(7)=(-1);
g1_v(8)=params(2);
g1_v(9)=(-y(185));
g1_v(10)=(-y(186));
g1_v(11)=(-y(187));
g1_v(12)=(-y(188));
    if ~isoctave && matlab_ver_less_than('9.8')
        sparse_rowval = double(sparse_rowval);
        sparse_colval = double(sparse_colval);
    end
    g1 = sparse(sparse_rowval, sparse_colval, g1_v, 5, 5);
end
end
