#!/usr/bin/perl
use Demeter;

# Example derived from code published at:
#   https://bruceravel.github.io/demeter/documents/DPG/data/chi.html

# Example importing chi(k) data 

my $data = Demeter::Data -> new(file      => "data/cu10k.chi",
                                name      => '10K copper data',
                                fft_kmin  => 3,    fft_kmax  => 14,
                               );
$data -> plot('k');