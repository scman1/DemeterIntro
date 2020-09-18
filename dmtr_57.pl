#!/usr/bin/perl
use Demeter;

# Example derived from code published at:
#   https://bruceravel.github.io/demeter/documents/DPG/paths/existing.html

# This example shows linking the path to a record in an athena project

# NOTE: not sure if this is relevant or correct as the example in the website is
# too short and does not provide further explanations.

my $data = Demeter::Data::Prj -> new(file=>"data/HgDNA.prj")-> record(1);

my $path = Demeter::Path -> new(data   => $data,
								folder => './data/feff',
                                file   => 'feff0001.dat',
                            );
## plot the path
$path -> plot('r');
sleep 2;
printf "E0=%s\ns02=%s\n", $path->e0, $path->s02;
printf "deltaR=%s\nsigma2=%s\n", $path->delr, $path->sigma2;
