#!/usr/bin/perl
use Demeter;

my $data = Demeter::Data -> new(file => "data/fe.060.xmu",
                                name => 'Fe 60K',
                               );
$data -> set(bkg_rbkg    => 1.5,
             bkg_spl1    => 0,    bkg_spl2    => 18,
             bkg_nor1    => 100,  bkg_nor2    => 1800,
             fft_kmax    => 3,    fft_kmin    => 17,
            );
$data -> plot('E');