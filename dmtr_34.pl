#!/usr/bin/perl
use Demeter;

# Example derived from code published at:
#   https://bruceravel.github.io/demeter/documents/DPG/highlevel/plot.html

# The "R123 plot" is another pre-packaged specialty plot types. This one, is
# just like the "k123" plot in that three copies of the data are overplotted
# using each of the three k-weights with scaling and offset computed 
# automatically. This "R123" plot was plotted as the magnitude of χ(R). The
# "R123" plot respects the value of the r_pl attribute of the Plot object.

my @common = (energy => '$1', numerator => '$2', denominator => '$3', ln => 1,);
my $prj = Demeter::Data::Prj -> new(file=>'data/cyanobacteria.prj');
my $data = $prj -> records(9);

$data -> po -> start_plot;
$data -> plot('r123');
sleep 5;