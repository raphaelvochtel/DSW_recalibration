function [y, T] = dynamic_8(y, x, params, steady_state, sparse_rowval, sparse_colval, sparse_colptr, T)
  y(474)=(1-params(10))*params(201)+params(10)*y(226)+x(7);
  y(470)=x(7)+(1-params(10))*params(202)+params(10)*y(222);
  y(482)=(1-params(10))*params(203)+params(10)*y(234)+x(8);
  y(478)=x(8)+(1-params(10))*params(204)+params(10)*y(230);
  y(473)=(1-params(10))*params(205)+params(10)*y(225)+x(9);
  y(469)=x(9)+(1-params(10))*params(206)+params(10)*y(221);
  y(481)=(1-params(10))*params(207)+params(10)*y(233)+x(10);
  y(477)=x(10)+(1-params(10))*params(208)+params(10)*y(229);
  y(378)=0;
  y(376)=1;
  y(377)=1;
end
