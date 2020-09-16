#!/usr/bin/perl
use Demeter;

# Example derived from code published at:
#   https://bruceravel.github.io/demeter/documents/DPG/highlevel/plot.html

# The “Rmr plot” is the third of the pre-packaged specialty plot types. This one
# plots the magnitude and real part of χ(R) with an appropriate offset between
# them. This is the default plot type made after a fit finishes. In that case,
# the data and fit are overplotted as magnitude and real.

my @common = (energy => '$1', numerator => '$2', denominator => '$3', ln => 1,);
my $prj = Demeter::Data::Prj -> new(file=>'data/cyanobacteria.prj');
my $data = $prj -> records(9);

$data -> po -> start_plot;
$data -> po -> kweight(2);
$data -> plot('rmr');
sleep 5;