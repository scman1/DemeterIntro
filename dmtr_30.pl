#!/usr/bin/perl
use Demeter;

# Example derived from code published at:
#   https://bruceravel.github.io/demeter/documents/DPG/highlevel/plot.html

# DEMETER will take care of the background removal when you request a plot in
# k-space. 
# Note that the k-weight to use for plotting is an attribute of the Plot object.

my $data = Demeter::Data -> new(file        => "data/fe.060",
                              ln          => 1,
                              energy      => q{$1},
                              numerator   => q{$2},
                              denominator => q{$3});

$data -> po -> start_plot;
$data -> po -> set(kweight=>2, chie=>1);
$data -> plot('k');
sleep 5;

