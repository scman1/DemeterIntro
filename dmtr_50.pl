 #!/usr/bin/perl
 use Demeter;
 
# Example derived from code published at:
#   https://bruceravel.github.io/demeter/documents/DPG/feff/intrp.html

# After the path finder is run, the Feff object has its pathlist attribute
# filled with a reference to a list of ScatteringPath objects. The
# ScatteringPath object is an abstract representation of a scattering path. In
# DEMETER, the ScatteringPath object is somewhat like a feffNNNN.dat is to
# IFEFFIT – it does indeed describe the path, but it needs to imported and
# parametrized before it can be used to make a plot or a fit.

my $feff = Demeter::Feff -> new(file => "data/feff.inp");
$feff -> set(workspace => "feff/", screen => 0,);
$feff -> potph;
$feff -> pathfinder;

my @list_of_paths = @{ $feff-> pathlist };
foreach (@list_of_paths[0..5]) {
    my $this = Demeter::Path->new(parent => $feff,
                                  sp     => $_);
    $this -> plot('r');
	sleep 2;
};