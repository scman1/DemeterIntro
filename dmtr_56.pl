#!/usr/bin/perl
use Demeter;

# Example derived from code published at:
#   https://bruceravel.github.io/demeter/documents/DPG/paths/existing.html

# You can import feffNNNN.dat files from a FEFF calculation run outside of
# DEMETER. The example below shows how to do it. The method new from the path
# object requires explicitly specifying the folder and file.

my $path = Demeter::Path -> new(folder => './data/feff',
                                file   => 'feff0001.dat',
                            );
## plot the path
$path -> plot('r');
sleep 2;
printf "E0=%s\ns02=%s\n", $path->e0, $path->s02;
printf "deltaR=%s\nsigma2=%s\n", $path->delr, $path->sigma2;
