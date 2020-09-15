#!/usr/bin/perl
use Demeter;

# Example derived from code published at:
#   https://bruceravel.github.io/demeter/documents/DPG/highlevel/plot.html

#DEMETER offers an easy way to plot μ(E) data with the E0 value subtracted. This
# places the edge at 0 on the x-axis, allowing you to overplot data from
# different edges. When the e_zero attribute of the Plot object is set to 1, 
# each Data object's bkg_eshift attribute is temporarily set so that the edge 
# will show up at 0 in the plot.

my @common = (bkg_rbkg    => 1.5,
              bkg_spl1    => 0,    bkg_spl2    => 18,
              bkg_nor2    => 1800,
              bkg_flatten => 1,
             );
my @data = (Demeter::Data -> new(),
            Demeter::Data -> new(),
           );
foreach (@data) { $_ -> set(@common) };
$data[0] -> set(file => "data/fe.060.xmu",
                name => 'Fe 60K', );
$data[1] -> set(file => "data/cu010k.dat",
                name => 'Cu 10K', );

## decide how to plot the data
my @eplot = (e_mu    => 1,   e_bkg   => 0,
             e_norm  => 1,
             e_pre   => 0,   e_post  => 0,
             e_zero  => 1,
             emin    => -30, emax    => 150,
            );
$data[0] -> po -> set(@eplot);
$data[0] -> po -> start_plot;
foreach (@data) { $_ -> plot('E') };
sleep 5;