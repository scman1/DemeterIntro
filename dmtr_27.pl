#!/usr/bin/perl
use Demeter;

# Example derived from code published at:
#   https://bruceravel.github.io/demeter/documents/DPG/highlevel/plot.html

# DEMETER saves arrays containing I0 and the signal channel, which can then be
# plotted along with the data. DEMETER takes care to scale these arrays so that
# they plot nicely with the data.

my $data = Demeter::Data -> new(file        => "data/fe.060",
                              ln          => 1,
                              energy      => q{$1},
                              numerator   => q{$2},
                              denominator => q{$3});
							  
my @eplot = (e_mu      => 1,     e_bkg     => 0,
             e_norm    => 0,     e_der     => 0,
             e_pre     => 0,     e_post    => 0,
             e_i0      => 1,     e_signal  => 1,
             e_markers => 0,
             emin      => -20,   emax      => 120,
             space     => 'E',
            );
$data -> po -> set(@eplot);
$data -> po -> start_plot;
$data -> plot;
sleep 5;
