#!/usr/bin/perl
use Demeter;

# Example derived from code published at:
#   https://bruceravel.github.io/demeter/documents/DPG/highlevel/plot.html

# Another specialty plot type in DEMETER, the “kq plot”. This overplots χ(k)
# with the real part of χ(q).

my @common = (energy => '$1', numerator => '$2', denominator => '$3', ln => 1,);
my $prj = Demeter::Data::Prj -> new(file=>'data/cyanobacteria.prj');
my $data = $prj -> records(9);

$data -> po -> start_plot;
$data -> po -> kweight(2);
$data -> plot('kq');
sleep 5;