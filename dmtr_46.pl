#!/usr/bin/perl
use Demeter;

# Example derived from code published at:
#   https://bruceravel.github.io/demeter/documents/DPG/feff/pathfinder.html

# This example shows using the pathfinder tool of the Feff object we to
# determine all possible scatering geometries

my $feff = Demeter::Feff -> new(file => "data/feff.inp");
$feff->set(workspace=>"data/feff/", screen=>0);
$feff -> potph;
$feff -> pathfinder;

$feff -> freeze("data/feff/feff.yaml");