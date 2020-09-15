#!/usr/bin/perl
use Demeter;
   
# Example derived from code published at:
#   https://bruceravel.github.io/demeter/documents/DPG/mue/merge.html

# The first argument to the merge method specifies which spectrum is merged:
# e means to merge μ(E), n means to merge normalized μ(E), and k means to 
# merge χ(k).


my @common = (energy => '$1', numerator => '$2', denominator => '$3', ln => 1,);
my $prj = Demeter::Data::Prj -> new(file=>'data/cyanobacteria.prj');
my @data = $prj -> records(9,10,11);
   
my $merged = $data[0] -> merge('e', @data);
$merged -> name("Au merge");

# The standard deviation has been scaled to plot with the μ(E) spectrum, with 
# the scaling factor is given in the legend. This is a way of visualizing how
# the standard deviation is distributed across the spectrum.
# Note that this plot type can only be plotted using a Data object which 
# contains the data from a merge. Trying to plot a non-merged Data object in 
# this way will return a warning without plotting anything.
$merged -> plot('variance');
sleep 10;