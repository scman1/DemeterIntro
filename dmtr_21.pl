#!/usr/bin/perl
use Demeter;

# Example derived from code published at:
#   https://bruceravel.github.io/demeter/documents/DPG/mue/deglitch.html

# DEMETER's deglitching procedure is very simple. Given one or more energy
# values, the data point closest in energy to each supplied value will be
# removed from the data. Deglitching, therefore, changes the representation of
# the data within both DEMETER and IFEFFIT.

# Multiple arguments can be given to the deglitch method. Each argument is
# interpeted as an energy value and the point closest is removed from the data.

# In this example, some data are imported at and plotted. 
# Then, two points are removed from the data.
# Note that this method operates on the object itself. It does not return a new
# object. Finally the deglitched data are plotted over the original data.

print "Reading and plotting uhup.003\n";
my $d0 = Demeter::Data -> new(file        => "data/uhup.003",
                              name        => 'HUP',
                              energy      => '$1', # column 1 is energy
                              numerator   => '$3', # column 3 is I0
                              denominator => '$4', # column 4 is It
                              ln          => 1,    # these are transmission data
               );

$d0 -> plot('e');
sleep 10;
$d0 -> name("HUP, deglitched");
$d0 -> deglitch(17385.686, 17655.5);
$d0 -> plot('e');
sleep 10;