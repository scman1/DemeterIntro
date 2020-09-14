#!/usr/bin/perl

# Example derived from code published at:
#   https://bruceravel.github.io/demeter/documents/DPG/data/mue.html

# First example of importing a Mu(e) data file and plotting it

use Demeter;

my $data = Demeter::Data -> new(file => "data/fe.060.xmu",
                                name => 'Fe 60K',
                               );
$data -> plot('E');

