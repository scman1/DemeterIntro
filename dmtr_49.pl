#!/usr/bin/perl
use Demeter;

my $feff = Demeter::Feff -> new(yaml => "data/feff/feff.yaml");
print $feff -> intrp;