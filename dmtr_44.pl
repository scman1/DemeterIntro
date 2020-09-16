#!/usr/bin/perl
use Demeter;

# Example derived from code published at:
#   https://bruceravel.github.io/demeter/documents/DPG/feff/input.html

# This example shows creating a Feff object and populating it with the contents
# of an atoms .inp file, skipping the step fo explicitly writing the feff.inp
# file. 

my $atoms = Demeter::Atoms -> new(file => 'data/atoms.inp');
my $feff = Demeter::Feff -> new(atoms => $atoms);
$feff->set(workspace=>"data/feff/", screen=>0);
