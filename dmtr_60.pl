#!/usr/bin/perl
 use Demeter; #qw(:ui=screen);

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
 my $feff = Demeter::Feff -> new(file => "data/atoms.inp");
 $feff -> set(workspace => "data/cu_workspace/", screen => 0,);
 $feff -> potph -> pathfinder;
 my @list_of_paths = $feff-> list_of_paths;

 # ## make GDS objects for an isotropic expansion, correlated Debye model fit to copper
 # my @gds =  (Demeter::GDS -> new(gds => 'guess', name => 'alpha', mathexp => 0),
             # Demeter::GDS -> new(gds => 'guess', name => 'amp',   mathexp => 1),
             # Demeter::GDS -> new(gds => 'guess', name => 'enot',  mathexp => 0),
             # Demeter::GDS -> new(gds => 'guess', name => 'theta', mathexp => 500),
             # Demeter::GDS -> new(gds => 'set',   name => 'temp',  mathexp => 300),
             # Demeter::GDS -> new(gds => 'set',   name => 'sigmm', mathexp => 0.00052),
            # );

 # ## make Path objects for the first 5 paths in copper (3 shell fit)
 # my @paths = ();
 # foreach my $i (0 .. 4) {
   # $paths[$i] = Demeter::Path -> new();
   # $paths[$i]->set(data     => $data,
                   # sp       => $list_of_paths[$i];
                   # s02      => 'amp',
                   # e0       => 'enot',
                   # delr     => 'alpha*reff',
                   # sigma2   => 'debye(temp, theta) + sigmm',
                  # );
 # };

 # ## make a Fit object
 # my $fit = Demeter::Fit -> new(gds   => \@gds,
                               # data  => [$data],
                               # paths => \@paths
                              # );

 # ## do the fit
 # $fit -> fit;

 # ## set up some plotting parameters
 # $data->po->set(plot_data => 1,   plot_fit  => 1,
                # plot_bkg  => 0,   plot_res  => 0,
                # plot_win  => 1,   plot_run  => 1,
                # kweight   => 2,
                # r_pl      => 'r',
               # );
 # $data->plot('r');
 # $data->pause;