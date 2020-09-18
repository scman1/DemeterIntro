#!/usr/bin/perl
 use Demeter; #qw(:ui=screen);
 
 # Example derived from code published at:
 #   https://bruceravel.github.io/demeter/documents/DPG/fit/index.html
 
 # This example a builds on the previous fitting EXAFS data example, extending 
 # the isotropic expansion and correlated Debye fitting model to a simultaneous
 # refinement of two data sets.
 
 # The modifications to the previous example are:
 # - Two records are imported from the ATHENA project file and their parameters
 #   set appropriately (on lines 37-45).
 # - The temp GDS object is not defined in the @gds group (on lines 55-61). It 
 #   is instead explicitly set to the correct value on lines 73 and 80.
 # - Both Data objects are supplied to the Fit object (on line 86). This is the 
 #   fundamental difference between a single and multiple data set fit – the 
 #   number of items in the Fit object's data attribute.
 # - A set of Path objects is set up and associated with the Data objects on 
 #   lines 65-82). Path objects are set up for the 10K data as in the previous
 #   example on lines 67-74. Each Path object is cloned on line 77,
 #   returning a new Path object with the same attributes that added to the
 #   @paths list.do the counting correctly. An then the parameters needed the
 #   150K data set are set to their new values on lines 76-81. 
 
 # Note that the sp atrtibute is not changed for the cloned paths. This is 
 # central to DEMETER's efficient use of FEFF. The same ScatteringPath object
 # is used for the Path object associated with the 10 K Data object and for the
 # Path object associated with the 150 K Data object. This is conceptually
 # equivalent to using the same feffNNNN.dat file in two different path 
 # paragraphs in a FEFFIT input file.
 
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
 $feff -> set(workspace => "data/cu_multi/", screen => 0,);
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
 