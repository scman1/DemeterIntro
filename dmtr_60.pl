#!/usr/bin/perl
 use Demeter; #qw(:ui=screen);
 
 # Example derived from code published at:
 #   https://bruceravel.github.io/demeter/documents/DPG/fit/index.html
 
 # This is a complete fitting EXAFS data example.
 # In this example, data on a copper foil are fit using a model considering
 # isotropic expansion and a correlated Debye model.
 
 # Everything up to line 68 has been covered on previous examples from the DPG.
 # - An ATHENA project file is imported on line 27.
 # - A record from that project file is imported into a Data obejct on line 30
 # - The parameters of the Data object are set on lines 31-36.
 # - A FEFF calculation is made on lines 39-42. Note the use of chained method 
 #   calls on line 42. 
 # - The path list is extracted as a separate object for convenience on line 43.
 # - An array containing guess and set parameters that will be used to set up a
 #   simple fitting model is defined on lines 46-52. The fitting model consists  
 #   of an amplitude term, an E0 shift, an isotropic expnasion model for ΔR for 
 #   each path, and a correlated Debye model for σ2 for each path.
 # - Path objects are defined on lines 55-66, using the ScatteringPath objects
 #   from the FEFF calculation. The path parameters are assigned math 
 #   expressions through GDS parameters.

 ## import an Athena project file with copper metal in it
 my $prj = Demeter::Data::Prj->new(file=>'data/cu.prj');

 ## make a Data object and set the FT and fit parameters
 my $data = $prj->record(1);
 $data ->set(name       => 'My copper data',
             fft_kmin   => 3,        fft_kmax   => 14,
             fit_k1     => 1,        fit_k3     => 1,
             bft_rmin   => 1.6,      bft_rmax   => 4.3,
             fit_do_bkg => 0,
            );

 ## run a Feff calculation on copper metal
 my $atoms = Demeter::Atoms -> new(file => 'data/atoms.inp');
 my $feff = Demeter::Feff -> new(atoms => $atoms);
 $feff -> set(workspace => "data/cu_workspace/", screen => 0,);
 $feff -> potph -> pathfinder; # could have used '$feff->run' instead
 my @list_of_paths = $feff-> list_of_paths;

 ## make GDS objects for an isotropic expansion, correlated Debye model fit to copper
 my @gds =  (Demeter::GDS -> new(gds => 'guess', name => 'alpha', mathexp => 0),
             Demeter::GDS -> new(gds => 'guess', name => 'amp',   mathexp => 1),
             Demeter::GDS -> new(gds => 'guess', name => 'enot',  mathexp => 0),
             Demeter::GDS -> new(gds => 'guess', name => 'theta', mathexp => 500),
             Demeter::GDS -> new(gds => 'set',   name => 'temp',  mathexp => 300),
             Demeter::GDS -> new(gds => 'set',   name => 'sigmm', mathexp => 0.00052),
            );

 ## make Path objects for the first 5 paths in copper (3 shell fit)
 my @paths = ();
 # NOTE: in this example feff is not explicitly asigned to the path objects
 foreach my $i (0 .. 4) {
   $paths[$i] = Demeter::Path -> new();
   $paths[$i]->set(data     => $data,
                   sp       => $list_of_paths[$i],
                   s02      => 'amp',
                   e0       => 'enot',
                   delr     => 'alpha*reff',
                   sigma2   => 'debye(temp, theta) + sigmm',
                  );
 };

 # The fitting process is performed on lines 75-80. A Fit object is defined as a
 # collection of GDS, Data, and Path objects. Those three attributes of the Fit 
 # object take an anonymous array (on line 76) or references to named arrays (on
 # lines 75 and 77). 
 # The call to the $fit object's fit method (on line 80) perfoms the fit.
 
 ## make a Fit object
 my $fit = Demeter::Fit -> new(gds   => \@gds,
                               data  => [$data],
                               paths => \@paths
                              );
 ## do the fit
 $fit -> fit;

 ## set up plotting parameters
 $data->po->set(plot_data => 1,   plot_fit  => 1,
                plot_bkg  => 0,   plot_res  => 0,
                plot_win  => 1,   plot_run  => 1,
                kweight   => 2,
                r_pl      => 'r',
               );
 $data->plot('r');
 sleep 10;
 $data->pause;
 