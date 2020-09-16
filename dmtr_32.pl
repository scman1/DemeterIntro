#!/usr/bin/perl
use Demeter;

# Example derived from code published at:
#   https://bruceravel.github.io/demeter/documents/DPG/highlevel/plot.html

# This example shows a common kind of plot, χ(R) data with the back-Transform
# windowing function, which is also used by DEMETER as the fitting range when a
# fit is evaluated in R-space. The r_pl attribute of the Plot object is set to
# m, indicating that the magnitude of χ(R) should be plotted.

my $data = Demeter::Data -> new(file        => "data/fe.060",
                              ln          => 1,
                              energy      => q{$1},
                              numerator   => q{$2},
                              denominator => q{$3});

$data -> po -> set(kweight => 2, r_pl => 'm', space => 'r', );
$data -> po -> start_plot;
$data -> plot -> plot_window;
sleep 5;
