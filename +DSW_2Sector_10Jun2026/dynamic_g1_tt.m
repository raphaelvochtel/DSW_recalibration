function T = dynamic_g1_tt(T, y, x, params, steady_state, it_)
% function T = dynamic_g1_tt(T, y, x, params, steady_state, it_)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T             [#temp variables by 1]     double  vector of temporary terms to be filled by function
%   y             [#dynamic variables by 1]  double  vector of endogenous variables in the order stored
%                                                    in M_.lead_lag_incidence; see the Manual
%   x             [nperiods by M_.exo_nbr]   double  matrix of exogenous variables (in declaration order)
%                                                    for all simulation periods
%   steady_state  [M_.endo_nbr by 1]         double  vector of steady state values
%   params        [M_.param_nbr by 1]        double  vector of parameter values in declaration order
%   it_           scalar                     double  time period for exogenous variables for which
%                                                    to evaluate the model
%
% Output:
%   T           [#temp variables by 1]       double  vector of temporary terms
%

assert(length(T) >= 462);

T = DSW_2Sector_10Jun2026.dynamic_resid_tt(T, y, x, params, steady_state, it_);

T(318) = getPowerDeriv(T(13),T(2)*T(7),1);
T(319) = getPowerDeriv(params(26)*T(1)*T(4)*T(6)/T(24),T(25),1);
T(320) = getPowerDeriv(T(33),T(7)*T(26),1);
T(321) = getPowerDeriv(T(1)*params(20)*T(28)*T(30)/T(44),T(25),1);
T(322) = getPowerDeriv(y(41),(-1),1);
T(323) = getPowerDeriv(T(47)*T(46)*T(11)*params(24)*T(52)/y(171),T(7),1);
T(324) = getPowerDeriv(T(56),T(25),1);
T(325) = getPowerDeriv(T(59)*T(58)*T(11)*T(52)*params(18)/y(171),T(7),1);
T(326) = getPowerDeriv(T(67),T(25),1);
T(327) = getPowerDeriv(T(71),params(23)*T(7),1);
T(328) = getPowerDeriv(T(68)/T(78),T(25),1);
T(329) = getPowerDeriv(T(82),T(7)*params(17),1);
T(330) = getPowerDeriv(T(79)/T(89),T(25),1);
T(331) = getPowerDeriv(T(6)*T(4)*T(11)*y(41)*params(36)/y(172),T(7),1);
T(332) = getPowerDeriv(T(96),T(25),1);
T(333) = getPowerDeriv(T(30)*T(28)*T(11)*y(41)*params(30)/y(172),T(7),1);
T(334) = getPowerDeriv(T(103),T(25),1);
T(335) = getPowerDeriv(T(13),T(2),1);
T(336) = getPowerDeriv(T(33),T(26),1);
T(337) = getPowerDeriv(T(71),params(23),1);
T(338) = getPowerDeriv(T(82),params(17),1);
T(339) = getPowerDeriv(y(47)*T(161)/(y(50)*y(41)*y(264)),params(23),1);
T(340) = getPowerDeriv(y(45)*T(167)/(y(48)*y(41)*y(260)),params(17),1);
T(341) = getPowerDeriv(y(47)*T(52)*y(272)*T(161)/y(50),params(23),1);
T(342) = getPowerDeriv(y(45)*T(52)*y(268)*T(167)/y(48),params(17),1);
T(343) = getPowerDeriv(y(50)*y(41)*y(264)*T(218)/y(47),T(2),1);
T(344) = getPowerDeriv(y(48)*y(41)*y(260)*T(220)/y(45),T(26),1);
T(345) = getPowerDeriv(y(50)*T(218)/(y(47)*T(52)*y(272)),T(2),1);
T(346) = getPowerDeriv(y(48)*T(220)/(y(45)*T(52)*y(268)),T(26),1);
T(347) = getPowerDeriv(y(289)/y(42),(-params(8)),1);
T(348) = getPowerDeriv(y(290)/y(43),(-params(8)),1);
T(349) = 1/T(26);
T(350) = T(349)*getPowerDeriv(T(38),T(26),1);
T(351) = getPowerDeriv(T(167)*y(45)/y(44),params(17),1);
T(352) = getPowerDeriv(y(45)*T(167)/y(44),params(17),1);
T(353) = getPowerDeriv(y(44)*T(220)/y(45),T(26),1);
T(354) = getPowerDeriv(T(26)*y(45)/(params(17)*y(44)),params(17),1);
T(355) = getPowerDeriv(params(17)*y(44)/(T(26)*y(45)),T(26),1);
T(356) = getPowerDeriv(T(35),T(7)*params(17),1);
T(357) = 1/params(17);
T(358) = T(357)*getPowerDeriv(T(41),params(17),1);
T(359) = getPowerDeriv(T(35),params(17),1);
T(360) = 1/T(2);
T(361) = T(360)*getPowerDeriv(T(18),T(2),1);
T(362) = getPowerDeriv(T(161)*y(47)/y(46),params(23),1);
T(363) = getPowerDeriv(y(47)*T(161)/y(46),params(23),1);
T(364) = getPowerDeriv(y(46)*T(218)/y(47),T(2),1);
T(365) = getPowerDeriv(T(2)*y(47)/(params(23)*y(46)),params(23),1);
T(366) = getPowerDeriv(params(23)*y(46)/(T(2)*y(47)),T(2),1);
T(367) = getPowerDeriv(T(15),params(23)*T(7),1);
T(368) = 1/params(23);
T(369) = T(368)*getPowerDeriv(T(21),params(23),1);
T(370) = getPowerDeriv(T(15),params(23),1);
T(371) = T(349)*getPowerDeriv(T(27),T(26),1);
T(372) = getPowerDeriv(T(80),T(7)*T(26),1);
T(373) = getPowerDeriv(T(80),T(26),1);
T(374) = getPowerDeriv(y(49)*T(167)/y(48),params(17),1);
T(375) = getPowerDeriv(y(48)*T(220)/y(49),T(26),1);
T(376) = getPowerDeriv(T(26)*y(49)/(y(48)*params(17)),params(17),1);
T(377) = getPowerDeriv(y(48)*params(17)/(T(26)*y(49)),T(26),1);
T(378) = T(357)*getPowerDeriv(T(29),params(17),1);
T(379) = T(360)*getPowerDeriv(T(3),T(2),1);
T(380) = getPowerDeriv(T(69),T(2)*T(7),1);
T(381) = getPowerDeriv(T(69),T(2),1);
T(382) = getPowerDeriv(y(51)*T(161)/y(50),params(23),1);
T(383) = getPowerDeriv(y(50)*T(218)/y(51),T(2),1);
T(384) = getPowerDeriv(T(2)*y(51)/(y(50)*params(23)),params(23),1);
T(385) = getPowerDeriv(y(50)*params(23)/(T(2)*y(51)),T(2),1);
T(386) = T(368)*getPowerDeriv(T(5),params(23),1);
T(387) = T(9)*(-(getPowerDeriv(y(52),T(7),1)))/(T(8)*T(8));
T(388) = (-1)/(y(52)*y(52))*getPowerDeriv(1/y(52),T(7),1);
T(389) = getPowerDeriv((1+y(263))*y(86)/y(52),(-params(5)),1);
T(390) = getPowerDeriv(y(76)/y(52),(-params(5)),1);
T(391) = T(9)*(-(getPowerDeriv(y(53),T(7),1)))/(T(31)*T(31));
T(392) = (-1)/(y(53)*y(53))*getPowerDeriv(1/y(53),T(7),1);
T(393) = getPowerDeriv((1+y(259))*y(87)/y(53),(-params(5)),1);
T(394) = getPowerDeriv(y(77)/y(53),(-params(5)),1);
T(395) = T(9)*(-(getPowerDeriv(y(54),T(7),1)))/(T(49)*T(49));
T(396) = (-1)/(y(54)*y(54))*getPowerDeriv(1/y(54),T(7),1);
T(397) = getPowerDeriv((1+y(271))*y(80)/y(54),(-params(5)),1);
T(398) = getPowerDeriv(y(82)/y(54),(-params(5)),1);
T(399) = T(9)*(-(getPowerDeriv(y(55),T(7),1)))/(T(61)*T(61));
T(400) = (-1)/(y(55)*y(55))*getPowerDeriv(1/y(55),T(7),1);
T(401) = getPowerDeriv((1+y(267))*y(81)/y(55),(-params(5)),1);
T(402) = getPowerDeriv(y(83)/y(55),(-params(5)),1);
T(403) = getPowerDeriv(y(76),T(7),1);
T(404) = getPowerDeriv(y(76),(-params(5)),1);
T(405) = getPowerDeriv(T(249),T(250),1);
T(406) = getPowerDeriv(y(77),T(7),1);
T(407) = getPowerDeriv(y(77),(-params(5)),1);
T(408) = getPowerDeriv(T(252),T(250),1);
T(409) = getPowerDeriv(y(78),T(7),1);
T(410) = getPowerDeriv(y(78),(-params(5)),1);
T(411) = getPowerDeriv(y(79),T(7),1);
T(412) = getPowerDeriv(y(79),(-params(5)),1);
T(413) = getPowerDeriv((1+y(271))*y(80),(-params(5)),1);
T(414) = getPowerDeriv((1+y(271))*y(80),T(7),1);
T(415) = getPowerDeriv(T(254),T(250),1);
T(416) = getPowerDeriv((1+y(267))*y(81),(-params(5)),1);
T(417) = getPowerDeriv((1+y(267))*y(81),T(7),1);
T(418) = getPowerDeriv(T(256),T(250),1);
T(419) = getPowerDeriv(y(82),T(7),1);
T(420) = getPowerDeriv(y(82),(-params(5)),1);
T(421) = getPowerDeriv(y(83),T(7),1);
T(422) = getPowerDeriv(y(83),(-params(5)),1);
T(423) = getPowerDeriv(y(84),T(7),1);
T(424) = getPowerDeriv(y(84),(-params(5)),1);
T(425) = getPowerDeriv(y(85),T(7),1);
T(426) = getPowerDeriv(y(85),(-params(5)),1);
T(427) = getPowerDeriv((1+y(263))*y(86),(-params(5)),1);
T(428) = getPowerDeriv((1+y(263))*y(86),T(7),1);
T(429) = getPowerDeriv((1+y(259))*y(87),(-params(5)),1);
T(430) = getPowerDeriv((1+y(259))*y(87),T(7),1);
T(431) = getPowerDeriv((1-y(265))/y(171),T(7),1);
T(432) = getPowerDeriv((1-y(261))/y(171),T(7),1);
T(433) = T(173)*getPowerDeriv(y(171),params(23),1);
T(434) = T(181)*getPowerDeriv(y(171),params(17),1);
T(435) = (-(y(144)*params(25)))/(y(171)*y(171))+(-(params(27)*y(152)))/(y(171)*y(171))+(-(params(38)*y(148)))/(y(171)*y(171));
T(436) = (-(y(145)*params(19)))/(y(171)*y(171))+(-(params(21)*y(153)))/(y(171)*y(171))+(-(params(32)*y(149)))/(y(171)*y(171));
T(437) = (-1)/(y(171)*y(171));
T(438) = (-y(41))/(y(172)*y(172));
T(439) = (-(T(2)*y(50)*y(41)*y(264)))/(y(172)*T(2)*y(172)*T(2));
T(440) = (-(T(26)*y(48)*y(41)*y(260)))/(y(172)*T(26)*y(172)*T(26));
T(441) = getPowerDeriv((1-y(273))/y(172),T(7),1);
T(442) = getPowerDeriv((1-y(269))/y(172),T(7),1);
T(443) = T(172)*getPowerDeriv(y(172),T(2),1);
T(444) = T(180)*getPowerDeriv(y(172),T(26),1);
T(445) = (-(y(150)*params(37)))/(y(172)*y(172))+(-(params(39)*y(154)))/(y(172)*y(172))+(-(params(26)*y(142)))/(y(172)*y(172));
T(446) = (-(y(151)*params(31)))/(y(172)*y(172))+(-(params(33)*y(155)))/(y(172)*y(172))+(-(params(20)*y(143)))/(y(172)*y(172));
T(447) = (-((-(y(204)+y(203)))/((y(184)+y(183)+y(186)+y(185))*(y(184)+y(183)+y(186)+y(185)))));
T(448) = (-((-(y(156)+y(157)-y(179)*y(144)-y(180)*y(145)))/((y(186)+y(184)+y(183)+y(185))*(y(186)+y(184)+y(183)+y(185)))));
T(449) = (-((-(y(206)+y(205)))/((y(190)+y(188)+y(187)+y(190))*(y(190)+y(188)+y(187)+y(190)))));
T(450) = (-((-(y(158)+y(159)-y(181)*y(150)-y(182)*y(151)))/((y(190)+y(188)+y(187)+y(189))*(y(190)+y(188)+y(187)+y(189)))));
T(451) = getPowerDeriv(y(299)/y(217),(-params(8)),1);
T(452) = getPowerDeriv(y(300)/y(218),(-params(8)),1);
T(453) = getPowerDeriv(y(301)/y(219),(-params(8)),1);
T(454) = getPowerDeriv(y(302)/y(220),(-params(8)),1);
T(455) = getPowerDeriv(y(303)/y(221),(-params(8)),1);
T(456) = getPowerDeriv(y(304)/y(222),(-params(8)),1);
T(457) = getPowerDeriv(y(305)/y(223),(-params(8)),1);
T(458) = getPowerDeriv(y(306)/y(224),(-params(8)),1);
T(459) = getPowerDeriv(1+y(259),(-params(5)),1);
T(460) = getPowerDeriv(1+y(263),(-params(5)),1);
T(461) = getPowerDeriv(1+y(267),(-params(5)),1);
T(462) = getPowerDeriv(1+y(271),(-params(5)),1);

end
