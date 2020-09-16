#!/usr/bin/perl
use Demeter;

# Example derived from code published at:
#   https://bruceravel.github.io/demeter/documents/DPG/highlevel/plot.html

#  Multiple parts of the complex χ(R) are overplotted by repeatedly plotting
# data in R-space without calling the start_plot method. The value of r_pl is
# set between each part of the plot. Note that the “envelope” is the magnitude
# plotted twice, multiplied by -1.

my $data = Demeter::Data -> new(file        => "data/fe.060",
                              ln          => 1,
                              energy      => q{$1},
                              numerator   => q{$2},
                              denominator => q{$3});
$data -> po -> set(kweight => 2, r_pl => 'e', space => 'r');
$data -> po -> start_plot;
$data -> plot;
sleep 2;
$data -> set(name=>'Real part');
$data -> po -> set(r_pl => 'r', );
$data -> plot;
sleep 2;
$data -> set(name=>'Imaginary part');
$data -> po->set(r_pl => 'i', );
$data -> plot;

$data -> set(name=>'fe.060');  ## reset original name
sleep 5;