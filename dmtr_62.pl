#!/usr/bin/perl
 use Demeter; #qw(:ui=screen);
 
 # Example derived from code published at:
 #   https://bruceravel.github.io/demeter/documents/DPG/fit/after.html
 
 # This example a builds on the previous fitting EXAFS data example to show what
 # happens after the fit.
 
 ## import an Athena project file with copper metal in it
 my $prj = Demeter::Data::Prj->new(file=>'data/cu.prj');

 ## make a Data object and set the FT and fit parameters
 my @data = $prj->records(1, 2);
 $data[0] -> name('10 K copper data');
 $data[1] -> name('150 K copper data');
 my @common = (fft_kmin   => 3,        fft_kmax   => 14,
               fit_k1     => 1,        fit_k3     => 1,
               bft_rmin   => 1.6,      bft_rmax   => 4.3,
               fit_do_bkg => 0,
              );
 $_ -> set(@common) foreach @data;
 
 ## run a Feff calculation on copper metal
 my $atoms = Demeter::Atoms -> new(file => 'data/atoms.inp');
 my $feff = Demeter::Feff -> new(atoms => $atoms);
 $feff -> set(workspace => "data/cu_afterfit/", screen => 0,);
 $feff -> potph -> pathfinder; # could have used '$feff->run' instead
 my @list_of_paths = $feff-> list_of_paths;

 ## make GDS objects for an isotropic expansion, correlated Debye model fit to copper
 my @gds =  (Demeter::GDS -> new(gds => 'guess', name => 'alpha10', mathexp => 0),
			 Demeter::GDS -> new(gds => 'guess', name => 'alpha150', mathexp => 0),
             Demeter::GDS -> new(gds => 'guess', name => 'amp',   mathexp => 1),
             Demeter::GDS -> new(gds => 'guess', name => 'enot',  mathexp => 0),
             Demeter::GDS -> new(gds => 'guess', name => 'theta', mathexp => 500),
             Demeter::GDS -> new(gds => 'set',   name => 'sigmm', mathexp => 0.00052),
            );

 ## make Path objects for the first 5 paths in copper (3 shell fit)
 my @paths = ();
 foreach my $i (0 .. 4) {
   ## paths for data at 10K
   $paths[$i] = Demeter::Path -> new();
   $paths[$i]->set(data     => $data[0],
                   sp       => $list_of_paths[$i],
                   s02      => 'amp',
                   e0       => 'enot',
                   delr     => 'alpha10*reff',
                   sigma2   => 'debye(10, theta) + sigmm',
                  );
   ## paths for data at 150K
   my $j = $i+5;
   $paths[$j] = $paths[$i] -> Clone;
   $paths[$j] -> set(data     => $data[1],
                     delr     => 'alpha150*reff',
                     sigma2   => 'debye(150, theta) + sigmm',
                    );
 };

 ## make a Fit object
 my $fit = Demeter::Fit -> new(gds   => \@gds,
                               data  => \@data,
                               paths => \@paths
                              );
 ## do the fit
 $fit -> fit;

 ## set up plotting parameters
 $data[0]->po->set(plot_data => 1,   plot_fit  => 1,
                   plot_bkg  => 0,   plot_res  => 0,
                   plot_win  => 0,   plot_run  => 0,
				   kweight   => 2,
                  );
 $_->plot('rmr') foreach @data;
 sleep 10;
 $data[0]->pause;
 
  ## write a log file
 my ($header, $footer) = ('', '');
 $fit -> logfile("data/cu_afterfit/cufit.log", $header, $footer);

 $fit -> freeze(file=>"data/cu_afterfit/cu_temperature.dpj");

 $data[0]->save("fit", "data/cu_afterfit/cu_10K.fit");
 $data[1]->save("fit", "data/cu_afterfit/cu_150K.fit");
 
 # The last code line was commented because it throws an error:
 #  Can't locate object method "interview" via package "Demeter::Fit" at
 #  dmtr_62.pl line 89, <F> line 14.
 # $fit -> interview;
 