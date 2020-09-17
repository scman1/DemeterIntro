#!/usr/bin/perl
use Demeter;

## Deserializing feff.yaml;
my $feff = Demeter::Feff -> new("data/feff/feff.yaml");
my @list_of_paths = $feff->pathlist;

### The 6 scattering geometries that contribute to path #2:
my $sp = $list_of_paths[1];
my $j=1000;
foreach my $s ($sp->all_strings) {
  print $sp -> pathsdat(index=>++$j, string=>$s, angles=>1);
};