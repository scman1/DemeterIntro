#!/usr/bin/perl
use Demeter;

# Example derived from code published at:
#   https://bruceravel.github.io/demeter/documents/DPG/feff/input.html

# This example shows creating a Feff object and populating it with the contents
# of a feff.inp file.

my $feff = Demeter::Feff -> new(file => "data/feff.inp");
$feff->set(workspace=>"data/feff/", screen=>0);
	