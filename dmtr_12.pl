 #!/usr/bin/perl
 use Demeter;
 use Demeter::Data::MultiChannel;
 use File::Basename;

# code snippet from https://bruceravel.github.io/demeter/documents/DPG/data/mc.html

# Multi-channel data objects can be used to import data from files that contain 
# multiple columns of data that can be independently processed as μ(E) data. 

# This example shows the use of the Data::MultiChannel object to import two channels
# from an XAS data file and writing to an athena project file.

my $file = 'data/Fe_pyrite.000';
my $mc = Demeter::Data::MultiChannel->new(file => $file, energy => '$1', );

# declare an array
my @data;

# assing values to array

$data[0] = $mc->make_data(numerator   => '$2', denominator => '$3',
                        ln          => 1,    name        => 'Fe2O3' );
$data[1] = $mc->make_data(numerator   => '$2', denominator => '$4',
                        ln          => 1,    name        => '  Ref Fe pyrite' );
# plot the array  
$_ -> plot('E') foreach @data;


my $prjname = basename($file) . '.prj';
print "exporting $prjname ... ";
$data[0]->write_athena($prjname, @data);
print $/;
$data[0]->po->end_plot;
$mc->discard;


