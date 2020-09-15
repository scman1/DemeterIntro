#!/usr/bin/perl
use Demeter;

# Example derived from code published at:
#   https://bruceravel.github.io/demeter/documents/DPG/highlevel/plot.html

# This shows how things get overplotted, in this case the derivative of μ(E)
# and the derivative of normalized μ(E).

my $data = Demeter::Data -> new(file        => "data/fe.060",
                              ln          => 1,
                              energy      => q{$1},
                              numerator   => q{$2},
                              denominator => q{$3});
							  
my @eplot = (e_mu      => 1,     e_bkg     => 0,
             e_norm    => 0,     e_der     => 1,
             e_pre     => 0,     e_post    => 0,
             e_i0      => 0,     e_signal  => 0,
             e_markers => 0,
             emin      => -20,   emax      => 120,
             space     => 'E',
            );
			
$data -> po -> set(@eplot);
$data -> po -> start_plot;
$data -> set(name=>'derivative') -> plot;
sleep 5;
$data -> po -> e_norm(1);
$data -> set(name=>'norm. deriv.') -> plot;

sleep 5;