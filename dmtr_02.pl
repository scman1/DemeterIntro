#!/usr/bin/perl
use Demeter;

my $data = Demeter::Data -> new(file => "data/fe.060.xmu",
                                name => 'Fe 60K',
                               );
$data -> plot('E');