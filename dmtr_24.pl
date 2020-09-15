#!/usr/bin/perl
use Demeter;

# Example derived from code published at:
#   https://bruceravel.github.io/demeter/documents/DPG/highlevel/plot.html

# This example shows how to plot data and background function after normalization

my $data = Demeter::Data -> new(file        => "data/fe.060",
                              ln          => 1,
                              energy      => q{$1},
                              numerator   => q{$2},
                              denominator => q{$3});
							  
my @eplot = (e_mu      => 1,     e_bkg     => 1,
             e_norm    => 1,     e_der     => 0,
             e_pre     => 0,     e_post    => 0,
             e_i0      => 0,     e_signal  => 0,
             e_markers => 1,
             emin      => -200,  emax      => 2000,
             space     => 'E',
            );
$data -> po -> set(@eplot);
$data -> bkg_flatten(0);
$data -> po -> start_plot;
$data -> plot;

sleep 10;