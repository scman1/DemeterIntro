 #!/usr/bin/perl
 use Demeter;
# Example derived from code published at:
#   https://bruceravel.github.io/demeter/documents/DPG/data/athena.html

# Example importing data from athena project file(file_name.prj)

# Importing data from an ATHENA project file is a two-step process.
#   1. A Data::Prj object is created to store data obtained from a project file
#   2. Data::Prj methods are then used to generate Data objects. 
# This example shows extracting all records using the slurp method.

# The sample from the documentation (iron_data.prj) is not included, so used
# a sample file from athena (Fe_standards.prj)

my $prj = Demeter::Data::Prj -> new(file=>'data/Fe_standards.prj');
my @all = $prj -> slurp;
$_ -> plot('E') foreach @all;
sleep 5;

# You can query an ATHENA project file for its content in several ways.
# To obtain a listing of contents of the project file, use the list method.
print $prj -> list;

# To create a simple table of parameter values, supply a list of attribute names to the list method
print $prj -> list(qw(bkg_rbkg fft_kmin));

# The allnames method will return an array of record labels (the strings in the
# groups list in ATHENA)
print $prj -> allnames;

