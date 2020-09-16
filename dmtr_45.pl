#!/usr/bin/perl
use Demeter;

# Example derived from code published at:
#   https://bruceravel.github.io/demeter/documents/DPG/feff/potph.html

# This example shows creating the Feff object we to compute potentials, 
# which entails calling the potph method on the object.

my $feff = Demeter::Feff -> new(file => "data/feff.inp");
$feff->set(workspace=>"data/feff/", screen=>0);
$feff -> potph
