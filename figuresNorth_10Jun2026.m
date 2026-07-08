%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Plots figures for the second draft
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% clear;clc;
% 
% % Generate the simulations
% mainscript_DSW_24Feb2024;
make_it_tight   = true;
subplot         = @(m,n,p) subtightplot (m, n, p, [0.07 0.07], [0.08 0.08], [0.04 0.04]);
if ~make_it_tight,  clear subplot;  end
axis_tight      = 1;


ToTL_SS=eqlbm_ss0.ave_p(5)/(eqlbm_ss0.ave_p(11)*solve(1));
ToTH_SS=eqlbm_ss0.ave_p(6)/(eqlbm_ss0.ave_p(12)*solve(1));

ToTL_eps_tauIMH=(oo_.irfs.ptil_XL_eps_tauIMH+eqlbm_ss0.ave_p(5))./((oo_.irfs.ptil_XL_star_eps_tauIMH+eqlbm_ss0.ave_p(11)).*(oo_.irfs.Q_eps_tauIMH+solve(1)))-ToTL_SS;
ToTL_eps_tau_offshoringH=(oo_.irfs.ptil_XL_eps_tau_offshoringH+eqlbm_ss0.ave_p(5))./((oo_.irfs.ptil_XL_star_eps_tau_offshoringH+eqlbm_ss0.ave_p(11)).*(oo_.irfs.Q_eps_tau_offshoringH+solve(1)))-ToTL_SS;
ToTL_eps_s_DH=(oo_.irfs.ptil_XL_eps_s_DH+eqlbm_ss0.ave_p(5))./((oo_.irfs.ptil_XL_star_eps_s_DH+eqlbm_ss0.ave_p(11)).*(oo_.irfs.Q_eps_s_DH+solve(1)))-ToTL_SS;
ToTL_eps_s_EH=(oo_.irfs.ptil_XL_eps_s_EH+eqlbm_ss0.ave_p(5))./((oo_.irfs.ptil_XL_star_eps_s_EH+eqlbm_ss0.ave_p(11)).*(oo_.irfs.Q_eps_s_EH+solve(1)))-ToTL_SS;

ToTH_eps_tauIMH=(oo_.irfs.ptil_XH_eps_tauIMH+eqlbm_ss0.ave_p(6))./((oo_.irfs.ptil_XH_star_eps_tauIMH+eqlbm_ss0.ave_p(12)).*(oo_.irfs.Q_eps_tauIMH+solve(1)))-ToTH_SS;
ToTH_eps_tau_offshoringH=(oo_.irfs.ptil_XH_eps_tau_offshoringH+eqlbm_ss0.ave_p(6))./((oo_.irfs.ptil_XH_star_eps_tau_offshoringH+eqlbm_ss0.ave_p(12)).*(oo_.irfs.Q_eps_tau_offshoringH+solve(1)))-ToTH_SS;
ToTH_eps_s_DH=(oo_.irfs.ptil_XH_eps_s_DH+eqlbm_ss0.ave_p(6))./((oo_.irfs.ptil_XH_star_eps_s_DH+eqlbm_ss0.ave_p(12)).*(oo_.irfs.Q_eps_s_DH+solve(1)))-ToTH_SS;
ToTH_eps_s_EH=(oo_.irfs.ptil_XH_eps_s_EH+eqlbm_ss0.ave_p(6))./((oo_.irfs.ptil_XH_star_eps_s_EH+eqlbm_ss0.ave_p(12)).*(oo_.irfs.Q_eps_s_EH+solve(1)))-ToTH_SS;


% NORTH INSTRUMENTS ON H SECTOR
figure(1)
% subplot(4,4,1)
% plot((oo_.irfs.tauIMH_eps_tauIMH(1:20))*100, '-o','LineWidth',1.5,'color', [0.4660 0.6740 0.1880], 'MarkerSize',6,'MarkerIndices', 1:4:20);
% hold on
% plot((oo_.irfs.tau_offshoringH_eps_tau_offshoringH(1:20))*100,'-^', 'LineWidth',1.5,'color', [0 0.4470 0.7410], 'MarkerSize',6,'MarkerIndices', 1:4:20)
% hold on
% plot((oo_.irfs.s_DH_eps_s_DH(1:20))*100,'-x','LineWidth',1.5,'color', [0.8634  0.7406 0.1596], 'MarkerSize',6,'MarkerIndices', 1:4:20)
% hold on
% plot((oo_.irfs.s_DH_eps_s_EH(1:20))*100,'-square','LineWidth',1.5,'color', [0.8555  0.1555 0.1555], 'MarkerSize',6,'MarkerIndices', 1:4:20)
% %axis([0,20,0,0.05])
% title('$\tau_{IM}$,$\tau_{V}$,$s_{D}$,$s_{E}$','FontSize',6,'Interpreter','latex')

% wLl
subplot(4,4,1)
plot((oo_.irfs.wLl_eps_tauIMH(1:20)/eqlbm_ss0.wLl_fixed)*100, '-o','LineWidth',1.5,'color', [0.4660 0.6740 0.1880], 'MarkerSize',6,'MarkerIndices', 1:4:20);
hold on
plot((oo_.irfs.wLl_eps_tau_offshoringH(1:20)/eqlbm_ss0.wLl_fixed)*100,'-^', 'LineWidth',1.5,'color', [0 0.4470 0.7410], 'MarkerSize',6,'MarkerIndices', 1:4:20)
hold on
plot((oo_.irfs.wLl_eps_s_DH(1:20)/eqlbm_ss0.wLl_fixed)*100,'-x','LineWidth',1.5,'color', [0.8634  0.7406 0.1596], 'MarkerSize',6,'MarkerIndices', 1:4:20)
hold on
plot((oo_.irfs.wLl_eps_s_EH(1:20)/eqlbm_ss0.wLl_fixed)*100,'-square','LineWidth',1.5,'color', [0.8555  0.1555 0.1555], 'MarkerSize',6,'MarkerIndices', 1:4:20)
title('($w^{Ll}$)','FontSize',6,'Interpreter','latex')


% wHl
subplot(4,4,2)
plot((oo_.irfs.wHl_eps_tauIMH(1:20)/eqlbm_ss0.wHl_fixed)*100, '-o','LineWidth',1.5,'color', [0.4660 0.6740 0.1880], 'MarkerSize',6,'MarkerIndices', 1:4:20);
hold on
plot((oo_.irfs.wHl_eps_tau_offshoringH(1:20)/eqlbm_ss0.wHl_fixed)*100,'-^', 'LineWidth',1.5,'color', [0 0.4470 0.7410], 'MarkerSize',6,'MarkerIndices', 1:4:20)
hold on
plot((oo_.irfs.wHl_eps_s_DH(1:20)/eqlbm_ss0.wHl_fixed)*100,'-x','LineWidth',1.5,'color', [0.8634  0.7406 0.1596], 'MarkerSize',6,'MarkerIndices', 1:4:20)
hold on
plot((oo_.irfs.wHl_eps_s_EH(1:20)/eqlbm_ss0.wHl_fixed)*100,'-square','LineWidth',1.5,'color', [0.8555  0.1555 0.1555], 'MarkerSize',6,'MarkerIndices', 1:4:20)
title('($w^{Hl}$)','FontSize',6,'Interpreter','latex')


% wLh
subplot(4,4,3)
plot((oo_.irfs.wLh_eps_tauIMH(1:20)/eqlbm_ss0.wLh_fixed)*100, '-o','LineWidth',1.5,'color', [0.4660 0.6740 0.1880], 'MarkerSize',6,'MarkerIndices', 1:4:20);
hold on
plot((oo_.irfs.wLh_eps_tau_offshoringH(1:20)/eqlbm_ss0.wLh_fixed)*100,'-^', 'LineWidth',1.5,'color', [0 0.4470 0.7410], 'MarkerSize',6,'MarkerIndices', 1:4:20)
hold on
plot((oo_.irfs.wLh_eps_s_DH(1:20)/eqlbm_ss0.wLh_fixed)*100,'-x','LineWidth',1.5,'color', [0.8634  0.7406 0.1596], 'MarkerSize',6,'MarkerIndices', 1:4:20)
hold on
plot((oo_.irfs.wLh_eps_s_EH(1:20)/eqlbm_ss0.wLh_fixed)*100,'-square','LineWidth',1.5,'color', [0.8555  0.1555 0.1555], 'MarkerSize',6,'MarkerIndices', 1:4:20)
title('($w^{Lh}$)','FontSize',6,'Interpreter','latex')


% wHh
subplot(4,4,4)
plot((oo_.irfs.wHh_eps_tauIMH(1:20)/eqlbm_ss0.wHh_fixed)*100, '-o','LineWidth',1.5,'color', [0.4660 0.6740 0.1880], 'MarkerSize',6,'MarkerIndices', 1:4:20);
hold on
plot((oo_.irfs.wHh_eps_tau_offshoringH(1:20)/eqlbm_ss0.wLh_fixed)*100,'-^', 'LineWidth',1.5,'color', [0 0.4470 0.7410], 'MarkerSize',6,'MarkerIndices', 1:4:20)
hold on
plot((oo_.irfs.wHh_eps_s_DH(1:20)/eqlbm_ss0.wLh_fixed)*100,'-x','LineWidth',1.5,'color', [0.8634  0.7406 0.1596], 'MarkerSize',6,'MarkerIndices', 1:4:20)
hold on
plot((oo_.irfs.wHh_eps_s_EH(1:20)/eqlbm_ss0.wLh_fixed)*100,'-square','LineWidth',1.5,'color', [0.8555  0.1555 0.1555], 'MarkerSize',6,'MarkerIndices', 1:4:20)
title('($w^{Hh}$)','FontSize',6,'Interpreter','latex')



% massL
subplot(4,4,5)
plot([0,oo_.irfs.massL_eps_tauIMH(1:19)/eqlbm_ss0.masses(1)]*100, '-o','LineWidth',1.5,'color', [0.4660 0.6740 0.1880], 'MarkerSize',6,'MarkerIndices', 1:4:20);
hold on
plot([0,oo_.irfs.massL_eps_tau_offshoringH(1:19)/eqlbm_ss0.masses(1)]*100,'-^', 'LineWidth',1.5,'color', [0 0.4470 0.7410], 'MarkerSize',6,'MarkerIndices', 1:4:20)
hold on
plot([0,oo_.irfs.massL_eps_s_DH(1:19)/eqlbm_ss0.masses(1)]*100,'-x','LineWidth',1.5,'color', [0.8634  0.7406 0.1596], 'MarkerSize',6,'MarkerIndices', 1:4:20)
hold on
plot([0,oo_.irfs.massL_eps_s_EH(1:19)/eqlbm_ss0.masses(1)]*100,'-square','LineWidth',1.5,'color', [0.8555  0.1555 0.1555], 'MarkerSize',6,'MarkerIndices', 1:4:20)
title('($N^{L}$)','FontSize',6,'Interpreter','latex')



% massH
subplot(4,4,6)
plot([0,oo_.irfs.massH_eps_tauIMH(1:19)/eqlbm_ss0.masses(2)]*100, '-o','LineWidth',1.5,'color', [0.4660 0.6740 0.1880], 'MarkerSize',6,'MarkerIndices', 1:4:20);
hold on
plot([0,oo_.irfs.massH_eps_tau_offshoringH(1:19)/eqlbm_ss0.masses(2)]*100,'-^', 'LineWidth',1.5,'color', [0 0.4470 0.7410], 'MarkerSize',6,'MarkerIndices', 1:4:20)
hold on
plot([0,oo_.irfs.massH_eps_s_DH(1:19)/eqlbm_ss0.masses(2)]*100,'-x','LineWidth',1.5,'color', [0.8634  0.7406 0.1596], 'MarkerSize',6,'MarkerIndices', 1:4:20)
hold on
plot([0,oo_.irfs.massH_eps_s_EH(1:19)/eqlbm_ss0.masses(2)]*100,'-square','LineWidth',1.5,'color', [0.8555  0.1555 0.1555], 'MarkerSize',6,'MarkerIndices', 1:4:20)
title('($N^{H}$)','FontSize',6,'Interpreter','latex')





% mass_XL
subplot(4,4,7)
plot((oo_.irfs.mass_XL_eps_tauIMH(1:20)/eqlbm_ss0.masses(7))*100, '-o','LineWidth',1.5,'color', [0.4660 0.6740 0.1880], 'MarkerSize',6,'MarkerIndices', 1:4:20);
hold on
plot((oo_.irfs.mass_XL_eps_tau_offshoringH(1:20)/eqlbm_ss0.masses(7))*100,'-^', 'LineWidth',1.5,'color', [0 0.4470 0.7410], 'MarkerSize',6,'MarkerIndices', 1:4:20)
hold on
plot((oo_.irfs.mass_XL_eps_s_DH(1:20)/eqlbm_ss0.masses(7))*100,'-x','LineWidth',1.5,'color', [0.8634  0.7406 0.1596], 'MarkerSize',6,'MarkerIndices', 1:4:20)
hold on
plot((oo_.irfs.mass_XL_eps_s_EH(1:20)/eqlbm_ss0.masses(7))*100,'-square','LineWidth',1.5,'color', [0.8555  0.1555 0.1555], 'MarkerSize',6,'MarkerIndices', 1:4:20)
title('($N^{L}_{X}$)','FontSize',6,'Interpreter','latex')





% mass_XH
subplot(4,4,8)
plot((oo_.irfs.mass_XH_eps_tauIMH(1:20)/eqlbm_ss0.masses(8))*100, '-o','LineWidth',1.5,'color', [0.4660 0.6740 0.1880], 'MarkerSize',6,'MarkerIndices', 1:4:20);
hold on
plot((oo_.irfs.mass_XH_eps_tau_offshoringH(1:20)/eqlbm_ss0.masses(8))*100,'-^', 'LineWidth',1.5,'color', [0 0.4470 0.7410], 'MarkerSize',6,'MarkerIndices', 1:4:20)
hold on
plot((oo_.irfs.mass_XH_eps_s_DH(1:20)/eqlbm_ss0.masses(8))*100,'-x','LineWidth',1.5,'color', [0.8634  0.7406 0.1596], 'MarkerSize',6,'MarkerIndices', 1:4:20)
hold on
plot((oo_.irfs.mass_XH_eps_s_EH(1:20)/eqlbm_ss0.masses(8))*100,'-square','LineWidth',1.5,'color', [0.8555  0.1555 0.1555], 'MarkerSize',6,'MarkerIndices', 1:4:20)
title('($N^{H}_{X}$)','FontSize',6,'Interpreter','latex')





% mass_VL
subplot(4,4,9)
plot((oo_.irfs.mass_VL_eps_tauIMH(1:20)/eqlbm_ss0.masses(5))*100, '-o','LineWidth',1.5,'color', [0.4660 0.6740 0.1880], 'MarkerSize',6,'MarkerIndices', 1:4:20);
hold on
plot((oo_.irfs.mass_VL_eps_tau_offshoringH(1:20)/eqlbm_ss0.masses(5))*100,'-^', 'LineWidth',1.5,'color', [0 0.4470 0.7410], 'MarkerSize',6,'MarkerIndices', 1:4:20)
hold on
plot((oo_.irfs.mass_VL_eps_s_DH(1:20)/eqlbm_ss0.masses(5))*100,'-x','LineWidth',1.5,'color', [0.8634  0.7406 0.1596], 'MarkerSize',6,'MarkerIndices', 1:4:20)
hold on
plot((oo_.irfs.mass_VL_eps_s_EH(1:20)/eqlbm_ss0.masses(5))*100,'-square','LineWidth',1.5,'color', [0.8555  0.1555 0.1555], 'MarkerSize',6,'MarkerIndices', 1:4:20)
title('($N^{L}_{V}$)','FontSize',6,'Interpreter','latex')




% mass_VH
subplot(4,4,10)
plot((oo_.irfs.mass_VH_eps_tauIMH(1:20)/eqlbm_ss0.masses(6))*100, '-o','LineWidth',1.5,'color', [0.4660 0.6740 0.1880], 'MarkerSize',6,'MarkerIndices', 1:4:20);
hold on
plot((oo_.irfs.mass_VH_eps_tau_offshoringH(1:20)/eqlbm_ss0.masses(6))*100,'-^', 'LineWidth',1.5,'color', [0 0.4470 0.7410], 'MarkerSize',6,'MarkerIndices', 1:4:20)
hold on
plot((oo_.irfs.mass_VH_eps_s_DH(1:20)/eqlbm_ss0.masses(6))*100,'-x','LineWidth',1.5,'color', [0.8634  0.7406 0.1596], 'MarkerSize',6,'MarkerIndices', 1:4:20)
hold on
plot((oo_.irfs.mass_VH_eps_s_EH(1:20)/eqlbm_ss0.masses(6))*100,'-square','LineWidth',1.5,'color', [0.8555  0.1555 0.1555], 'MarkerSize',6,'MarkerIndices', 1:4:20)
title('($N^{H}_{V}$)','FontSize',6,'Interpreter','latex')




% mass_EL
subplot(4,4,11)
plot((oo_.irfs.mass_EL_eps_tauIMH(1:20)/eqlbm_ss0.masses(9))*100, '-o','LineWidth',1.5,'color', [0.4660 0.6740 0.1880], 'MarkerSize',6,'MarkerIndices', 1:4:20);
hold on
plot((oo_.irfs.mass_EL_eps_tau_offshoringH(1:20)/eqlbm_ss0.masses(9))*100,'-^', 'LineWidth',1.5,'color', [0 0.4470 0.7410], 'MarkerSize',6,'MarkerIndices', 1:4:20)
hold on
plot((oo_.irfs.mass_EL_eps_s_DH(1:20)/eqlbm_ss0.masses(9))*100,'-x','LineWidth',1.5,'color', [0.8634  0.7406 0.1596], 'MarkerSize',6,'MarkerIndices', 1:4:20)
hold on
plot((oo_.irfs.mass_EL_eps_s_EH(1:20)/eqlbm_ss0.masses(9))*100,'-square','LineWidth',1.5,'color', [0.8555  0.1555 0.1555], 'MarkerSize',6,'MarkerIndices', 1:4:20)
title('($N^{L}_{E}$)','FontSize',6,'Interpreter','latex')



% mass_EH
subplot(4,4,12)
plot((oo_.irfs.mass_EH_eps_tauIMH(1:20)/eqlbm_ss0.masses(10))*100, '-o','LineWidth',1.5,'color', [0.4660 0.6740 0.1880], 'MarkerSize',6,'MarkerIndices', 1:4:20);
hold on
plot((oo_.irfs.mass_EH_eps_tau_offshoringH(1:20)/eqlbm_ss0.masses(10))*100,'-^', 'LineWidth',1.5,'color', [0 0.4470 0.7410], 'MarkerSize',6,'MarkerIndices', 1:4:20)
hold on
plot((oo_.irfs.mass_EH_eps_s_DH(1:20)/eqlbm_ss0.masses(10))*100,'-x','LineWidth',1.5,'color', [0.8634  0.7406 0.1596], 'MarkerSize',6,'MarkerIndices', 1:4:20)
hold on
plot((oo_.irfs.mass_EH_eps_s_EH(1:20)/eqlbm_ss0.masses(10))*100,'-square','LineWidth',1.5,'color', [0.8555  0.1555 0.1555], 'MarkerSize',6,'MarkerIndices', 1:4:20)
title('($N^{H}_{E}$)','FontSize',6,'Interpreter','latex')



% CLl
subplot(4,4,13)
plot((oo_.irfs.CLl_eps_tauIMH(1:20)/eqlbm_ss0.hh(4))*100, '-o','LineWidth',1.5,'color', [0.4660 0.6740 0.1880], 'MarkerSize',6,'MarkerIndices', 1:4:20);
hold on
plot((oo_.irfs.CLl_eps_tau_offshoringH(1:20)/eqlbm_ss0.hh(4))*100,'-^', 'LineWidth',1.5,'color', [0 0.4470 0.7410], 'MarkerSize',6,'MarkerIndices', 1:4:20)
hold on
plot((oo_.irfs.CLl_eps_s_DH(1:20)/eqlbm_ss0.hh(4))*100,'-x','LineWidth',1.5,'color', [0.8634  0.7406 0.1596], 'MarkerSize',6,'MarkerIndices', 1:4:20)
hold on
plot((oo_.irfs.CLl_eps_s_EH(1:20)/eqlbm_ss0.hh(4))*100,'-square','LineWidth',1.5,'color', [0.8555  0.1555 0.1555], 'MarkerSize',6,'MarkerIndices', 1:4:20)
title('($C^{Ll}$)','FontSize',6,'Interpreter','latex')



% CHl
subplot(4,4,14)
plot((oo_.irfs.CHl_eps_tauIMH(1:20)/eqlbm_ss0.hh(2))*100, '-o','LineWidth',1.5,'color', [0.4660 0.6740 0.1880], 'MarkerSize',6,'MarkerIndices', 1:4:20);
hold on
plot((oo_.irfs.CHl_eps_tau_offshoringH(1:20)/eqlbm_ss0.hh(2))*100,'-^', 'LineWidth',1.5,'color', [0 0.4470 0.7410], 'MarkerSize',6,'MarkerIndices', 1:4:20)
hold on
plot((oo_.irfs.CHl_eps_s_DH(1:20)/eqlbm_ss0.hh(2))*100,'-x','LineWidth',1.5,'color', [0.8634  0.7406 0.1596], 'MarkerSize',6,'MarkerIndices', 1:4:20)
hold on
plot((oo_.irfs.CHl_eps_s_EH(1:20)/eqlbm_ss0.hh(2))*100,'-square','LineWidth',1.5,'color', [0.8555  0.1555 0.1555], 'MarkerSize',6,'MarkerIndices', 1:4:20)
title('($C^{Hl}$)','FontSize',6,'Interpreter','latex')


% CLh
subplot(4,4,15)
plot((oo_.irfs.CLh_eps_tauIMH(1:20)/eqlbm_ss0.hh(3))*100, '-o','LineWidth',1.5,'color', [0.4660 0.6740 0.1880], 'MarkerSize',6,'MarkerIndices', 1:4:20);
hold on
plot((oo_.irfs.CLh_eps_tau_offshoringH(1:20)/eqlbm_ss0.hh(3))*100,'-^', 'LineWidth',1.5,'color', [0 0.4470 0.7410], 'MarkerSize',6,'MarkerIndices', 1:4:20)
hold on
plot((oo_.irfs.CLh_eps_s_DH(1:20)/eqlbm_ss0.hh(3))*100,'-x','LineWidth',1.5,'color', [0.8634  0.7406 0.1596], 'MarkerSize',6,'MarkerIndices', 1:4:20)
hold on
plot((oo_.irfs.CLh_eps_s_EH(1:20)/eqlbm_ss0.hh(3))*100,'-square','LineWidth',1.5,'color', [0.8555  0.1555 0.1555], 'MarkerSize',6,'MarkerIndices', 1:4:20)
title('($C^{Lh}$)','FontSize',6,'Interpreter','latex')




% CHh
subplot(4,4,16)
plot((oo_.irfs.CHh_eps_tauIMH(1:20)/eqlbm_ss0.hh(1))*100, '-o','LineWidth',1.5,'color', [0.4660 0.6740 0.1880], 'MarkerSize',6,'MarkerIndices', 1:4:20);
hold on
plot((oo_.irfs.CHh_eps_tau_offshoringH(1:20)/eqlbm_ss0.hh(1))*100,'-^', 'LineWidth',1.5,'color', [0 0.4470 0.7410], 'MarkerSize',6,'MarkerIndices', 1:4:20)
hold on
plot((oo_.irfs.CHh_eps_s_DH(1:20)/eqlbm_ss0.hh(1))*100,'-x','LineWidth',1.5,'color', [0.8634  0.7406 0.1596], 'MarkerSize',6,'MarkerIndices', 1:4:20)
hold on
plot((oo_.irfs.CHh_eps_s_EH(1:20)/eqlbm_ss0.hh(1))*100,'-square','LineWidth',1.5,'color', [0.8555  0.1555 0.1555], 'MarkerSize',6,'MarkerIndices', 1:4:20)
title('($C^{Hh}$)','FontSize',6,'Interpreter','latex')

legend('$\tau_{IM}$ shock', '$\tau_{V}$ shock', '$s_{D}$ shock','$s_{E}$ shock','Interpreter','latex','position',[0.5 0.02 0.005 0.005], 'NumColumns', 4, 'FontSize',6)
% saveas(figure(1), [pwd '/Northshock_North_2sec1_10Sep2025.eps'],'epsc');

 
%%%%%%%%%%%%%

figure(2)
% Q
subplot(4,4,1)
plot((oo_.irfs.Q_eps_tauIMH(1:20)/solve(1))*100, '-o','LineWidth',1.5,'color', [0.4660 0.6740 0.1880], 'MarkerSize',6,'MarkerIndices', 1:4:20);
hold on
plot((oo_.irfs.Q_eps_tau_offshoringH(1:20)/solve(1))*100,'-^', 'LineWidth',1.5,'color', [0 0.4470 0.7410], 'MarkerSize',6,'MarkerIndices', 1:4:20)
hold on
plot((oo_.irfs.Q_eps_s_DH(1:20)/solve(1))*100,'-x','LineWidth',1.5,'color', [0.8634  0.7406 0.1596], 'MarkerSize',6,'MarkerIndices', 1:4:20)
hold on
plot((oo_.irfs.Q_eps_s_EH(1:20)/solve(1))*100,'-square','LineWidth',1.5,'color', [0.8555  0.1555 0.1555], 'MarkerSize',6,'MarkerIndices', 1:4:20)
title('($Q$)','FontSize',6,'Interpreter','latex')


% VHh
subplot(4,4,2)
plot((oo_.irfs.VHh_eps_tauIMH(1:20)/eqlbm_ss0.hh(19))*100, '-o','LineWidth',1.5,'color', [0.4660 0.6740 0.1880], 'MarkerSize',6,'MarkerIndices', 1:4:20);
hold on
plot((oo_.irfs.VHh_eps_tau_offshoringH(1:20)/eqlbm_ss0.hh(19))*100,'-^', 'LineWidth',1.5,'color', [0 0.4470 0.7410], 'MarkerSize',6,'MarkerIndices', 1:4:20)
hold on
plot((oo_.irfs.VHh_eps_s_DH(1:20)/eqlbm_ss0.hh(19))*100,'-x','LineWidth',1.5,'color', [0.8634  0.7406 0.1596], 'MarkerSize',6,'MarkerIndices', 1:4:20)
hold on
plot((oo_.irfs.VHh_eps_s_EH(1:20)/eqlbm_ss0.hh(19))*100,'-square','LineWidth',1.5,'color', [0.8555  0.1555 0.1555], 'MarkerSize',6,'MarkerIndices', 1:4:20)
title('($V^{Hh}$)','FontSize',6,'Interpreter','latex')


% VHl
subplot(4,4,3)
plot((oo_.irfs.VHl_eps_tauIMH(1:20)/eqlbm_ss0.hh(20))*100, '-o','LineWidth',1.5,'color', [0.4660 0.6740 0.1880], 'MarkerSize',6,'MarkerIndices', 1:4:20);
hold on
plot((oo_.irfs.VHl_eps_tau_offshoringH(1:20)/eqlbm_ss0.hh(20))*100,'-^', 'LineWidth',1.5,'color', [0 0.4470 0.7410], 'MarkerSize',6,'MarkerIndices', 1:4:20)
hold on
plot((oo_.irfs.VHl_eps_s_DH(1:20)/eqlbm_ss0.hh(20))*100,'-x','LineWidth',1.5,'color', [0.8634  0.7406 0.1596], 'MarkerSize',6,'MarkerIndices', 1:4:20)
hold on
plot((oo_.irfs.VHl_eps_s_EH(1:20)/eqlbm_ss0.hh(20))*100,'-square','LineWidth',1.5,'color', [0.8555  0.1555 0.1555], 'MarkerSize',6,'MarkerIndices', 1:4:20)
title('($V^{Hl}$)','FontSize',6,'Interpreter','latex')



% VLh
subplot(4,4,4)
plot((oo_.irfs.VLh_eps_tauIMH(1:20)/eqlbm_ss0.hh(21))*100, '-o','LineWidth',1.5,'color', [0.4660 0.6740 0.1880], 'MarkerSize',6,'MarkerIndices', 1:4:20);
hold on
plot((oo_.irfs.VLh_eps_tau_offshoringH(1:20)/eqlbm_ss0.hh(21))*100,'-^', 'LineWidth',1.5,'color', [0 0.4470 0.7410], 'MarkerSize',6,'MarkerIndices', 1:4:20)
hold on
plot((oo_.irfs.VLh_eps_s_DH(1:20)/eqlbm_ss0.hh(21))*100,'-x','LineWidth',1.5,'color', [0.8634  0.7406 0.1596], 'MarkerSize',6,'MarkerIndices', 1:4:20)
hold on
plot((oo_.irfs.VLh_eps_s_EH(1:20)/eqlbm_ss0.hh(21))*100,'-square','LineWidth',1.5,'color', [0.8555  0.1555 0.1555], 'MarkerSize',6,'MarkerIndices', 1:4:20)
title('($V^{Lh}$)','FontSize',6,'Interpreter','latex')


% VLl
subplot(4,4,5)
plot((oo_.irfs.VLl_eps_tauIMH(1:20)/eqlbm_ss0.hh(22))*100, '-o','LineWidth',1.5,'color', [0.4660 0.6740 0.1880], 'MarkerSize',6,'MarkerIndices', 1:4:20);
hold on
plot((oo_.irfs.VLl_eps_tau_offshoringH(1:20)/eqlbm_ss0.hh(22))*100,'-^', 'LineWidth',1.5,'color', [0 0.4470 0.7410], 'MarkerSize',6,'MarkerIndices', 1:4:20)
hold on
plot((oo_.irfs.VLl_eps_s_DH(1:20)/eqlbm_ss0.hh(22))*100,'-x','LineWidth',1.5,'color', [0.8634  0.7406 0.1596], 'MarkerSize',6,'MarkerIndices', 1:4:20)
hold on
plot((oo_.irfs.VLl_eps_s_EH(1:20)/eqlbm_ss0.hh(22))*100,'-square','LineWidth',1.5,'color', [0.8555  0.1555 0.1555], 'MarkerSize',6,'MarkerIndices', 1:4:20)
title('($V^{Ll}$)','FontSize',6,'Interpreter','latex')



% h_supplyH
subplot(4,4,6)
plot((oo_.irfs.h_supplyH_eps_tauIMH(1:20)/eqlbm_ss0.agg(17))*100, '-o','LineWidth',1.5,'color', [0.4660 0.6740 0.1880], 'MarkerSize',6,'MarkerIndices', 1:4:20);
hold on
plot((oo_.irfs.h_supplyH_eps_tau_offshoringH(1:20)/eqlbm_ss0.agg(17))*100,'-^', 'LineWidth',1.5,'color', [0 0.4470 0.7410], 'MarkerSize',6,'MarkerIndices', 1:4:20)
hold on
plot((oo_.irfs.h_supplyH_eps_s_DH(1:20)/eqlbm_ss0.agg(17))*100,'-x','LineWidth',1.5,'color', [0.8634  0.7406 0.1596], 'MarkerSize',6,'MarkerIndices', 1:4:20)
hold on
plot((oo_.irfs.h_supplyH_eps_s_EH(1:20)/eqlbm_ss0.agg(17))*100,'-square','LineWidth',1.5,'color', [0.8555  0.1555 0.1555], 'MarkerSize',6,'MarkerIndices', 1:4:20)
title('($H^{H}$)','FontSize',6,'Interpreter','latex')

% 
% % h_supplyH
% subplot(4,4,6)
% plot([0,oo_.irfs.h_supplyH_eps_tauIMH(1:19)/eqlbm_ss0.agg(17)]*100, '-o','LineWidth',1.5,'color', [0.4660 0.6740 0.1880], 'MarkerSize',6,'MarkerIndices', 1:4:20);
% hold on
% plot([0,oo_.irfs.h_supplyH_eps_tau_offshoringH(1:19)/eqlbm_ss0.agg(17)]*100,'-^', 'LineWidth',1.5,'color', [0 0.4470 0.7410], 'MarkerSize',6,'MarkerIndices', 1:4:20)
% hold on
% plot([0,oo_.irfs.h_supplyH_eps_s_DH(1:19)/eqlbm_ss0.agg(17)]*100,'-x','LineWidth',1.5,'color', [0.8634  0.7406 0.1596], 'MarkerSize',6,'MarkerIndices', 1:4:20)
% hold on
% plot([0,oo_.irfs.h_supplyH_eps_s_EH(1:19)/eqlbm_ss0.agg(17)]*100,'-square','LineWidth',1.5,'color', [0.8555  0.1555 0.1555], 'MarkerSize',6,'MarkerIndices', 1:4:20)
% title('($H^{H}$)','FontSize',6,'Interpreter','latex')

% 

% h_supplyL
subplot(4,4,7)
plot((oo_.irfs.h_supplyL_eps_tauIMH(1:20)/eqlbm_ss0.agg(16))*100, '-o','LineWidth',1.5,'color', [0.4660 0.6740 0.1880], 'MarkerSize',6,'MarkerIndices', 1:4:20);
hold on
plot((oo_.irfs.h_supplyL_eps_tau_offshoringH(1:20)/eqlbm_ss0.agg(16))*100,'-^', 'LineWidth',1.5,'color', [0 0.4470 0.7410], 'MarkerSize',6,'MarkerIndices', 1:4:20)
hold on
plot((oo_.irfs.h_supplyL_eps_s_DH(1:20)/eqlbm_ss0.agg(16))*100,'-x','LineWidth',1.5,'color', [0.8634  0.7406 0.1596], 'MarkerSize',6,'MarkerIndices', 1:4:20)
hold on
plot((oo_.irfs.h_supplyL_eps_s_EH(1:20)/eqlbm_ss0.agg(16))*100,'-square','LineWidth',1.5,'color', [0.8555  0.1555 0.1555], 'MarkerSize',6,'MarkerIndices', 1:4:20)
title('($H^{L}$)','FontSize',6,'Interpreter','latex')

% 
% 
% % h_supplyL
% subplot(4,4,7)
% plot([0,oo_.irfs.h_supplyL_eps_tauIMH(1:19)/eqlbm_ss0.agg(16)]*100, '-o','LineWidth',1.5,'color', [0.4660 0.6740 0.1880], 'MarkerSize',6,'MarkerIndices', 1:4:20);
% hold on
% plot([0,oo_.irfs.h_supplyL_eps_tau_offshoringH(1:19)/eqlbm_ss0.agg(16)]*100,'-^', 'LineWidth',1.5,'color', [0 0.4470 0.7410], 'MarkerSize',6,'MarkerIndices', 1:4:20)
% hold on
% plot([0,oo_.irfs.h_supplyL_eps_s_DH(1:19)/eqlbm_ss0.agg(16)]*100,'-x','LineWidth',1.5,'color', [0.8634  0.7406 0.1596], 'MarkerSize',6,'MarkerIndices', 1:4:20)
% hold on
% plot([0,oo_.irfs.h_supplyL_eps_s_EH(1:19)/eqlbm_ss0.agg(16)]*100,'-square','LineWidth',1.5,'color', [0.8555  0.1555 0.1555], 'MarkerSize',6,'MarkerIndices', 1:4:20)
% title('($H^{L}$)','FontSize',6,'Interpreter','latex')




% l_supplyH
subplot(4,4,8)
plot((oo_.irfs.l_supplyH_eps_tauIMH(1:20)/eqlbm_ss0.agg(6))*100, '-o','LineWidth',1.5,'color', [0.4660 0.6740 0.1880], 'MarkerSize',6,'MarkerIndices', 1:4:20);
hold on
plot((oo_.irfs.l_supplyH_eps_tau_offshoringH(1:20)/eqlbm_ss0.agg(6))*100,'-^', 'LineWidth',1.5,'color', [0 0.4470 0.7410], 'MarkerSize',6,'MarkerIndices', 1:4:20)
hold on
plot((oo_.irfs.l_supplyH_eps_s_DH(1:20)/eqlbm_ss0.agg(6))*100,'-x','LineWidth',1.5,'color', [0.8634  0.7406 0.1596], 'MarkerSize',6,'MarkerIndices', 1:4:20)
hold on
plot((oo_.irfs.l_supplyH_eps_s_EH(1:20)/eqlbm_ss0.agg(6))*100,'-square','LineWidth',1.5,'color', [0.8555  0.1555 0.1555], 'MarkerSize',6,'MarkerIndices', 1:4:20)
title('($L^{H}$)','FontSize',6,'Interpreter','latex')


% 
% 
% % l_supplyH
% subplot(4,4,8)
% plot([0,oo_.irfs.l_supplyH_eps_tauIMH(1:19)/eqlbm_ss0.agg(6)]*100, '-o','LineWidth',1.5,'color', [0.4660 0.6740 0.1880], 'MarkerSize',6,'MarkerIndices', 1:4:20);
% hold on
% plot([0,oo_.irfs.l_supplyH_eps_tau_offshoringH(1:19)/eqlbm_ss0.agg(6)]*100,'-^', 'LineWidth',1.5,'color', [0 0.4470 0.7410], 'MarkerSize',6,'MarkerIndices', 1:4:20)
% hold on
% plot([0,oo_.irfs.l_supplyH_eps_s_DH(1:19)/eqlbm_ss0.agg(6)]*100,'-x','LineWidth',1.5,'color', [0.8634  0.7406 0.1596], 'MarkerSize',6,'MarkerIndices', 1:4:20)
% hold on
% plot([0,oo_.irfs.l_supplyH_eps_s_EH(1:19)/eqlbm_ss0.agg(6)]*100,'-square','LineWidth',1.5,'color', [0.8555  0.1555 0.1555], 'MarkerSize',6,'MarkerIndices', 1:4:20)
% title('($L^{H}$)','FontSize',6,'Interpreter','latex')





% l_supplyL
subplot(4,4,9)
plot((oo_.irfs.l_supplyL_eps_tauIMH(1:20)/eqlbm_ss0.agg(7))*100, '-o','LineWidth',1.5,'color', [0.4660 0.6740 0.1880], 'MarkerSize',6,'MarkerIndices', 1:4:20);
hold on
plot((oo_.irfs.l_supplyL_eps_tau_offshoringH(1:20)/eqlbm_ss0.agg(7))*100,'-^', 'LineWidth',1.5,'color', [0 0.4470 0.7410], 'MarkerSize',6,'MarkerIndices', 1:4:20)
hold on
plot((oo_.irfs.l_supplyL_eps_s_DH(1:20)/eqlbm_ss0.agg(7))*100,'-x','LineWidth',1.5,'color', [0.8634  0.7406 0.1596], 'MarkerSize',6,'MarkerIndices', 1:4:20)
hold on
plot((oo_.irfs.l_supplyL_eps_s_EH(1:20)/eqlbm_ss0.agg(7))*100,'-square','LineWidth',1.5,'color', [0.8555  0.1555 0.1555], 'MarkerSize',6,'MarkerIndices', 1:4:20)
title('($L^{L}$)','FontSize',6,'Interpreter','latex')



% 
% 
% % l_supplyL
% subplot(4,4,9)
% plot([0,oo_.irfs.l_supplyL_eps_tauIMH(1:19)/eqlbm_ss0.agg(7)]*100, '-o','LineWidth',1.5,'color', [0.4660 0.6740 0.1880], 'MarkerSize',6,'MarkerIndices', 1:4:20);
% hold on
% plot([0,oo_.irfs.l_supplyL_eps_tau_offshoringH(1:19)/eqlbm_ss0.agg(7)]*100,'-^', 'LineWidth',1.5,'color', [0 0.4470 0.7410], 'MarkerSize',6,'MarkerIndices', 1:4:20)
% hold on
% plot([0,oo_.irfs.l_supplyL_eps_s_DH(1:19)/eqlbm_ss0.agg(7)]*100,'-x','LineWidth',1.5,'color', [0.8634  0.7406 0.1596], 'MarkerSize',6,'MarkerIndices', 1:4:20)
% hold on
% plot([0,oo_.irfs.l_supplyL_eps_s_EH(1:19)/eqlbm_ss0.agg(7)]*100,'-square','LineWidth',1.5,'color', [0.8555  0.1555 0.1555], 'MarkerSize',6,'MarkerIndices', 1:4:20)
% title('($L^{L}$)','FontSize',6,'Interpreter','latex')


% psiH
subplot(4,4,10)
plot((oo_.irfs.psiH_eps_tauIMH(1:20)/eqlbm_ss0.psiH_fixed)*100, '-o','LineWidth',1.5,'color', [0.4660 0.6740 0.1880], 'MarkerSize',6,'MarkerIndices', 1:4:20);
hold on
plot((oo_.irfs.psiH_eps_tau_offshoringH(1:20)/eqlbm_ss0.psiH_fixed)*100,'-^', 'LineWidth',1.5,'color', [0 0.4470 0.7410], 'MarkerSize',6,'MarkerIndices', 1:4:20)
hold on
plot((oo_.irfs.psiH_eps_s_DH(1:20)/eqlbm_ss0.psiH_fixed)*100,'-x','LineWidth',1.5,'color', [0.8634  0.7406 0.1596], 'MarkerSize',6,'MarkerIndices', 1:4:20)
hold on
plot((oo_.irfs.psiH_eps_s_EH(1:20)/eqlbm_ss0.psiH_fixed)*100,'-square','LineWidth',1.5,'color', [0.8555  0.1555 0.1555], 'MarkerSize',6,'MarkerIndices', 1:4:20)
title('($\psi^{H}$)','FontSize',6,'Interpreter','latex')




% psiL
subplot(4,4,11)
plot((oo_.irfs.psiL_eps_tauIMH(1:20)/eqlbm_ss0.psiL_fixed)*100, '-o','LineWidth',1.5,'color', [0.4660 0.6740 0.1880], 'MarkerSize',6,'MarkerIndices', 1:4:20);
hold on
plot((oo_.irfs.psiL_eps_tau_offshoringH(1:20)/eqlbm_ss0.psiL_fixed)*100,'-^', 'LineWidth',1.5,'color', [0 0.4470 0.7410], 'MarkerSize',6,'MarkerIndices', 1:4:20)
hold on
plot((oo_.irfs.psiL_eps_s_DH(1:20)/eqlbm_ss0.psiL_fixed)*100,'-x','LineWidth',1.5,'color', [0.8634  0.7406 0.1596], 'MarkerSize',6,'MarkerIndices', 1:4:20)
hold on
plot((oo_.irfs.psiL_eps_s_EH(1:20)/eqlbm_ss0.psiL_fixed)*100,'-square','LineWidth',1.5,'color', [0.8555  0.1555 0.1555], 'MarkerSize',6,'MarkerIndices', 1:4:20)
title('($\psi^{L}$)','FontSize',6,'Interpreter','latex')



% HhE_supply
subplot(4,4,12)
plot((oo_.irfs.HhE_supply_eps_tauIMH(1:20)/eqlbm_ss0.hh(27))*100, '-o','LineWidth',1.5,'color', [0.4660 0.6740 0.1880], 'MarkerSize',6,'MarkerIndices', 1:4:20);
hold on
plot((oo_.irfs.HhE_supply_eps_tau_offshoringH(1:20)/eqlbm_ss0.hh(27))*100,'-^', 'LineWidth',1.5,'color', [0 0.4470 0.7410], 'MarkerSize',6,'MarkerIndices', 1:4:20)
hold on
plot((oo_.irfs.HhE_supply_eps_s_DH(1:20)/eqlbm_ss0.hh(27))*100,'-x','LineWidth',1.5,'color', [0.8634  0.7406 0.1596], 'MarkerSize',6,'MarkerIndices', 1:4:20)
hold on
plot((oo_.irfs.HhE_supply_eps_s_EH(1:20)/eqlbm_ss0.hh(27))*100,'-square','LineWidth',1.5,'color', [0.8555  0.1555 0.1555], 'MarkerSize',6,'MarkerIndices', 1:4:20)
title('($H^{H}_{E}$)','FontSize',6,'Interpreter','latex')



% HlE_supply
subplot(4,4,13)
plot((oo_.irfs.HlE_supply_eps_tauIMH(1:20)/eqlbm_ss0.hh(28))*100, '-o','LineWidth',1.5,'color', [0.4660 0.6740 0.1880], 'MarkerSize',6,'MarkerIndices', 1:4:20);
hold on
plot((oo_.irfs.HlE_supply_eps_tau_offshoringH(1:20)/eqlbm_ss0.hh(28))*100,'-^', 'LineWidth',1.5,'color', [0 0.4470 0.7410], 'MarkerSize',6,'MarkerIndices', 1:4:20)
hold on
plot((oo_.irfs.HlE_supply_eps_s_DH(1:20)/eqlbm_ss0.hh(28))*100,'-x','LineWidth',1.5,'color', [0.8634  0.7406 0.1596], 'MarkerSize',6,'MarkerIndices', 1:4:20)
hold on
plot((oo_.irfs.HlE_supply_eps_s_EH(1:20)/eqlbm_ss0.hh(28))*100,'-square','LineWidth',1.5,'color', [0.8555  0.1555 0.1555], 'MarkerSize',6,'MarkerIndices', 1:4:20)
title('($H^{L}_{E}$)','FontSize',6,'Interpreter','latex')


% LhE_supply
subplot(4,4,14)
plot((oo_.irfs.LhE_supply_eps_tauIMH(1:20)/eqlbm_ss0.hh(33))*100, '-o','LineWidth',1.5,'color', [0.4660 0.6740 0.1880], 'MarkerSize',6,'MarkerIndices', 1:4:20);
hold on
plot((oo_.irfs.LhE_supply_eps_tau_offshoringH(1:20)/eqlbm_ss0.hh(33))*100,'-^', 'LineWidth',1.5,'color', [0 0.4470 0.7410], 'MarkerSize',6,'MarkerIndices', 1:4:20)
hold on
plot((oo_.irfs.LhE_supply_eps_s_DH(1:20)/eqlbm_ss0.hh(33))*100,'-x','LineWidth',1.5,'color', [0.8634  0.7406 0.1596], 'MarkerSize',6,'MarkerIndices', 1:4:20)
hold on
plot((oo_.irfs.LhE_supply_eps_s_EH(1:20)/eqlbm_ss0.hh(33))*100,'-square','LineWidth',1.5,'color', [0.8555  0.1555 0.1555], 'MarkerSize',6,'MarkerIndices', 1:4:20)
title('($L^{H}_{E}$)','FontSize',6,'Interpreter','latex')


% LlE_supply
subplot(4,4,15)
plot((oo_.irfs.LlE_supply_eps_tauIMH(1:20)/eqlbm_ss0.hh(34))*100, '-o','LineWidth',1.5,'color', [0.4660 0.6740 0.1880], 'MarkerSize',6,'MarkerIndices', 1:4:20);
hold on
plot((oo_.irfs.LlE_supply_eps_tau_offshoringH(1:20)/eqlbm_ss0.hh(34))*100,'-^', 'LineWidth',1.5,'color', [0 0.4470 0.7410], 'MarkerSize',6,'MarkerIndices', 1:4:20)
hold on
plot((oo_.irfs.LlE_supply_eps_s_DH(1:20)/eqlbm_ss0.hh(34))*100,'-x','LineWidth',1.5,'color', [0.8634  0.7406 0.1596], 'MarkerSize',6,'MarkerIndices', 1:4:20)
hold on
plot((oo_.irfs.LlE_supply_eps_s_EH(1:20)/eqlbm_ss0.hh(34))*100,'-square','LineWidth',1.5,'color', [0.8555  0.1555 0.1555], 'MarkerSize',6,'MarkerIndices', 1:4:20)
title('($L^{L}_{E}$)','FontSize',6,'Interpreter','latex')



% ToTH
subplot(4,4,16)
plot(ToTH_eps_tauIMH(1:20)/ToTH_SS*100, '-o','LineWidth',1.5,'color', [0.4660 0.6740 0.1880], 'MarkerSize',6,'MarkerIndices', 1:4:20);
hold on
plot(ToTH_eps_tau_offshoringH(1:20)/ToTH_SS*100,'-^', 'LineWidth',1.5,'color', [0 0.4470 0.7410], 'MarkerSize',6,'MarkerIndices', 1:4:20)
hold on
plot(ToTH_eps_s_DH(1:20)/ToTH_SS*100,'-x','LineWidth',1.5,'color', [0.8634  0.7406 0.1596], 'MarkerSize',6,'MarkerIndices', 1:4:20)
hold on
plot(ToTH_eps_s_EH(1:20)/ToTH_SS*100,'-square','LineWidth',1.5,'color', [0.8555  0.1555 0.1555], 'MarkerSize',6,'MarkerIndices', 1:4:20)
title('($ToT^{H}$)','FontSize',6,'Interpreter','latex')


legend('$\tau_{IM}$ shock', '$\tau_{V}$ shock', '$s_{D}$ shock','$s_{E}$ shock','Interpreter','latex','position',[0.50 0.02 0.005 0.005], 'NumColumns', 4, 'FontSize',6)
% saveas(figure(2), [pwd '/Northshock_North_2sec2_10Sep2025.eps'],'epsc');


%%%%%%%%%%%%%

figure(3)
subplot(4,4,1)
plot((oo_.irfs.wLl_star_eps_tauIMH(1:20)/eqlbm_ss0.wLl_star_fixed)*100, '-o','LineWidth',1.5,'color', [0.4660 0.6740 0.1880], 'MarkerSize',6,'MarkerIndices', 1:4:20);
hold on
plot((oo_.irfs.wLl_star_eps_tau_offshoringH(1:20)/eqlbm_ss0.wLl_star_fixed)*100,'-^', 'LineWidth',1.5,'color', [0 0.4470 0.7410], 'MarkerSize',6,'MarkerIndices', 1:4:20)
hold on
plot((oo_.irfs.wLl_star_eps_s_DH(1:20)/eqlbm_ss0.wLl_star_fixed)*100,'-x','LineWidth',1.5,'color', [0.8634  0.7406 0.1596], 'MarkerSize',6,'MarkerIndices', 1:4:20)
hold on
plot((oo_.irfs.wLl_star_eps_s_EH(1:20)/eqlbm_ss0.wLl_star_fixed)*100,'-square','LineWidth',1.5,'color', [0.8555  0.1555 0.1555], 'MarkerSize',6,'MarkerIndices', 1:4:20)
title('($w^{Ll*}$)','FontSize',6,'Interpreter','latex')

subplot(4,4,2)
plot((oo_.irfs.wHl_star_eps_tauIMH(1:20)/eqlbm_ss0.wHl_star_fixed)*100, '-o','LineWidth',1.5,'color', [0.4660 0.6740 0.1880], 'MarkerSize',6,'MarkerIndices', 1:4:20);
hold on
plot((oo_.irfs.wHl_star_eps_tau_offshoringH(1:20)/eqlbm_ss0.wHl_star_fixed)*100,'-^', 'LineWidth',1.5,'color', [0 0.4470 0.7410], 'MarkerSize',6,'MarkerIndices', 1:4:20)
hold on
plot((oo_.irfs.wHl_star_eps_s_DH(1:20)/eqlbm_ss0.wHl_star_fixed)*100,'-x','LineWidth',1.5,'color', [0.8634  0.7406 0.1596], 'MarkerSize',6,'MarkerIndices', 1:4:20)
hold on
plot((oo_.irfs.wHl_star_eps_s_EH(1:20)/eqlbm_ss0.wHl_star_fixed)*100,'-square','LineWidth',1.5,'color', [0.8555  0.1555 0.1555], 'MarkerSize',6,'MarkerIndices', 1:4:20)
title('($w^{Hl*}$)','FontSize',6,'Interpreter','latex')

subplot(4,4,3)
plot((oo_.irfs.wLh_star_eps_tauIMH(1:20)/eqlbm_ss0.wLh_fixed)*100, '-o','LineWidth',1.5,'color', [0.4660 0.6740 0.1880], 'MarkerSize',6,'MarkerIndices', 1:4:20);
hold on
plot((oo_.irfs.wLh_star_eps_tau_offshoringH(1:20)/eqlbm_ss0.wLh_fixed)*100,'-^', 'LineWidth',1.5,'color', [0 0.4470 0.7410], 'MarkerSize',6,'MarkerIndices', 1:4:20)
hold on
plot((oo_.irfs.wLh_star_eps_s_DH(1:20)/eqlbm_ss0.wLh_fixed)*100,'-x','LineWidth',1.5,'color', [0.8634  0.7406 0.1596], 'MarkerSize',6,'MarkerIndices', 1:4:20)
hold on
plot((oo_.irfs.wLh_star_eps_s_EH(1:20)/eqlbm_ss0.wLh_fixed)*100,'-square','LineWidth',1.5,'color', [0.8555  0.1555 0.1555], 'MarkerSize',6,'MarkerIndices', 1:4:20)
title('($w^{Lh*}$)','FontSize',6,'Interpreter','latex')


subplot(4,4,4)
plot((oo_.irfs.wHh_star_eps_tauIMH(1:20)/eqlbm_ss0.wHh_fixed)*100, '-o','LineWidth',1.5,'color', [0.4660 0.6740 0.1880], 'MarkerSize',6,'MarkerIndices', 1:4:20);
hold on
plot((oo_.irfs.wHh_star_eps_tau_offshoringH(1:20)/eqlbm_ss0.wHh_fixed)*100,'-^', 'LineWidth',1.5,'color', [0 0.4470 0.7410], 'MarkerSize',6,'MarkerIndices', 1:4:20)
hold on
plot((oo_.irfs.wHh_star_eps_s_DH(1:20)/eqlbm_ss0.wHh_fixed)*100,'-x','LineWidth',1.5,'color', [0.8634  0.7406 0.1596], 'MarkerSize',6,'MarkerIndices', 1:4:20)
hold on
plot((oo_.irfs.wHh_star_eps_s_EH(1:20)/eqlbm_ss0.wHh_fixed)*100,'-square','LineWidth',1.5,'color', [0.8555  0.1555 0.1555], 'MarkerSize',6,'MarkerIndices', 1:4:20)
title('($w^{Hh*}$)','FontSize',6,'Interpreter','latex')






subplot(4,4,5)
plot([0,oo_.irfs.massL_star_eps_tauIMH(1:19)/eqlbm_ss0.masses(11)]*100, '-o','LineWidth',1.5,'color', [0.4660 0.6740 0.1880], 'MarkerSize',6,'MarkerIndices', 1:4:20);
hold on
plot([0,oo_.irfs.massL_star_eps_tau_offshoringH(1:19)/eqlbm_ss0.masses(11)]*100,'-^', 'LineWidth',1.5,'color', [0 0.4470 0.7410], 'MarkerSize',6,'MarkerIndices', 1:4:20)
hold on
plot([0,oo_.irfs.massL_star_eps_s_DH(1:19)/eqlbm_ss0.masses(11)]*100,'-x','LineWidth',1.5,'color', [0.8634  0.7406 0.1596], 'MarkerSize',6,'MarkerIndices', 1:4:20)
hold on
plot([0,oo_.irfs.massL_star_eps_s_EH(1:19)/eqlbm_ss0.masses(11)]*100,'-square','LineWidth',1.5,'color', [0.8555  0.1555 0.1555], 'MarkerSize',6,'MarkerIndices', 1:4:20)
title('($N^{L*}$)','FontSize',6,'Interpreter','latex')







subplot(4,4,6)
plot([0,oo_.irfs.massH_star_eps_tauIMH(1:19)/eqlbm_ss0.masses(12)]*100, '-o','LineWidth',1.5,'color', [0.4660 0.6740 0.1880], 'MarkerSize',6,'MarkerIndices', 1:4:20);
hold on
plot([0,oo_.irfs.massH_star_eps_tau_offshoringH(1:19)/eqlbm_ss0.masses(12)]*100,'-^', 'LineWidth',1.5,'color', [0 0.4470 0.7410], 'MarkerSize',6,'MarkerIndices', 1:4:20)
hold on
plot([0,oo_.irfs.massH_star_eps_s_DH(1:19)/eqlbm_ss0.masses(12)]*100,'-x','LineWidth',1.5,'color', [0.8634  0.7406 0.1596], 'MarkerSize',6,'MarkerIndices', 1:4:20)
hold on
plot([0,oo_.irfs.massH_star_eps_s_EH(1:19)/eqlbm_ss0.masses(12)]*100,'-square','LineWidth',1.5,'color', [0.8555  0.1555 0.1555], 'MarkerSize',6,'MarkerIndices', 1:4:20)
title('($N^{H*}$)','FontSize',6,'Interpreter','latex')




subplot(4,4,7)
plot((oo_.irfs.mass_XL_star_eps_tauIMH(1:20)/eqlbm_ss0.masses(17))*100, '-o','LineWidth',1.5,'color', [0.4660 0.6740 0.1880], 'MarkerSize',6,'MarkerIndices', 1:4:20);
hold on
plot((oo_.irfs.mass_XL_star_eps_tau_offshoringH(1:20)/eqlbm_ss0.masses(17))*100,'-^', 'LineWidth',1.5,'color', [0 0.4470 0.7410], 'MarkerSize',6,'MarkerIndices', 1:4:20)
hold on
plot((oo_.irfs.mass_XL_star_eps_s_DH(1:20)/eqlbm_ss0.masses(17))*100,'-x','LineWidth',1.5,'color', [0.8634  0.7406 0.1596], 'MarkerSize',6,'MarkerIndices', 1:4:20)
hold on
plot((oo_.irfs.mass_XL_star_eps_s_EH(1:20)/eqlbm_ss0.masses(17))*100,'-square','LineWidth',1.5,'color', [0.8555  0.1555 0.1555], 'MarkerSize',6,'MarkerIndices', 1:4:20)
title('($N_{X}^{L*}$)','FontSize',6,'Interpreter','latex')


subplot(4,4,8)
plot((oo_.irfs.mass_XH_star_eps_tauIMH(1:20)/eqlbm_ss0.masses(18))*100, '-o','LineWidth',1.5,'color', [0.4660 0.6740 0.1880], 'MarkerSize',6,'MarkerIndices', 1:4:20);
hold on
plot((oo_.irfs.mass_XH_star_eps_tau_offshoringH(1:20)/eqlbm_ss0.masses(18))*100,'-^', 'LineWidth',1.5,'color', [0 0.4470 0.7410], 'MarkerSize',6,'MarkerIndices', 1:4:20)
hold on
plot((oo_.irfs.mass_XH_star_eps_s_DH(1:20)/eqlbm_ss0.masses(18))*100,'-x','LineWidth',1.5,'color', [0.8634  0.7406 0.1596], 'MarkerSize',6,'MarkerIndices', 1:4:20)
hold on
plot((oo_.irfs.mass_XH_star_eps_s_EH(1:20)/eqlbm_ss0.masses(18))*100,'-square','LineWidth',1.5,'color', [0.8555  0.1555 0.1555], 'MarkerSize',6,'MarkerIndices', 1:4:20)
title('($N_{X}^{H*}$)','FontSize',6,'Interpreter','latex')


subplot(4,4,9)
plot((oo_.irfs.mass_VL_star_eps_tauIMH(1:20)/eqlbm_ss0.masses(15))*100, '-o','LineWidth',1.5,'color', [0.4660 0.6740 0.1880], 'MarkerSize',6,'MarkerIndices', 1:4:20);
hold on
plot((oo_.irfs.mass_VL_star_eps_tau_offshoringH(1:20)/eqlbm_ss0.masses(15))*100,'-^', 'LineWidth',1.5,'color', [0 0.4470 0.7410], 'MarkerSize',6,'MarkerIndices', 1:4:20)
hold on
plot((oo_.irfs.mass_VL_star_eps_s_DH(1:20)/eqlbm_ss0.masses(15))*100,'-x','LineWidth',1.5,'color', [0.8634  0.7406 0.1596], 'MarkerSize',6,'MarkerIndices', 1:4:20)
hold on
plot((oo_.irfs.mass_VL_star_eps_s_EH(1:20)/eqlbm_ss0.masses(15))*100,'-square','LineWidth',1.5,'color', [0.8555  0.1555 0.1555], 'MarkerSize',6,'MarkerIndices', 1:4:20)
title('($N_{V}^{L*}$)','FontSize',6,'Interpreter','latex')



subplot(4,4,10)
plot((oo_.irfs.mass_VH_star_eps_tauIMH(1:20)/eqlbm_ss0.masses(16))*100, '-o','LineWidth',1.5,'color', [0.4660 0.6740 0.1880], 'MarkerSize',6,'MarkerIndices', 1:4:20);
hold on
plot((oo_.irfs.mass_VH_star_eps_tau_offshoringH(1:20)/eqlbm_ss0.masses(16))*100,'-^', 'LineWidth',1.5,'color', [0 0.4470 0.7410], 'MarkerSize',6,'MarkerIndices', 1:4:20)
hold on
plot((oo_.irfs.mass_VH_star_eps_s_DH(1:20)/eqlbm_ss0.masses(16))*100,'-x','LineWidth',1.5,'color', [0.8634  0.7406 0.1596], 'MarkerSize',6,'MarkerIndices', 1:4:20)
hold on
plot((oo_.irfs.mass_VH_star_eps_s_EH(1:20)/eqlbm_ss0.masses(16))*100,'-square','LineWidth',1.5,'color', [0.8555  0.1555 0.1555], 'MarkerSize',6,'MarkerIndices', 1:4:20)
title('($N_{V}^{H*}$)','FontSize',6,'Interpreter','latex')


subplot(4,4,11)
plot((oo_.irfs.mass_EL_star_eps_tauIMH(1:20)/eqlbm_ss0.masses(19))*100, '-o','LineWidth',1.5,'color', [0.4660 0.6740 0.1880], 'MarkerSize',6,'MarkerIndices', 1:4:20);
hold on
plot((oo_.irfs.mass_EL_star_eps_tau_offshoringH(1:20)/eqlbm_ss0.masses(19))*100,'-^', 'LineWidth',1.5,'color', [0 0.4470 0.7410], 'MarkerSize',6,'MarkerIndices', 1:4:20)
hold on
plot((oo_.irfs.mass_EL_star_eps_s_DH(1:20)/eqlbm_ss0.masses(19))*100,'-x','LineWidth',1.5,'color', [0.8634  0.7406 0.1596], 'MarkerSize',6,'MarkerIndices', 1:4:20)
hold on
plot((oo_.irfs.mass_EL_star_eps_s_EH(1:20)/eqlbm_ss0.masses(19))*100,'-square','LineWidth',1.5,'color', [0.8555  0.1555 0.1555], 'MarkerSize',6,'MarkerIndices', 1:4:20)
title('($N_{E}^{L*}$)','FontSize',6,'Interpreter','latex')



subplot(4,4,12)
plot((oo_.irfs.mass_EH_star_eps_tauIMH(1:20)/eqlbm_ss0.masses(20))*100, '-o','LineWidth',1.5,'color', [0.4660 0.6740 0.1880], 'MarkerSize',6,'MarkerIndices', 1:4:20);
hold on
plot((oo_.irfs.mass_EH_star_eps_tau_offshoringH(1:20)/eqlbm_ss0.masses(20))*100,'-^', 'LineWidth',1.5,'color', [0 0.4470 0.7410], 'MarkerSize',6,'MarkerIndices', 1:4:20)
hold on
plot((oo_.irfs.mass_EH_star_eps_s_DH(1:20)/eqlbm_ss0.masses(20))*100,'-x','LineWidth',1.5,'color', [0.8634  0.7406 0.1596], 'MarkerSize',6,'MarkerIndices', 1:4:20)
hold on
plot((oo_.irfs.mass_EH_star_eps_s_EH(1:20)/eqlbm_ss0.masses(20))*100,'-square','LineWidth',1.5,'color', [0.8555  0.1555 0.1555], 'MarkerSize',6,'MarkerIndices', 1:4:20)
title('($N_{E}^{H*}$)','FontSize',6,'Interpreter','latex')




subplot(4,4,13)
plot((oo_.irfs.CLl_star_eps_tauIMH(1:20)/eqlbm_ss0.hh(8))*100, '-o','LineWidth',1.5,'color', [0.4660 0.6740 0.1880], 'MarkerSize',6,'MarkerIndices', 1:4:20);
hold on
plot((oo_.irfs.CLl_star_eps_tau_offshoringH(1:20)/eqlbm_ss0.hh(8))*100,'-^', 'LineWidth',1.5,'color', [0 0.4470 0.7410], 'MarkerSize',6,'MarkerIndices', 1:4:20)
hold on
plot((oo_.irfs.CLl_star_eps_s_DH(1:20)/eqlbm_ss0.hh(8))*100,'-x','LineWidth',1.5,'color', [0.8634  0.7406 0.1596], 'MarkerSize',6,'MarkerIndices', 1:4:20)
hold on
plot((oo_.irfs.CLl_star_eps_s_EH(1:20)/eqlbm_ss0.hh(8))*100,'-square','LineWidth',1.5,'color', [0.8555  0.1555 0.1555], 'MarkerSize',6,'MarkerIndices', 1:4:20)
title('($C^{Ll*}$)','FontSize',6,'Interpreter','latex')



subplot(4,4,14)
plot((oo_.irfs.CHl_star_eps_tauIMH(1:20)/eqlbm_ss0.hh(6))*100, '-o','LineWidth',1.5,'color', [0.4660 0.6740 0.1880], 'MarkerSize',6,'MarkerIndices', 1:4:20);
hold on
plot((oo_.irfs.CHl_star_eps_tau_offshoringH(1:20)/eqlbm_ss0.hh(6))*100,'-^', 'LineWidth',1.5,'color', [0 0.4470 0.7410], 'MarkerSize',6,'MarkerIndices', 1:4:20)
hold on
plot((oo_.irfs.CHl_star_eps_s_DH(1:20)/eqlbm_ss0.hh(6))*100,'-x','LineWidth',1.5,'color', [0.8634  0.7406 0.1596], 'MarkerSize',6,'MarkerIndices', 1:4:20)
hold on
plot((oo_.irfs.CHl_star_eps_s_EH(1:20)/eqlbm_ss0.hh(6))*100,'-square','LineWidth',1.5,'color', [0.8555  0.1555 0.1555], 'MarkerSize',6,'MarkerIndices', 1:4:20)
title('($C^{Hl*}$)','FontSize',6,'Interpreter','latex')




subplot(4,4,15)
plot((oo_.irfs.CLh_star_eps_tauIMH(1:20))*100, '-o','LineWidth',1.5,'color', [0.4660 0.6740 0.1880], 'MarkerSize',6,'MarkerIndices', 1:4:20);
hold on
plot((oo_.irfs.CLh_star_eps_tau_offshoringH(1:20))*100,'-^', 'LineWidth',1.5,'color', [0 0.4470 0.7410], 'MarkerSize',6,'MarkerIndices', 1:4:20)
hold on
plot((oo_.irfs.CLh_star_eps_s_DH(1:20))*100,'-x','LineWidth',1.5,'color', [0.8634  0.7406 0.1596], 'MarkerSize',6,'MarkerIndices', 1:4:20)
hold on
plot((oo_.irfs.CLh_star_eps_s_EH(1:20))*100,'-square','LineWidth',1.5,'color', [0.8555  0.1555 0.1555], 'MarkerSize',6,'MarkerIndices', 1:4:20)
title('($C^{Lh*}$)','FontSize',6,'Interpreter','latex')




subplot(4,4,16)
plot((oo_.irfs.CHh_star_eps_tauIMH(1:20)/eqlbm_ss0.hh(5))*100, '-o','LineWidth',1.5,'color', [0.4660 0.6740 0.1880], 'MarkerSize',6,'MarkerIndices', 1:4:20);
hold on
plot((oo_.irfs.CHh_star_eps_tau_offshoringH(1:20)/eqlbm_ss0.hh(5))*100,'-^', 'LineWidth',1.5,'color', [0 0.4470 0.7410], 'MarkerSize',6,'MarkerIndices', 1:4:20)
hold on
plot((oo_.irfs.CHh_star_eps_s_DH(1:20)/eqlbm_ss0.hh(5))*100,'-x','LineWidth',1.5,'color', [0.8634  0.7406 0.1596], 'MarkerSize',6,'MarkerIndices', 1:4:20)
hold on
plot((oo_.irfs.CHh_star_eps_s_EH(1:20)/eqlbm_ss0.hh(5))*100,'-square','LineWidth',1.5,'color', [0.8555  0.1555 0.1555], 'MarkerSize',6,'MarkerIndices', 1:4:20)
title('($C^{Hh*}$)','FontSize',6,'Interpreter','latex')
legend('$\tau_{IM}$ shock', '$\tau_{V}$ shock', '$s_{D}$ shock','$s_{E}$ shock','Interpreter','latex','position',[0.50 0.02 0.005 0.005], 'NumColumns', 4, 'FontSize',6)
% saveas(figure(3), [pwd '/Northshock_South_2sec1_10Sep2025.eps'],'epsc');


%%%%%%%%%%%%%

figure(4)
% Q
subplot(4,4,1)
plot((oo_.irfs.Q_eps_tauIMH(1:20)/solve(1))*100, '-o','LineWidth',1.5,'color', [0.4660 0.6740 0.1880], 'MarkerSize',6,'MarkerIndices', 1:4:20);
hold on
plot((oo_.irfs.Q_eps_tau_offshoringH(1:20)/solve(1))*100,'-^', 'LineWidth',1.5,'color', [0 0.4470 0.7410], 'MarkerSize',6,'MarkerIndices', 1:4:20)
hold on
plot((oo_.irfs.Q_eps_s_DH(1:20)/solve(1))*100,'-x','LineWidth',1.5,'color', [0.8634  0.7406 0.1596], 'MarkerSize',6,'MarkerIndices', 1:4:20)
hold on
plot((oo_.irfs.Q_eps_s_EH(1:20)/solve(1))*100,'-square','LineWidth',1.5,'color', [0.8555  0.1555 0.1555], 'MarkerSize',6,'MarkerIndices', 1:4:20)
title('($Q$)','FontSize',6,'Interpreter','latex')

% VHh_star
subplot(4,4,2)
plot((oo_.irfs.VHh_star_eps_tauIMH(1:20)/eqlbm_ss0.hh(23))*100, '-o','LineWidth',1.5,'color', [0.4660 0.6740 0.1880], 'MarkerSize',6,'MarkerIndices', 1:4:20);
hold on
plot((oo_.irfs.VHh_star_eps_tau_offshoringH(1:20)/eqlbm_ss0.hh(23))*100,'-^', 'LineWidth',1.5,'color', [0 0.4470 0.7410], 'MarkerSize',6,'MarkerIndices', 1:4:20)
hold on
plot((oo_.irfs.VHh_star_eps_s_DH(1:20)/eqlbm_ss0.hh(23))*100,'-x','LineWidth',1.5,'color', [0.8634  0.7406 0.1596], 'MarkerSize',6,'MarkerIndices', 1:4:20)
hold on
plot((oo_.irfs.VHh_star_eps_s_EH(1:20)/eqlbm_ss0.hh(23))*100,'-square','LineWidth',1.5,'color', [0.8555  0.1555 0.1555], 'MarkerSize',6,'MarkerIndices', 1:4:20)
title('($V^{Hh*}$)','FontSize',6,'Interpreter','latex')


% VHl_star
subplot(4,4,3)
plot((oo_.irfs.VHl_star_eps_tauIMH(1:20)/eqlbm_ss0.hh(24))*100, '-o','LineWidth',1.5,'color', [0.4660 0.6740 0.1880], 'MarkerSize',6,'MarkerIndices', 1:4:20);
hold on
plot((oo_.irfs.VHl_star_eps_tau_offshoringH(1:20)/eqlbm_ss0.hh(24))*100,'-^', 'LineWidth',1.5,'color', [0 0.4470 0.7410], 'MarkerSize',6,'MarkerIndices', 1:4:20)
hold on
plot((oo_.irfs.VHl_star_eps_s_DH(1:20)/eqlbm_ss0.hh(24))*100,'-x','LineWidth',1.5,'color', [0.8634  0.7406 0.1596], 'MarkerSize',6,'MarkerIndices', 1:4:20)
hold on
plot((oo_.irfs.VHl_star_eps_s_EH(1:20)/eqlbm_ss0.hh(24))*100,'-square','LineWidth',1.5,'color', [0.8555  0.1555 0.1555], 'MarkerSize',6,'MarkerIndices', 1:4:20)
title('($V^{Hl*}$)','FontSize',6,'Interpreter','latex')



% VLh_star
subplot(4,4,4)
plot((oo_.irfs.VLh_star_eps_tauIMH(1:20)/eqlbm_ss0.hh(25))*100, '-o','LineWidth',1.5,'color', [0.4660 0.6740 0.1880], 'MarkerSize',6,'MarkerIndices', 1:4:20);
hold on
plot((oo_.irfs.VLh_star_eps_tau_offshoringH(1:20)/eqlbm_ss0.hh(25))*100,'-^', 'LineWidth',1.5,'color', [0 0.4470 0.7410], 'MarkerSize',6,'MarkerIndices', 1:4:20)
hold on
plot((oo_.irfs.VLh_star_eps_s_DH(1:20)/eqlbm_ss0.hh(25))*100,'-x','LineWidth',1.5,'color', [0.8634  0.7406 0.1596], 'MarkerSize',6,'MarkerIndices', 1:4:20)
hold on
plot((oo_.irfs.VLh_star_eps_s_EH(1:20)/eqlbm_ss0.hh(25))*100,'-square','LineWidth',1.5,'color', [0.8555  0.1555 0.1555], 'MarkerSize',6,'MarkerIndices', 1:4:20)
title('($V^{Lh*}$)','FontSize',6,'Interpreter','latex')


% VLl_star
subplot(4,4,5)
plot((oo_.irfs.VLl_star_eps_tauIMH(1:20)/eqlbm_ss0.hh(26))*100, '-o','LineWidth',1.5,'color', [0.4660 0.6740 0.1880], 'MarkerSize',6,'MarkerIndices', 1:4:20);
hold on
plot((oo_.irfs.VLl_star_eps_tau_offshoringH(1:20)/eqlbm_ss0.hh(26))*100,'-^', 'LineWidth',1.5,'color', [0 0.4470 0.7410], 'MarkerSize',6,'MarkerIndices', 1:4:20)
hold on
plot((oo_.irfs.VLl_star_eps_s_DH(1:20)/eqlbm_ss0.hh(26))*100,'-x','LineWidth',1.5,'color', [0.8634  0.7406 0.1596], 'MarkerSize',6,'MarkerIndices', 1:4:20)
hold on
plot((oo_.irfs.VLl_star_eps_s_EH(1:20)/eqlbm_ss0.hh(26))*100,'-square','LineWidth',1.5,'color', [0.8555  0.1555 0.1555], 'MarkerSize',6,'MarkerIndices', 1:4:20)
title('($V^{Ll*}$)','FontSize',6,'Interpreter','latex')


% h_supplyH_star
subplot(4,4,6)
plot((oo_.irfs.h_supplyH_star_eps_tauIMH(1:20)/eqlbm_ss0.agg(19))*100, '-o','LineWidth',1.5,'color', [0.4660 0.6740 0.1880], 'MarkerSize',6,'MarkerIndices', 1:4:20);
hold on
plot((oo_.irfs.h_supplyH_star_eps_tau_offshoringH(1:20)/eqlbm_ss0.agg(19))*100,'-^', 'LineWidth',1.5,'color', [0 0.4470 0.7410], 'MarkerSize',6,'MarkerIndices', 1:4:20)
hold on
plot((oo_.irfs.h_supplyH_star_eps_s_DH(1:20)/eqlbm_ss0.agg(19))*100,'-x','LineWidth',1.5,'color', [0.8634  0.7406 0.1596], 'MarkerSize',6,'MarkerIndices', 1:4:20)
hold on
plot((oo_.irfs.h_supplyH_star_eps_s_EH(1:20)/eqlbm_ss0.agg(19))*100,'-square','LineWidth',1.5,'color', [0.8555  0.1555 0.1555], 'MarkerSize',6,'MarkerIndices', 1:4:20)
title('($H^{H*}$)','FontSize',6,'Interpreter','latex')





% h_supplyL_star
subplot(4,4,7)
plot((oo_.irfs.h_supplyL_star_eps_tauIMH(1:20)/eqlbm_ss0.agg(18))*100, '-o','LineWidth',1.5,'color', [0.4660 0.6740 0.1880], 'MarkerSize',6,'MarkerIndices', 1:4:20);
hold on
plot((oo_.irfs.h_supplyL_star_eps_tau_offshoringH(1:20)/eqlbm_ss0.agg(18))*100,'-^', 'LineWidth',1.5,'color', [0 0.4470 0.7410], 'MarkerSize',6,'MarkerIndices', 1:4:20)
hold on
plot((oo_.irfs.h_supplyL_star_eps_s_DH(1:20)/eqlbm_ss0.agg(18))*100,'-x','LineWidth',1.5,'color', [0.8634  0.7406 0.1596], 'MarkerSize',6,'MarkerIndices', 1:4:20)
hold on
plot((oo_.irfs.h_supplyL_star_eps_s_EH(1:20)/eqlbm_ss0.agg(18))*100,'-square','LineWidth',1.5,'color', [0.8555  0.1555 0.1555], 'MarkerSize',6,'MarkerIndices', 1:4:20)
title('($H^{L*}$)','FontSize',6,'Interpreter','latex')





% l_supplyH_star
subplot(4,4,8)
plot((oo_.irfs.l_supplyH_star_eps_tauIMH(1:20)/eqlbm_ss0.agg(8))*100, '-o','LineWidth',1.5,'color', [0.4660 0.6740 0.1880], 'MarkerSize',6,'MarkerIndices', 1:4:20);
hold on
plot((oo_.irfs.l_supplyH_star_eps_tau_offshoringH(1:20)/eqlbm_ss0.agg(8))*100,'-^', 'LineWidth',1.5,'color', [0 0.4470 0.7410], 'MarkerSize',6,'MarkerIndices', 1:4:20)
hold on
plot((oo_.irfs.l_supplyH_star_eps_s_DH(1:20)/eqlbm_ss0.agg(8))*100,'-x','LineWidth',1.5,'color', [0.8634  0.7406 0.1596], 'MarkerSize',6,'MarkerIndices', 1:4:20)
hold on
plot((oo_.irfs.l_supplyH_star_eps_s_EH(1:20)/eqlbm_ss0.agg(8))*100,'-square','LineWidth',1.5,'color', [0.8555  0.1555 0.1555], 'MarkerSize',6,'MarkerIndices', 1:4:20)
title('($L^{H*}$)','FontSize',6,'Interpreter','latex')






% l_supplyL_star
subplot(4,4,9)
plot((oo_.irfs.l_supplyL_star_eps_tauIMH(1:20)/eqlbm_ss0.agg(7))*100, '-o','LineWidth',1.5,'color', [0.4660 0.6740 0.1880], 'MarkerSize',6,'MarkerIndices', 1:4:20);
hold on
plot((oo_.irfs.l_supplyL_star_eps_tau_offshoringH(1:20)/eqlbm_ss0.agg(7))*100,'-^', 'LineWidth',1.5,'color', [0 0.4470 0.7410], 'MarkerSize',6,'MarkerIndices', 1:4:20)
hold on
plot((oo_.irfs.l_supplyL_star_eps_s_DH(1:20)/eqlbm_ss0.agg(7))*100,'-x','LineWidth',1.5,'color', [0.8634  0.7406 0.1596], 'MarkerSize',6,'MarkerIndices', 1:4:20)
hold on
plot((oo_.irfs.l_supplyL_star_eps_s_EH(1:20)/eqlbm_ss0.agg(7))*100,'-square','LineWidth',1.5,'color', [0.8555  0.1555 0.1555], 'MarkerSize',6,'MarkerIndices', 1:4:20)
title('($L^{L*}$)','FontSize',6,'Interpreter','latex')

% 
% % h_supplyH_star
% subplot(4,4,6)
% plot([0,oo_.irfs.h_supplyH_star_eps_tauIMH(1:19)/eqlbm_ss0.agg(19)]*100, '-o','LineWidth',1.5,'color', [0.4660 0.6740 0.1880], 'MarkerSize',6,'MarkerIndices', 1:4:20);
% hold on
% plot([0,oo_.irfs.h_supplyH_star_eps_tau_offshoringH(1:19)/eqlbm_ss0.agg(19)]*100,'-^', 'LineWidth',1.5,'color', [0 0.4470 0.7410], 'MarkerSize',6,'MarkerIndices', 1:4:20)
% hold on
% plot([0,oo_.irfs.h_supplyH_star_eps_s_DH(1:19)/eqlbm_ss0.agg(19)]*100,'-x','LineWidth',1.5,'color', [0.8634  0.7406 0.1596], 'MarkerSize',6,'MarkerIndices', 1:4:20)
% hold on
% plot([0,oo_.irfs.h_supplyH_star_eps_s_EH(1:19)/eqlbm_ss0.agg(19)]*100,'-square','LineWidth',1.5,'color', [0.8555  0.1555 0.1555], 'MarkerSize',6,'MarkerIndices', 1:4:20)
% title('($H^{H*}$)','FontSize',6,'Interpreter','latex')
% 
% 
% 
% 
% 
% % h_supplyL_star
% subplot(4,4,7)
% plot([0,oo_.irfs.h_supplyL_star_eps_tauIMH(1:19)/eqlbm_ss0.agg(18)]*100, '-o','LineWidth',1.5,'color', [0.4660 0.6740 0.1880], 'MarkerSize',6,'MarkerIndices', 1:4:20);
% hold on
% plot([0,oo_.irfs.h_supplyL_star_eps_tau_offshoringH(1:19)/eqlbm_ss0.agg(18)]*100,'-^', 'LineWidth',1.5,'color', [0 0.4470 0.7410], 'MarkerSize',6,'MarkerIndices', 1:4:20)
% hold on
% plot([0,oo_.irfs.h_supplyL_star_eps_s_DH(1:19)/eqlbm_ss0.agg(18)]*100,'-x','LineWidth',1.5,'color', [0.8634  0.7406 0.1596], 'MarkerSize',6,'MarkerIndices', 1:4:20)
% hold on
% plot([0,oo_.irfs.h_supplyL_star_eps_s_EH(1:19)/eqlbm_ss0.agg(18)]*100,'-square','LineWidth',1.5,'color', [0.8555  0.1555 0.1555], 'MarkerSize',6,'MarkerIndices', 1:4:20)
% title('($H^{L*}$)','FontSize',6,'Interpreter','latex')
% 
% 
% 
% 
% 
% % l_supplyH_star
% subplot(4,4,8)
% plot([0,oo_.irfs.l_supplyH_star_eps_tauIMH(1:19)/eqlbm_ss0.agg(8)]*100, '-o','LineWidth',1.5,'color', [0.4660 0.6740 0.1880], 'MarkerSize',6,'MarkerIndices', 1:4:20);
% hold on
% plot([0,oo_.irfs.l_supplyH_star_eps_tau_offshoringH(1:19)/eqlbm_ss0.agg(8)]*100,'-^', 'LineWidth',1.5,'color', [0 0.4470 0.7410], 'MarkerSize',6,'MarkerIndices', 1:4:20)
% hold on
% plot([0,oo_.irfs.l_supplyH_star_eps_s_DH(1:19)/eqlbm_ss0.agg(8)]*100,'-x','LineWidth',1.5,'color', [0.8634  0.7406 0.1596], 'MarkerSize',6,'MarkerIndices', 1:4:20)
% hold on
% plot([0,oo_.irfs.l_supplyH_star_eps_s_EH(1:19)/eqlbm_ss0.agg(8)]*100,'-square','LineWidth',1.5,'color', [0.8555  0.1555 0.1555], 'MarkerSize',6,'MarkerIndices', 1:4:20)
% title('($L^{H*}$)','FontSize',6,'Interpreter','latex')
% 
% 
% 
% 
% 
% 
% % l_supplyL_star
% subplot(4,4,9)
% plot([0,oo_.irfs.l_supplyL_star_eps_tauIMH(1:19)/eqlbm_ss0.agg(7)]*100, '-o','LineWidth',1.5,'color', [0.4660 0.6740 0.1880], 'MarkerSize',6,'MarkerIndices', 1:4:20);
% hold on
% plot([0,oo_.irfs.l_supplyL_star_eps_tau_offshoringH(1:19)/eqlbm_ss0.agg(7)]*100,'-^', 'LineWidth',1.5,'color', [0 0.4470 0.7410], 'MarkerSize',6,'MarkerIndices', 1:4:20)
% hold on
% plot([0,oo_.irfs.l_supplyL_star_eps_s_DH(1:19)/eqlbm_ss0.agg(7)]*100,'-x','LineWidth',1.5,'color', [0.8634  0.7406 0.1596], 'MarkerSize',6,'MarkerIndices', 1:4:20)
% hold on
% plot([0,oo_.irfs.l_supplyL_star_eps_s_EH(1:19)/eqlbm_ss0.agg(7)]*100,'-square','LineWidth',1.5,'color', [0.8555  0.1555 0.1555], 'MarkerSize',6,'MarkerIndices', 1:4:20)
% title('($L^{L*}$)','FontSize',6,'Interpreter','latex')
% 


% psiH_star
subplot(4,4,10)
plot((oo_.irfs.psiH_star_eps_tauIMH(1:20)/eqlbm_ss0.psiH_star_fixed)*100, '-o','LineWidth',1.5,'color', [0.4660 0.6740 0.1880], 'MarkerSize',6,'MarkerIndices', 1:4:20);
hold on
plot((oo_.irfs.psiH_star_eps_tau_offshoringH(1:20)/eqlbm_ss0.psiH_star_fixed)*100,'-^', 'LineWidth',1.5,'color', [0 0.4470 0.7410], 'MarkerSize',6,'MarkerIndices', 1:4:20)
hold on
plot((oo_.irfs.psiH_star_eps_s_DH(1:20)/eqlbm_ss0.psiH_star_fixed)*100,'-x','LineWidth',1.5,'color', [0.8634  0.7406 0.1596], 'MarkerSize',6,'MarkerIndices', 1:4:20)
hold on
plot((oo_.irfs.psiH_star_eps_s_EH(1:20)/eqlbm_ss0.psiH_star_fixed)*100,'-square','LineWidth',1.5,'color', [0.8555  0.1555 0.1555], 'MarkerSize',6,'MarkerIndices', 1:4:20)
title('($\psi^{H*}$)','FontSize',6,'Interpreter','latex')




% psiL_star
subplot(4,4,11)
plot((oo_.irfs.psiL_star_eps_tauIMH(1:20)/eqlbm_ss0.psiL_star_fixed)*100, '-o','LineWidth',1.5,'color', [0.4660 0.6740 0.1880], 'MarkerSize',6,'MarkerIndices', 1:4:20);
hold on
plot((oo_.irfs.psiL_star_eps_tau_offshoringH(1:20)/eqlbm_ss0.psiL_star_fixed)*100,'-^', 'LineWidth',1.5,'color', [0 0.4470 0.7410], 'MarkerSize',6,'MarkerIndices', 1:4:20)
hold on
plot((oo_.irfs.psiL_star_eps_s_DH(1:20)/eqlbm_ss0.psiL_star_fixed)*100,'-x','LineWidth',1.5,'color', [0.8634  0.7406 0.1596], 'MarkerSize',6,'MarkerIndices', 1:4:20)
hold on
plot((oo_.irfs.psiL_star_eps_s_EH(1:20)/eqlbm_ss0.psiL_star_fixed)*100,'-square','LineWidth',1.5,'color', [0.8555  0.1555 0.1555], 'MarkerSize',6,'MarkerIndices', 1:4:20)
title('($\psi^{L*}$)','FontSize',6,'Interpreter','latex')



% HhE_supply_star
subplot(4,4,12)
plot((oo_.irfs.HhE_supply_star_eps_tauIMH(1:20)/eqlbm_ss0.hh(31))*100, '-o','LineWidth',1.5,'color', [0.4660 0.6740 0.1880], 'MarkerSize',6,'MarkerIndices', 1:4:20);
hold on
plot((oo_.irfs.HhE_supply_star_eps_tau_offshoringH(1:20)/eqlbm_ss0.hh(31))*100,'-^', 'LineWidth',1.5,'color', [0 0.4470 0.7410], 'MarkerSize',6,'MarkerIndices', 1:4:20)
hold on
plot((oo_.irfs.HhE_supply_star_eps_s_DH(1:20)/eqlbm_ss0.hh(31))*100,'-x','LineWidth',1.5,'color', [0.8634  0.7406 0.1596], 'MarkerSize',6,'MarkerIndices', 1:4:20)
hold on
plot((oo_.irfs.HhE_supply_star_eps_s_EH(1:20)/eqlbm_ss0.hh(31))*100,'-square','LineWidth',1.5,'color', [0.8555  0.1555 0.1555], 'MarkerSize',6,'MarkerIndices', 1:4:20)
title('($H^{H*}_{E}$)','FontSize',6,'Interpreter','latex')



% HlE_supply_star
subplot(4,4,13)
plot((oo_.irfs.HlE_supply_star_eps_tauIMH(1:20)/eqlbm_ss0.hh(32))*100, '-o','LineWidth',1.5,'color', [0.4660 0.6740 0.1880], 'MarkerSize',6,'MarkerIndices', 1:4:20);
hold on
plot((oo_.irfs.HlE_supply_star_eps_tau_offshoringH(1:20)/eqlbm_ss0.hh(32))*100,'-^', 'LineWidth',1.5,'color', [0 0.4470 0.7410], 'MarkerSize',6,'MarkerIndices', 1:4:20)
hold on
plot((oo_.irfs.HlE_supply_star_eps_s_DH(1:20)/eqlbm_ss0.hh(32))*100,'-x','LineWidth',1.5,'color', [0.8634  0.7406 0.1596], 'MarkerSize',6,'MarkerIndices', 1:4:20)
hold on
plot((oo_.irfs.HlE_supply_star_eps_s_EH(1:20)/eqlbm_ss0.hh(32))*100,'-square','LineWidth',1.5,'color', [0.8555  0.1555 0.1555], 'MarkerSize',6,'MarkerIndices', 1:4:20)
title('($H^{L*}_{E}$)','FontSize',6,'Interpreter','latex')


% LhE_supply_star
subplot(4,4,14)
plot((oo_.irfs.LhE_supply_star_eps_tauIMH(1:20)/eqlbm_ss0.hh(33))*100, '-o','LineWidth',1.5,'color', [0.4660 0.6740 0.1880], 'MarkerSize',6,'MarkerIndices', 1:4:20);
hold on
plot((oo_.irfs.LhE_supply_star_eps_tau_offshoringH(1:20)/eqlbm_ss0.hh(33))*100,'-^', 'LineWidth',1.5,'color', [0 0.4470 0.7410], 'MarkerSize',6,'MarkerIndices', 1:4:20)
hold on
plot((oo_.irfs.LhE_supply_star_eps_s_DH(1:20)/eqlbm_ss0.hh(33))*100,'-x','LineWidth',1.5,'color', [0.8634  0.7406 0.1596], 'MarkerSize',6,'MarkerIndices', 1:4:20)
hold on
plot((oo_.irfs.LhE_supply_star_eps_s_EH(1:20)/eqlbm_ss0.hh(33))*100,'-square','LineWidth',1.5,'color', [0.8555  0.1555 0.1555], 'MarkerSize',6,'MarkerIndices', 1:4:20)
title('($L^{H*}_{E}$)','FontSize',6,'Interpreter','latex')


% LlE_supply
subplot(4,4,15)
plot((oo_.irfs.LlE_supply_star_eps_tauIMH(1:20)/eqlbm_ss0.hh(34))*100, '-o','LineWidth',1.5,'color', [0.4660 0.6740 0.1880], 'MarkerSize',6,'MarkerIndices', 1:4:20);
hold on
plot((oo_.irfs.LlE_supply_star_eps_tau_offshoringH(1:20)/eqlbm_ss0.hh(34))*100,'-^', 'LineWidth',1.5,'color', [0 0.4470 0.7410], 'MarkerSize',6,'MarkerIndices', 1:4:20)
hold on
plot((oo_.irfs.LlE_supply_star_eps_s_DH(1:20)/eqlbm_ss0.hh(34))*100,'-x','LineWidth',1.5,'color', [0.8634  0.7406 0.1596], 'MarkerSize',6,'MarkerIndices', 1:4:20)
hold on
plot((oo_.irfs.LlE_supply_star_eps_s_EH(1:20)/eqlbm_ss0.hh(34))*100,'-square','LineWidth',1.5,'color', [0.8555  0.1555 0.1555], 'MarkerSize',6,'MarkerIndices', 1:4:20)
title('($L^{L*}_{E}$)','FontSize',6,'Interpreter','latex')



% ToTL
subplot(4,4,16)
plot(ToTL_eps_tauIMH(1:20)/ToTH_SS*100, '-o','LineWidth',1.5,'color', [0.4660 0.6740 0.1880], 'MarkerSize',6,'MarkerIndices', 1:4:20);
hold on
plot(ToTL_eps_tau_offshoringH(1:20)/ToTH_SS*100,'-^', 'LineWidth',1.5,'color', [0 0.4470 0.7410], 'MarkerSize',6,'MarkerIndices', 1:4:20)
hold on
plot(ToTL_eps_s_DH(1:20)/ToTH_SS*100,'-x','LineWidth',1.5,'color', [0.8634  0.7406 0.1596], 'MarkerSize',6,'MarkerIndices', 1:4:20)
hold on
plot(ToTL_eps_s_EH(1:20)/ToTH_SS*100,'-square','LineWidth',1.5,'color', [0.8555  0.1555 0.1555], 'MarkerSize',6,'MarkerIndices', 1:4:20)
title('($ToT^{L}$)','FontSize',6,'Interpreter','latex')


legend('$\tau_{IM}$ shock', '$\tau_{V}$ shock', '$s_{D}$ shock','$s_{E}$ shock','Interpreter','latex','position',[0.50 0.02 0.005 0.005], 'NumColumns', 4, 'FontSize',6)
% saveas(figure(4), [pwd '/Northshock_South_2sec2_10Sep2025.eps'],'epsc');



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(5)
% VAH
subplot(3,4,1)
plot((oo_.irfs.VAH_eps_tauIMH(1:20)/(eqlbm_ss0.agg(26) - eqlbm_ss0.agg(21) + eqlbm_ss0.masses(10)*eqlbm_ss0.ent_value(2)))*100, '-o','LineWidth',1.5,'color', [0.4660 0.6740 0.1880], 'MarkerSize',6,'MarkerIndices', 1:4:20);
hold on
plot((oo_.irfs.VAH_eps_tau_offshoringH(1:20)/(eqlbm_ss0.agg(26) - eqlbm_ss0.agg(21) + eqlbm_ss0.masses(10)*eqlbm_ss0.ent_value(2)))*100,'-^', 'LineWidth',1.5,'color', [0 0.4470 0.7410], 'MarkerSize',6,'MarkerIndices', 1:4:20)
hold on
plot((oo_.irfs.VAH_eps_s_DH(1:20)/(eqlbm_ss0.agg(26) - eqlbm_ss0.agg(21) + eqlbm_ss0.masses(10)*eqlbm_ss0.ent_value(2)))*100,'-x','LineWidth',1.5,'color', [0.8634  0.7406 0.1596], 'MarkerSize',6,'MarkerIndices', 1:4:20)
hold on
plot((oo_.irfs.VAH_eps_s_EH(1:20)/(eqlbm_ss0.agg(26) - eqlbm_ss0.agg(21) + eqlbm_ss0.masses(10)*eqlbm_ss0.ent_value(2)))*100,'-square','LineWidth',1.5,'color', [0.8555  0.1555 0.1555], 'MarkerSize',6,'MarkerIndices', 1:4:20)
title('($VA^{H}$)','FontSize',6,'Interpreter','latex')

% VAL
subplot(3,4,2)
plot((oo_.irfs.VAL_eps_tauIMH(1:20)/(eqlbm_ss0.agg(27) - eqlbm_ss0.agg(20) + eqlbm_ss0.masses(9)*eqlbm_ss0.ent_value(1)))*100, '-o','LineWidth',1.5,'color', [0.4660 0.6740 0.1880], 'MarkerSize',6,'MarkerIndices', 1:4:20);
hold on
plot((oo_.irfs.VAL_eps_tau_offshoringH(1:20)/(eqlbm_ss0.agg(27) - eqlbm_ss0.agg(20) + eqlbm_ss0.masses(9)*eqlbm_ss0.ent_value(1)))*100,'-^', 'LineWidth',1.5,'color', [0 0.4470 0.7410], 'MarkerSize',6,'MarkerIndices', 1:4:20)
hold on
plot((oo_.irfs.VAL_eps_s_DH(1:20)/(eqlbm_ss0.agg(27) - eqlbm_ss0.agg(20) + eqlbm_ss0.masses(9)*eqlbm_ss0.ent_value(1)))*100,'-x','LineWidth',1.5,'color', [0.8634  0.7406 0.1596], 'MarkerSize',6,'MarkerIndices', 1:4:20)
hold on
plot((oo_.irfs.VAL_eps_s_EH(1:20)/(eqlbm_ss0.agg(27) - eqlbm_ss0.agg(20) + eqlbm_ss0.masses(9)*eqlbm_ss0.ent_value(1)))*100,'-square','LineWidth',1.5,'color', [0.8555  0.1555 0.1555], 'MarkerSize',6,'MarkerIndices', 1:4:20)
title('($VA^{L}$)','FontSize',6,'Interpreter','latex')


% VAH_star
subplot(3,4,3)
plot((oo_.irfs.VAH_star_eps_tauIMH(1:20)/eqlbm_ss0.agg(28) + eqlbm_ss0.agg(21) + eqlbm_ss0.masses(20)*eqlbm_ss0.ent_value(4))*100, '-o','LineWidth',1.5,'color', [0.4660 0.6740 0.1880], 'MarkerSize',6,'MarkerIndices', 1:4:20);
hold on
plot((oo_.irfs.VAH_star_eps_tau_offshoringH(1:20)/eqlbm_ss0.agg(28) + eqlbm_ss0.agg(21) + eqlbm_ss0.masses(20)*eqlbm_ss0.ent_value(4))*100,'-^', 'LineWidth',1.5,'color', [0 0.4470 0.7410], 'MarkerSize',6,'MarkerIndices', 1:4:20)
hold on
plot((oo_.irfs.VAH_star_eps_s_DH(1:20)/eqlbm_ss0.agg(28) + eqlbm_ss0.agg(21) + eqlbm_ss0.masses(20)*eqlbm_ss0.ent_value(4))*100,'-x','LineWidth',1.5,'color', [0.8634  0.7406 0.1596], 'MarkerSize',6,'MarkerIndices', 1:4:20)
hold on
plot((oo_.irfs.VAH_star_eps_s_EH(1:20)/eqlbm_ss0.agg(28) + eqlbm_ss0.agg(21) + eqlbm_ss0.masses(20)*eqlbm_ss0.ent_value(4))*100,'-square','LineWidth',1.5,'color', [0.8555  0.1555 0.1555], 'MarkerSize',6,'MarkerIndices', 1:4:20)
title('($VA^{H*}$)','FontSize',6,'Interpreter','latex')



% VAL_star
subplot(3,4,4)
plot((oo_.irfs.VAL_star_eps_tauIMH(1:20)/eqlbm_ss0.agg(29) + eqlbm_ss0.agg(20) + eqlbm_ss0.masses(19)*eqlbm_ss0.ent_value(3))*100, '-o','LineWidth',1.5,'color', [0.4660 0.6740 0.1880], 'MarkerSize',6,'MarkerIndices', 1:4:20);
hold on
plot((oo_.irfs.VAL_star_eps_tau_offshoringH(1:20)/eqlbm_ss0.agg(29) + eqlbm_ss0.agg(20) + eqlbm_ss0.masses(19)*eqlbm_ss0.ent_value(3))*100,'-^', 'LineWidth',1.5,'color', [0 0.4470 0.7410], 'MarkerSize',6,'MarkerIndices', 1:4:20)
hold on
plot((oo_.irfs.VAL_star_eps_s_DH(1:20)/eqlbm_ss0.agg(29) + eqlbm_ss0.agg(20) + eqlbm_ss0.masses(19)*eqlbm_ss0.ent_value(3))*100,'-x','LineWidth',1.5,'color', [0.8634  0.7406 0.1596], 'MarkerSize',6,'MarkerIndices', 1:4:20)
hold on
plot((oo_.irfs.VAL_star_eps_s_EH(1:20)/eqlbm_ss0.agg(29) + eqlbm_ss0.agg(20) + eqlbm_ss0.masses(19)*eqlbm_ss0.ent_value(3))*100,'-square','LineWidth',1.5,'color', [0.8555  0.1555 0.1555], 'MarkerSize',6,'MarkerIndices', 1:4:20)
title('($VA^{L*}$)','FontSize',6,'Interpreter','latex')


% YH
subplot(3,4,5)
plot((oo_.irfs.YH_eps_tauIMH(1:20)/eqlbm_ss0.agg(26))*100, '-o','LineWidth',1.5,'color', [0.4660 0.6740 0.1880], 'MarkerSize',6,'MarkerIndices', 1:4:20);
hold on
plot((oo_.irfs.YH_eps_tau_offshoringH(1:20)/eqlbm_ss0.agg(26))*100,'-^', 'LineWidth',1.5,'color', [0 0.4470 0.7410], 'MarkerSize',6,'MarkerIndices', 1:4:20)
hold on
plot((oo_.irfs.YH_eps_s_DH(1:20)/eqlbm_ss0.agg(26))*100,'-x','LineWidth',1.5,'color', [0.8634  0.7406 0.1596], 'MarkerSize',6,'MarkerIndices', 1:4:20)
hold on
plot((oo_.irfs.YH_eps_s_EH(1:20)/eqlbm_ss0.agg(26))*100,'-square','LineWidth',1.5,'color', [0.8555  0.1555 0.1555], 'MarkerSize',6,'MarkerIndices', 1:4:20)
title('($Y^{H}$)','FontSize',6,'Interpreter','latex')


% YL
subplot(3,4,6)
plot((oo_.irfs.YL_eps_tauIMH(1:20)/eqlbm_ss0.agg(27))*100, '-o','LineWidth',1.5,'color', [0.4660 0.6740 0.1880], 'MarkerSize',6,'MarkerIndices', 1:4:20);
hold on
plot((oo_.irfs.YL_eps_tau_offshoringH(1:20)/eqlbm_ss0.agg(27))*100,'-^', 'LineWidth',1.5,'color', [0 0.4470 0.7410], 'MarkerSize',6,'MarkerIndices', 1:4:20)
hold on
plot((oo_.irfs.YL_eps_s_DH(1:20)/eqlbm_ss0.agg(27))*100,'-x','LineWidth',1.5,'color', [0.8634  0.7406 0.1596], 'MarkerSize',6,'MarkerIndices', 1:4:20)
hold on
plot((oo_.irfs.YL_eps_s_EH(1:20)/eqlbm_ss0.agg(27))*100,'-square','LineWidth',1.5,'color', [0.8555  0.1555 0.1555], 'MarkerSize',6,'MarkerIndices', 1:4:20)
title('($Y^{L}$)','FontSize',6,'Interpreter','latex')





% YH_star
subplot(3,4,7)
plot((oo_.irfs.YH_star_eps_tauIMH(1:20)/eqlbm_ss0.agg(28))*100, '-o','LineWidth',1.5,'color', [0.4660 0.6740 0.1880], 'MarkerSize',6,'MarkerIndices', 1:4:20);
hold on
plot((oo_.irfs.YH_star_eps_tau_offshoringH(1:20)/eqlbm_ss0.agg(28))*100,'-^', 'LineWidth',1.5,'color', [0 0.4470 0.7410], 'MarkerSize',6,'MarkerIndices', 1:4:20)
hold on
plot((oo_.irfs.YH_star_eps_s_DH(1:20)/eqlbm_ss0.agg(28))*100,'-x','LineWidth',1.5,'color', [0.8634  0.7406 0.1596], 'MarkerSize',6,'MarkerIndices', 1:4:20)
hold on
plot((oo_.irfs.YH_star_eps_s_EH(1:20)/eqlbm_ss0.agg(28))*100,'-square','LineWidth',1.5,'color', [0.8555  0.1555 0.1555], 'MarkerSize',6,'MarkerIndices', 1:4:20)
title('($Y^{H*}$)','FontSize',6,'Interpreter','latex')






% YL_star
subplot(3,4,8)
plot((oo_.irfs.YL_star_eps_tauIMH(1:20)/eqlbm_ss0.agg(29))*100, '-o','LineWidth',1.5,'color', [0.4660 0.6740 0.1880], 'MarkerSize',6,'MarkerIndices', 1:4:20);
hold on
plot((oo_.irfs.YL_star_eps_tau_offshoringH(1:20)/eqlbm_ss0.agg(29))*100,'-^', 'LineWidth',1.5,'color', [0 0.4470 0.7410], 'MarkerSize',6,'MarkerIndices', 1:4:20)
hold on
plot((oo_.irfs.YL_star_eps_s_DH(1:20)/eqlbm_ss0.agg(29))*100,'-x','LineWidth',1.5,'color', [0.8634  0.7406 0.1596], 'MarkerSize',6,'MarkerIndices', 1:4:20)
hold on
plot((oo_.irfs.YL_star_eps_s_EH(1:20)/eqlbm_ss0.agg(29))*100,'-square','LineWidth',1.5,'color', [0.8555  0.1555 0.1555], 'MarkerSize',6,'MarkerIndices', 1:4:20)
title('($Y^{L*}$)','FontSize',6,'Interpreter','latex')





% wtil
subplot(3,4,9)
plot((oo_.irfs.wtil_eps_tauIMH(1:20)/eqlbm_ss0.agg(30))*100, '-o','LineWidth',1.5,'color', [0.4660 0.6740 0.1880], 'MarkerSize',6,'MarkerIndices', 1:4:20);
hold on
plot((oo_.irfs.wtil_eps_tau_offshoringH(1:20)/eqlbm_ss0.agg(30))*100,'-^', 'LineWidth',1.5,'color', [0 0.4470 0.7410], 'MarkerSize',6,'MarkerIndices', 1:4:20)
hold on
plot((oo_.irfs.wtil_eps_s_DH(1:20)/eqlbm_ss0.agg(30))*100,'-x','LineWidth',1.5,'color', [0.8634  0.7406 0.1596], 'MarkerSize',6,'MarkerIndices', 1:4:20)
hold on
plot((oo_.irfs.wtil_eps_s_EH(1:20)/eqlbm_ss0.agg(30))*100,'-square','LineWidth',1.5,'color', [0.8555  0.1555 0.1555], 'MarkerSize',6,'MarkerIndices', 1:4:20)
title('($\tilde{w}$)','FontSize',6,'Interpreter','latex')



% wtil_star
subplot(3,4,10)
plot((oo_.irfs.wtil_star_eps_tauIMH(1:20)/eqlbm_ss0.agg(31))*100, '-o','LineWidth',1.5,'color', [0.4660 0.6740 0.1880], 'MarkerSize',6,'MarkerIndices', 1:4:20);
hold on
plot((oo_.irfs.wtil_star_eps_tau_offshoringH(1:20)/eqlbm_ss0.agg(31))*100,'-^', 'LineWidth',1.5,'color', [0 0.4470 0.7410], 'MarkerSize',6,'MarkerIndices', 1:4:20)
hold on
plot((oo_.irfs.wtil_star_eps_s_DH(1:20)/eqlbm_ss0.agg(31))*100,'-x','LineWidth',1.5,'color', [0.8634  0.7406 0.1596], 'MarkerSize',6,'MarkerIndices', 1:4:20)
hold on
plot((oo_.irfs.wtil_star_eps_s_EH(1:20)/eqlbm_ss0.agg(31))*100,'-square','LineWidth',1.5,'color', [0.8555  0.1555 0.1555], 'MarkerSize',6,'MarkerIndices', 1:4:20)
title('($\tilde{w}^{*}$)','FontSize',6,'Interpreter','latex')



% gini
subplot(3,4,11)
plot((oo_.irfs.gini_eps_tauIMH(1:20)/eqlbm_ss0.agg(32))*100, '-o','LineWidth',1.5,'color', [0.4660 0.6740 0.1880], 'MarkerSize',6,'MarkerIndices', 1:4:20);
hold on
plot((oo_.irfs.gini_eps_tau_offshoringH(1:20)/eqlbm_ss0.agg(32))*100,'-^', 'LineWidth',1.5,'color', [0 0.4470 0.7410], 'MarkerSize',6,'MarkerIndices', 1:4:20)
hold on
plot((oo_.irfs.gini_eps_s_DH(1:20)/eqlbm_ss0.agg(32))*100,'-x','LineWidth',1.5,'color', [0.8634  0.7406 0.1596], 'MarkerSize',6,'MarkerIndices', 1:4:20)
hold on
plot((oo_.irfs.gini_eps_s_EH(1:20)/eqlbm_ss0.agg(32))*100,'-square','LineWidth',1.5,'color', [0.8555  0.1555 0.1555], 'MarkerSize',6,'MarkerIndices', 1:4:20)
title('($gini$)','FontSize',6,'Interpreter','latex')





% gini_star
subplot(3,4,12)
plot((oo_.irfs.gini_star_eps_tauIMH(1:20)/eqlbm_ss0.agg(33))*100, '-o','LineWidth',1.5,'color', [0.4660 0.6740 0.1880], 'MarkerSize',6,'MarkerIndices', 1:4:20);
hold on
plot((oo_.irfs.gini_star_eps_tau_offshoringH(1:20)/eqlbm_ss0.agg(33))*100,'-^', 'LineWidth',1.5,'color', [0 0.4470 0.7410], 'MarkerSize',6,'MarkerIndices', 1:4:20)
hold on
plot((oo_.irfs.gini_star_eps_s_DH(1:20)/eqlbm_ss0.agg(33))*100,'-x','LineWidth',1.5,'color', [0.8634  0.7406 0.1596], 'MarkerSize',6,'MarkerIndices', 1:4:20)
hold on
plot((oo_.irfs.gini_star_eps_s_EH(1:20)/eqlbm_ss0.agg(33))*100,'-square','LineWidth',1.5,'color', [0.8555  0.1555 0.1555], 'MarkerSize',6,'MarkerIndices', 1:4:20)
title('($gini^{*}$)','FontSize',6,'Interpreter','latex')



legend('$\tau_{IM}$ shock', '$\tau_{V}$ shock', '$s_{D}$ shock','$s_{E}$ shock','Interpreter','latex','position',[0.50 0.02 0.005 0.005], 'NumColumns', 4, 'FontSize',6)
% saveas(figure(5), [pwd '/Northshock_additional_10Sep2025.eps'],'epsc');
