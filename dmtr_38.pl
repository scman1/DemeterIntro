#!/usr/bin/perl
use Demeter; #qw(:ui=screen :plotwith=gnuplot);
#use Demeter::Data::Prj

my $prj = Demeter::Data::Prj -> new(file=>'data/cyanobacteria.prj');
my $lcf = Demeter::LCF -> new(space=>'nor', plot_difference=>1, plot_components=>1);

$prj -> set_mode('screen' => 1);

my $data = $prj->record(4);
my ($metal, $chloride, $sulfide) = $prj->records(9, 11, 15);

$lcf->data($data);
$lcf->add_many($metal, $chloride, $sulfide);

$lcf->xmin($data->bkg_e0-20);
$lcf->xmax($data->bkg_e0+60);
$lcf->po->set(emin=>-30, emax=>80);

$lcf -> fit -> plot -> save('data/lcf_fit_result.dat');
$lcf->pause;

$lcf->clean;
