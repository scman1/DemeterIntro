#!/usr/bin/perl
use Demeter;

# Example derived from code published at:
#   https://bruceravel.github.io/demeter/documents/DPG/atoms.html

# this example shows how the atoms attribute is populated from a cif file.

my $atoms = Demeter::Atoms->new(cif => "data/AuCl.cif", record=>1);
print $atoms->Write("feff6");