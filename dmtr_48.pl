#!/usr/bin/perl
use Demeter;

# Example derived from code published at:
#   https://bruceravel.github.io/demeter/documents/DPG/feff/intrp.html

# The hard part of using FEFF effectively is keeping track of all the paths. The
# main tool DEMETER offers for this is the path interpretation.

# intrp can run after the pathfinder method

#!/usr/bin/perl

my $feff = Demeter::Feff -> new(file => "data/feff.inp");
$feff -> set(workspace => "data/feff/", screen => 0,);
$feff -> potph;
$feff -> pathfinder;
print $feff -> intrp;