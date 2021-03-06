#!/usr/bin/perl
use Demeter;

# Example derived from code published at:
#   https://bruceravel.github.io/demeter/documents/DPG/mue/truncate.html

# In the example, all points after 7500 eV are removed from the data.

my $d0 = Demeter::Data -> new(file        => "data/fe.060",
                              name        => '60K',
                              ln          => 1,
                              energy      => q{$1},
                              numerator   => q{$2},
                              denominator => q{$3});
# the following two lines are added to prevent plotting background
# look at https://bruceravel.github.io/demeter/documents/DPG/highlevel/plot.html
#my @eplot = (e_bkg => 0);
#$d0 -> po -> set(@eplot);
#alternative to creating a plot object, above
$d0 -> po -> set(e_bkg => 0);
$d0 -> plot('E');
sleep 5;

$d0 -> Truncate('after', 7500);
$d0 -> plot('E');

sleep 5;