function [residual, g1] = dynamic_resid_g1(T, y, x, params, steady_state, it_, T_flag)
% function [residual, g1] = dynamic_resid_g1(T, y, x, params, steady_state, it_, T_flag)
%
% Wrapper function automatically created by Dynare
%

    if T_flag
        T = DSW_2Sector_10Jun2026.dynamic_g1_tt(T, y, x, params, steady_state, it_);
    end
    residual = DSW_2Sector_10Jun2026.dynamic_resid(T, y, x, params, steady_state, it_, false);
    g1       = DSW_2Sector_10Jun2026.dynamic_g1(T, y, x, params, steady_state, it_, false);

end
