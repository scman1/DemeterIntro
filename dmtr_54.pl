#!/usr/bin/perl
use Demeter;

# Example derived from code published at:
#   https://bruceravel.github.io/demeter/documents/DPG/paths/pathparams.html


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
sleep 2;
					
printf("Path label %s \n", $path -> label);					
## get path parameter math expression:
print "before mod\n";
printf "s02 = %s  deltaR = %s and sigma2 = %s \n", $path->s02, $path->delr, $path->sigma2;
## set a path parameter:
$path->s02("(1-x) * amp");
print "after mod\n";
printf "s02 = %s  deltaR = %s and sigma2 = %s \n", $path->s02, $path->delr, $path->sigma2;

# The R method is used to return the fitted half path length, that is the sum of
# Reff and delr.

printf "half path length is %.5d\n", $path->R;

# This method returns a multiline text string reporting on the evaluation of the
# Path's math expressions.

print $path -> paragraph;

# This line resets the default Path label to a string that includes the half
# path length and the path degeneracy

$path -> co -> set_default("label", '%r (%d)');
