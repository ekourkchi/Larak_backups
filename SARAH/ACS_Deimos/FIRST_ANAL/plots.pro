plot_phenomenon, 'mag_aabs.ps', 1,12,"mag [F814W]","Asymmetry Parameter A!Dabs!N"

plot_phenomenon, 'aabs_concentration.ps', 12,17,"Asymmetry Parameter (A!Dabs!N)","Concentration"

plot_phenomenon, 'aabs_dfp.ps', 12,6,"Asymmetry Parameter (A!Dabs!N)","Diastance from FP"

plot_phenomenon, 'aabs_sig.ps', 12,4,"Asymmetry Parameter (A!Dabs!N)","Log!D10!N(!7r!X) [km/s]"

plot_phenomenon, 'aabs_rabs.ps', 12,14,"Asymmetry Parameter (A!Dabs!N)","Galfit Residual (R!Dabs!N)"

;;;;;;;;;;;;;;;;
plot_phenomenon, 'mag_rabs.ps', 1,14,"Mag [F814W]","Galfit Residual (R!Dabs!N)", 35

plot_phenomenon, 'mag_chi2.ps', 1,10,"Mag [F814W]","Galfit Residual (!7v!X!U2!N)", 35

plot_phenomenon, 'ellipticity_dfp.ps', 22,6,"Ellipticity (b/a)","Diastance from FP", 0

plot_phenomenon, 'concentration_sig.ps', 17,4,"Concentration","Log!D10!N(!7r!X) [km/s]", 0

plot_phenomenon, 'mag_concentration.ps', 1,17,"Mag [F814W]","Concentration", 35

plot_phenomenon, 'n_dfp.ps', 5,6,"Log!D10!N(n) - [Sersic Index]","Diastance from FP", 0

plot_phenomenon, 'mag_mue.ps', 1,2,"Mag [F814W]","<!7l!X!De!N> [mag/arcsec!U2!N]", 35

plot_phenomenon, 'mag_dfp.ps', 1,6,"Mag [F814W]","Diastance from FP", 35

plot_phenomenon, 'FPmue_mue.ps', 1,2, "log(Re)-4.59*log(!7r!X)+27.11", "<!7l!X!De!N> [mag/arcsec!U2!N]", 0

plot_phenomenon, 'n_sig.ps', 5,4,"Log!D10!N(n) [Sersic index]","Log!D10!N(!7r!X) [km/s]", 0

plot_phenomenon, 're_mue.ps', 3,2,"Log!D10!N(R!De!N) [kpc]","<!7l!X!De!N> [mag/arcsec!U2!N]", .39794001


plot_phenomenon_multi, 'my_kormendy.ps'

plot_phenomenon, 'concentration_dfp.ps', 1,6,"Concentration","Diastance from FP", 0
plot_phenomenon_bin, 'concentration_dfp_bined.ps', 17,6,"Concentration","Diastance from FP", 0

plot_phenomenon_bin, 'logn_dfp_bined.ps', 5,6,"Log!D10!N(n) - [Sersic Index]","Diastance from FP", 0

plot_phenomenon_bin, 'mag_dfp_bined.ps', 1,6,"Mag [F814W]","Diastance from FP", 35


IDL> plot_phenomenon_cor, 1, 6, 35
Correlation(1,6)=      0.53564766
IDL> plot_phenomenon_cor, 5, 6, 0
Correlation(5,6)=     -0.48589476
IDL> plot_phenomenon_cor, 17, 6, 0
Correlation(17,6)=     -0.49390060

plot_phenomenon, 'logn_chi2.ps', 5,10,"Log!D10!N(n) - [Sersic Index]","Galfit Residual (!7v!X!U2!N)", 0 
plot_phenomenon_bin, 'logn_chi2_bin.ps', 5,10,"Log!D10!N(n) - [Sersic Index]","Galfit Residual (!7v!X!U2!N)", 0
plot_phenomenon_bin, 'mag_chi2_bin.ps', 1,10,"Mag [F814W]","Galfit Residual (!7v!X!U2!N)", 35
plot_phenomenon_bin, 'Rabs_chi2_bin.ps', 1,14,"Mag [F814W]","Galfit Residual (R!Dabs!N)", 35



plot_phenomenon, 'n_mu0.ps', 21,5,"<!7l!X!D0!N> [mag/arcsec!U2!N]", "Log!D10!N(n) [Sersic index]", 0
plot_phenomenon, 'sig_mu0.ps', 21,4,"<!7l!X!D0!N> [mag/arcsec!U2!N]", "Log!D10!N(!7r!X) [km/s]", 0

plot_phenomenon_PHOTP, 'PHOTPmue_mue.ps', 1,2, "log(Re)-4.59*log(!7r!X)+27.11", "<!7l!X!De!N> [mag/arcsec!U2!N]", 0
plot_phenomenon_FP, 'FPmue_mue.ps', 1,2,"log(Re)-4.59*log(!7r!X)+27.11", "<!7l!X!De!N> [mag/arcsec!U2!N]", 0
plot_phenomenon_FP, 'FPmue_mue_yerror.ps', 1,2,"log(Re)-4.59*log(!7r!X)+27.11", "<!7l!X!De!N> [mag/arcsec!U2!N]", 0


plot_phenomenon, 'n_mue.ps', 2,5,"<!7l!X!De!N> [mag/arcsec!U2!N]", "Log!D10!N(n) [Sersic index]", 0
plot_phenomenon, 'n_concentration.ps', 5,17,"Log!D10!N(n) [Sersic index]","Concentration" ,0
------------------------------------------------------------------------------------------------------------
plot_phenomenon_FP, 'FPmue_mue_v02.ps', 1,2,"log(Re)-4.59*log(!7r!X)+27.11", "<!7l!X!De!N> [mag/arcsec!U2!N]", 0
plot_phenomenon_FP, 'FPmue_mue_yerror_v02.ps', 1,2,"log(Re)-4.59*log(!7r!X)+27.11", "<!7l!X!De!N> [mag/arcsec!U2!N]", 0
plot_phenomenon_FP, 'FPmue_mue_xyerror_v02.ps', 1,2,"log(Re)-4.59*log(!7r!X)+27.11", "<!7l!X!De!N> [mag/arcsec!U2!N]", 0

plot_phenomenon, 'aabs_sig_v02.ps', 12,4,"Asymmetry Parameter (A!Dabs!N)","Log!D10!N(!7r!X) [km/s]",0

plot_phenomenon, 'n_mue_v02.ps', 2,5,"<!7l!X!De!N> [mag/arcsec!U2!N]", "Log!D10!N(n) [Sersic index]", 0
plot_phenomenon, 'n_mu0_v02.ps', 21,5,"!7l!X!D0!N [mag/arcsec!U2!N]", "Log!D10!N(n) [Sersic index]", 0
plot_phenomenon, 'sig_mu0_v02.ps', 21,4,"!7l!X!D0!N [mag/arcsec!U2!N]", "Log!D10!N(!7r!X) [km/s]", 0
plot_phenomenon, 'n_concentration_v02.ps', 5,17,"Log!D10!N(n) [Sersic index]","Concentration" ,0
plot_phenomenon, 'mag_mue_v02.ps', 1,2,"Mag [F814W]","<!7l!X!De!N> [mag/arcsec!U2!N]", 35

plot_phenomenon, 'n_sig_v02.ps', 5,4,"Log!D10!N(n) [Sersic index]","Log!D10!N(!7r!X) [km/s]", 0
plot_phenomenon, 'concentration_sig_v02.ps', 17,4,"Concentration","Log!D10!N(!7r!X) [km/s]", 0
----------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------
plot_phenomenon_bin, 'concentration_dfp_bined_v02.ps', 17,6,"Concentration","<!7l!X!De!N>-<!7l!X!De!N>!U*!N [mag/arcsec!U2!N]", 0

plot_phenomenon_bin, 'logn_dfp_bined_v02.ps', 5,6,"Log!D10!N(n) - [Sersic Index]","<!7l!X!De!N>-<!7l!X!De!N>!U*!N [mag/arcsec!U2!N]", 0

plot_phenomenon_bin, 'mag_dfp_bined_v02.ps', 1,6,"Mag [F814W]","<!7l!X!De!N>-<!7l!X!De!N>!U*!N [mag/arcsec!U2!N]", 35




