 #!/usr/bin/perl
 use Demeter;# qw(:ui=screen);
 
 # Example derived from code published at:
 #   https://bruceravel.github.io/demeter/documents/DPG/lgcv.html
 
 # DEMETER offers two high level tools for parametrizing fits, particularly
 # multiple data set fits. These are called "local guess parameters" and the 
 # "characteristic value". 
 # This example is a modified version of the multi-fit to copper metal using
 # these two tools.

 # The cv values set as 10 and 150 (lines 40 and 41) correspond to the 
 # "characteristic value" for each data set. The cv is a user-defined number
 # that somehow relates to the XAS data contained in the Data object. In this
 # case, it is the temperature at which each data were measured.
 
 # The cv is then used at part of each Path's name (line 65) and as the
 # temperature argument to the debye function (line 69).
 # As DEMETER digs through the collection of Paths in the Fit object, it
 # will notice the use of the characteristic value and substitute in the
 # value of cv of the associated Data object
 
 # A new kind of GDS parameter is defined as lguess, or “local guess” (line 51).
 # The lguess parameter is a token that tells DEMETER to create a guess
 # parameter for every Data object which has a Path which uses it. In this
 # example, alpha is intended to represent the volumetric expansion coefficient
 # of the copper lattice at each temperature. We want to allow this volumetric
 # coefficient to float freely for each data set.

 my @common = (fft_kmin   => 3,    fft_kmax   => 14,
               bft_rmax   => 1.0,  bft_rmax   => 4.3,
               fit_k1     => 1,    fit_k3     => 1,);
 
 ## import an Athena project file with copper metal in it
 my $prj = Demeter::Data::Prj->new(file=>'data/cu.prj');
 
 ## make a Data object and set the FT and fit parameters
 my ($data_010k, $data_150k) = $prj->records(1, 2);
 $data_010k -> set(name=>'10 K copper data',  cv=>10,  @common);
 $data_150k -> set(name=>'150 K copper data', cv=>150, @common);

 ## run a Feff calculation on copper metal
 my $atoms = Demeter::Atoms -> new(file => 'data/atoms.inp');
 my $feff = Demeter::Feff -> new(atoms => $atoms);
 $feff -> set(workspace => "data/cu_lgcv/", screen => 0,);
 $feff -> potph -> pathfinder;
 my @list_of_paths = $feff -> list_of_paths;

 ## define a set of parameters
 my @gds =  (Demeter::GDS -> new(gds => 'lguess', name => 'alpha', mathexp => 0),
             Demeter::GDS -> new(gds => 'guess',  name => 'amp',   mathexp => 1),
             Demeter::GDS -> new(gds => 'guess',  name => 'enot',  mathexp => 0),
             Demeter::GDS -> new(gds => 'guess',  name => 'theta', mathexp => 500),
             Demeter::GDS -> new(gds => 'set',    name => 'sigmm', mathexp => 0.0005),
            );

 # assign paths to the first data set
 my @paths_010k = ();
 foreach my $i (0 .. 4) {
   my $j = $i+1;
   $paths_010k[$i] = Demeter::Path -> new();
   $paths_010k[$i]->set(data     => $data_010k,
                        sp       => $list_of_paths[$i],
                        name     => "[cv]K, path $j",
                        s02      => 'amp',
                        e0       => 'enot',
                        delr     => 'alpha*reff',
                        sigma2   => 'debye([cv], theta) + sigmm',
                       );
 };

 ## clone all the paths from the first data set and assign them to the second
 my @paths_150k = ();
 foreach my $i (0 .. 4) {
   my $j = $i+1;
   $paths_150k[$i] = $paths_010k[$i] -> Clone(data => $data_150k);
 };

 ## do the fit
 my $fitobject = Demeter::Fit -> new(gds   => \@gds,
                                     data  => [$data_010k, $data_150k],
                                     paths => [@paths_010k, @paths_150k],
                                    );
									

 $fitobject->fit;
 ## set up common plotting parameters
 my @plot_common = (plot_data => 1,   plot_fit  => 1,
                    plot_bkg  => 0,   plot_res  => 0,
                    plot_win  => 0,   plot_run  => 0,
				    kweight   => 2,);
 $data_010k->po->set(@plot_common);
 $data_150k->po->set(@plot_common);
 $data_010k->plot('rmr');
 $data_150k->plot('rmr');
 sleep 5;
 