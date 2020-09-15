 #!/usr/bin/perl
use Demeter;

# Example derived from code published at:
#   https://bruceravel.github.io/demeter/documents/DPG/mue/align.html

# The example shows the alignment of data.

# Five data sets are imported in the following lines. 
my $prj = Demeter::Data::Prj -> new(file=>'data/Fe_standards.prj');
my @data = $prj -> records(1, 3, 5, 7, 9);

# plot before alignment
$_ -> plot('E') foreach @data[0..3];;
sleep 10;
 
## ... set background removal and Fourier transform attributes for
##     each data set ...

# By calling the align method on the fifth data set in the list that data set
# is chosen as the standard. 

## align to the standard
$data[4]->align(@data);
## make all the E0 values the same
$_->e0($data[4]) foreach @data[0..3];

$data[0] -> po -> start_plot;

# plot after alignment
$_ -> plot('E') foreach @data[0..3];;
sleep 10;