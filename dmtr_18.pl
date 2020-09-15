 #!/usr/bin/perl
use Demeter;

# Example derived from code published at:
#   https://bruceravel.github.io/demeter/documents/DPG/mue/align.html

# The example shows the alignment of data.

# Four data sets are imported in the following lines. 
my $prj = Demeter::Data::Prj -> new(file=>'data/Fe_standards.prj');
my @data = $prj -> records(1, 2, 3, 4);

# plot before alignment
$_ -> plot('E') foreach @data[0..3];;
sleep 10;

# data sets 1 and 3 are the references for datasets 0 and 2 respectively

$data[0]->reference($data[1]);
$data[2]->reference($data[3]);


## align to the standard using the reference
$data[0]->alignwr($data[2]);
## make the E0 values the same
$data[2]->e0($data[0]);
 
$data[0] -> po -> start_plot;

# plot after alignment
$_ -> plot('E') foreach @data[0..3];;
sleep 10;