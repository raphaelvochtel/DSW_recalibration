function [y, T, residual, g1] = static_23(y, x, params, sparse_rowval, sparse_colval, sparse_colptr, T)
residual=NaN(5, 1);
  residual(1)=(0)-(y(176)+y(175)+y(173)+y(174));
  residual(2)=(1+params(2)*y(173))-(y(189)*(1+y(196)));
  residual(3)=(1+params(2)*y(174))-(y(190)*(1+y(196)));
  residual(4)=(1+params(2)*y(175))-(y(191)*(1+y(196)));
  residual(5)=(1+params(2)*y(176))-(y(192)*(1+y(196)));
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
g1_v(9)=(-y(189));
g1_v(10)=(-y(190));
g1_v(11)=(-y(191));
g1_v(12)=(-y(192));
    if ~isoctave && matlab_ver_less_than('9.8')
        sparse_rowval = double(sparse_rowval);
        sparse_colval = double(sparse_colval);
    end
    g1 = sparse(sparse_rowval, sparse_colval, g1_v, 5, 5);
end
end
