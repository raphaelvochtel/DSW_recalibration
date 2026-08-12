function [y, T] = dynamic_3(y, x, params, steady_state, sparse_rowval, sparse_colval, sparse_colptr, T)
  y(471)=(1-params(10))*params(193)+params(10)*y(223)+x(3);
  y(467)=x(3)+(1-params(10))*params(194)+params(10)*y(219);
  y(479)=(1-params(10))*params(195)+params(10)*y(231)+x(4);
  y(475)=x(4)+(1-params(10))*params(196)+params(10)*y(227);
end
