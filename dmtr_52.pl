#!/usr/bin/perl
use Demeter;

# Example derived from code published at:
#   https://bruceravel.github.io/demeter/documents/DPG/feff/intrp.html

# The  list of scattering geometries contributing to the degeneracy of a path
# can be printed as follows.

## Deserializing feff.yaml;
my $feff = Demeter::Feff -> new(yaml => "data/feff/feff.yaml");
my @list_of_paths = @{ $feff-> pathlist };
my $idx = 5 ; #array indexes start at 0
print "The scattering geometries that contribute to path $idx:\n";
my $sp = $list_of_paths[$idx-1];
my $j=1000;
foreach my $s ($sp->all_strings) {
  print $sp -> pathsdat(index=>++$j, string=>$s, angles=>1);
};
