 #!/usr/bin/perl
 use Demeter;

# Example derived from code published at:
#   https://bruceravel.github.io/demeter/documents/DPG/paths/pathparams.html

# ScatteringPath objects are not plottable objects. To visualize the
# contribution from the scattering geometry described by a ScatteringPath object,
# you must create a Path object.

 my $data = Demeter::Data::Prj -> new(file=>"data/HgDNA.prj")-> record(2);
 my $feff = Demeter::Feff -> new(file => "data/feff.inp");
 $feff -> set(workspace => "data/feff", screen => 0,);
 $feff -> potph;
 $feff -> pathfinder;

 my @list_of_paths = @{ $feff-> pathlist };
 my @paths;
 foreach (@list_of_paths[0..5]) {
   push @paths, Demeter::Path->new(parent => $feff,
                                   data   => $data,
                                   sp     => $_);
 };
 ## plot data and paths together in R space
 $_ -> plot('r') foreach ($data, @paths);
 sleep 5;
 