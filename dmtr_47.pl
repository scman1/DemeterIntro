#!/usr/bin/perl
use Demeter;

# Example derived from code published at:
#   https://bruceravel.github.io/demeter/documents/DPG/feff/pathfinder.html

# This example shows using the run method of the Feff object which is a wrapper
# around the potph and pathfinder method calls.

my $feff = Demeter::Feff -> new(file => "data/feff.inp");
$feff->set(workspace=>"data/feff/", screen=>0);
$feff -> run
