 #!/usr/bin/perl
 use Demeter;
# code snippet from https://bruceravel.github.io/demeter/documents/DPG/data/athena.html

# Example importing data from athena project file(file_name.prj)

# Importing data from an ATHENA project file is a two-step process.
#   1. A Data::Prj object is created to store data obtained from a project file
#   2. Data::Prj methods are then used to generate Data objects. 
# This example shows extracting four records to create four data objects from 
# each record. The numbers correspond to the index indicating which records to 
# recover

# The sample from the documentation (iron_data.prj) is not included, so used
# a sample file from athena (Fe_standards.prj)

my $prj = Demeter::Data::Prj -> new(file=>'data/Fe_standards.prj');
my @several = $prj -> records(1, 3, 5, 9);
$_ -> plot('E') foreach @several
