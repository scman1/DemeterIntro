#!/usr/bin/perl
use Demeter;

# Example derived from code published at:
#   https://bruceravel.github.io/demeter/documents/DPG/feff/intrp.html

# The hard part of using FEFF effectively is keeping track of all the paths. The
# main tool DEMETER offers for this is the path interpretation.

# intrp can also run after creating the Feff object from a serealised file

my $feff = Demeter::Feff -> new(yaml => "data/feff/feff.yaml");
print $feff -> intrp;