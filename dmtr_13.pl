 #!/usr/bin/perl
 use Demeter;
 use Demeter::Plugins::X15B;

# code snippet from https://bruceravel.github.io/demeter/documents/DPG/data/special.html

# To handle data from beamlines that write out data in a formats that IFEFFIT
# is not capable of reading without help.
# To address this problem, DEMETER offers a simple plugin architecture. 
# A plugin is a bit of perl code which transformed the problematic file into 
# a form that IFEFFIT can handle. 

# The code below shows reading data from the X15B beamline at NSLS which used 
# an antiquated data acquisition.

 my $filetype = Demeter::Plugins::X15B->new(file=>'data/s_x15b.dat');
 if ($filetype->is) {
     my $converted = $filetype->fix;
     my $data = Demeter::Data->new(file => $converted,
                                   $filetype -> suggest("fluorescence")
                                  );
	 $data -> plot('E');	 
 };