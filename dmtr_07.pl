 #!/usr/bin/perl
 use Demeter;
# Example derived from code published at:
#   https://bruceravel.github.io/demeter/documents/DPG/data/athena.html

# Example importing data from athena project file(file_name.prj)

# Importing data from an ATHENA project file is a two-step process.
#   1. A Data::Prj object is created to store data obtained from a project file
#   2. Data::Prj methods are then used to generate Data objects. 
# The example shows extracting the first record from a project file and creating
# a Data object from that record.

# The sample from the documentation (iron_data.prj) is not included, so used
# a sample file from athena (Fe_standards.prj)

my $prj = Demeter::Data::Prj -> new(file=>'data/Fe_standards.prj');
my $data = $prj -> record(1);

$data -> plot('E');