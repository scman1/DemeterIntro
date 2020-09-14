 #!/usr/bin/perl
 use Demeter;
 use Demeter::Data::MultiChannel;

# code snippet from https://bruceravel.github.io/demeter/documents/DPG/data/mc.html

# Multi-channel data objects can be used to import data from files that contain 
# multiple columns of data that can be independently processed as μ(E) data. 

# This example shows the use of the Data::MultiChannel object to import the reference channel
# from an XAS data file:

#my $file = 'data/Fe_pyrite.000';
my $mc = Demeter::Data::MultiChannel->new(file => 'data/Fe_pyrite.000', energy => '$1', );

my $data = $mc->make_data(numerator   => '$2', denominator => '$3',
                        ln          => 1,    name        => 'Fe2O3' );
my $ref  = $mc->make_data(numerator   => '$2', denominator => '$4',
                        ln          => 1,    name        => '  Ref Fe pyrite' );
 

$data -> plot('E');
$ref -> plot('E')