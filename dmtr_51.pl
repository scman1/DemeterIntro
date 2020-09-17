#!/usr/bin/perl  
use Demeter;

# Example derived from code published at:
#   https://bruceravel.github.io/demeter/documents/DPG/feff/intrp.html

# To generate feffNNNN.dat files. The Feff object provides the genfmt method.
# This is the method used behind the scenes to generate path files as needed for
# plotting or fitting. 

# the files are save to the workspace, which in this case is the same from which 
# the serialised yaml file was loaded

## Deserialize feff.yaml;
my $feff = Demeter::Feff -> new(yaml => "data/feff/feff.yaml");
$feff->pathsdat(); # all paths
#$feff->pathsdat(1,2,6,9); # the first four SS paths
$feff->genfmt;