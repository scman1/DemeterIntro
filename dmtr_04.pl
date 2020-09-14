#!/usr/bin/perl
use Demeter;

# Example derived from code published at:
#   https://bruceravel.github.io/demeter/documents/DPG/data/mue.html

# Example setting parameters(e.g. for normalization, background removal, and
# Fourier transforms) at the time of object creation.
# The arguments of new are passed to the set method

my $data = Demeter::Data -> new(file => "data/fe.060.xmu",
                                name => 'Fe 60K',
                                bkg_rbkg => 1.5,
                                bkg_spl1 => 0,    bkg_spl2 => 18,
                                bkg_nor1 => 100,  bkg_nor2 => 1800,
                                fft_kmax => 3,    fft_kmin => 17,
                               );
$data -> plot('E');
sleep 5;