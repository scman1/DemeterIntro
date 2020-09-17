#!/usr/bin/perl
use Demeter;

# Example derived from code published at:
#   https://bruceravel.github.io/demeter/documents/DPG/paths/semantic.html

# You can specify a path using a semnatic description of the path. For example,
# you can find the single scattering path which between 2 and 3 Å from the
# scatterer. 

# The examples show how to find the first path matching the criteria and then
# all paths matching it. 

## Deserializing feff.yaml;
my $feff = Demeter::Feff -> new(yaml => "data/feff/feff.yaml");
## Find the scatter path
my $this_sp = $feff->find_path(gt=>2, lt=>3);

## print the scatter path found
my $j=1000;
print "First scatter path with length > 2 and < 3 \n";
foreach my $s ($this_sp->all_strings) {
  print $this_sp -> pathsdat(index=>++$j, string=>$s, angles=>1);
};

## build the path from the scatter path
my $path = Demeter::Path -> new(feff => $feff,
                                sp   => $this_sp,
                            );
## plot the path
$path -> plot('r');
sleep 5;
							
# find all scatter paths
my @list = $feff->find_all_paths();

print "********************************************************************\n";
print "find all scatter paths with length > 2 and < 3\n";
print "********************************************************************\n";
@list = $feff->find_all_paths(gt=>2, lt=>3);
$j=1000;
foreach my $sp (@list){
	foreach my $s ($sp->all_strings) {
	  print $sp -> pathsdat(index=>++$j, string=>$s, angles=>1);
	## build the path from the scatter path
	my $a_path = Demeter::Path -> new(feff => $feff,
                                sp   => $sp,
                            );
	## plot the path
	$a_path -> plot('r');
	sleep 5;		
	};
};
