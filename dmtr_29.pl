#!/usr/bin/perl
use Demeter;

# Example derived from code published at:
#   https://bruceravel.github.io/demeter/documents/DPG/highlevel/plot.html

# DEMETER will take care of the background removal when you request a plot in
# k-space. 
# Note that the k-weight to use for plotting is an attribute of the Plot object.

my @common = (energy => '$1', numerator => '$2', denominator => '$3', ln => 1,);
my $prj = Demeter::Data::Prj -> new(file=>'data/cyanobacteria.prj');
my $data = $prj -> records(9);

$data -> po -> start_plot;
$data -> po -> kweight(2);
$data -> plot('k');
sleep 5;

