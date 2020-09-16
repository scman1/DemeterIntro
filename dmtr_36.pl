#!/usr/bin/perl
use Demeter;

# Example derived from code published at:
#   https://bruceravel.github.io/demeter/documents/DPG/highlevel/plot.html

# Plotting the back-transformed χ(q) is specified by plotting in q. The part of
# the complex χ(q) is specified using the q_pl attribute of the Plot object.

my @common = (energy => '$1', numerator => '$2', denominator => '$3', ln => 1,);
my $prj = Demeter::Data::Prj -> new(file=>'data/cyanobacteria.prj');
my $data = $prj -> records(9);

$data -> po -> set(kweight => 2, q_pl => 'r');
$data -> po -> start_plot;
$data -> plot('q');
sleep 5;