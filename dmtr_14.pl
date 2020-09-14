#!/usr/bin/perl
use Demeter;

# Example derived from code published at:
#   https://bruceravel.github.io/demeter/documents/DPG/data/plot.html

# Plotting in the four spaces is quite straightforward.

# In this example, the data from the sample file is plotted in each space.

my $data = Demeter::Data -> new(file => "data/fe.060.xmu",
                                name => 'Fe 60K',
                               );
$data -> set(bkg_rbkg    => 1.5,
             bkg_spl1    => 0,    bkg_spl2    => 18,
             bkg_nor1    => 100,  bkg_nor2    => 1800,
             fft_kmax    => 3,    fft_kmin    => 17,
            );

# plot in energy
$data -> plot('E');

# plot in k
$data -> plot('k');
sleep 3;
# plot in R
$data -> plot('R');
sleep 3;
# plot in back-transform k
$data -> plot('q');
sleep 3;
# plot the magnitude and real part of chi(R)
$data -> plot('rmr');
sleep 3;
#plot chi(k) with k-weights of 1, 2, and 3, scaled to be the same size
$data -> plot('k123');
sleep 3;
# plot chi(R) with k-weights of 1, 2, and 3, scaled to be the same size
$data->plot('R123');
sleep 3;
# plot in chi(k) with the real part of chi(q)
$data->plot('kq');
sleep 3;
#quad plot with data in all four spaces
$data->plot('quad');
sleep 3;

