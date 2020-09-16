#!/usr/bin/perl
use Demeter;

# Example derived from code published at:
#   https://bruceravel.github.io/demeter/documents/DPG/atoms.html

# The attributes of the Atoms object can be populated in one of three ways, by
# reading an atoms.inp file, by reading a CIF file, or by setting the attributes
# programmatically.

# this example shows how the atoms attribute is populated from an inp file.

my $atoms = Demeter::Atoms->new(file => "data/ybco-atoms.inp");
print $atoms->Write("feff6");
