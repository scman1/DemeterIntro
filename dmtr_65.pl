 #!/usr/bin/perl
 use Demeter;# qw(:ui=screen :plotwith=gnuplot);

 # Example derived from code published at:
 #   https://bruceravel.github.io/demeter/documents/DPG/examples/methyltin.html
 
 # Topics demonstrated:
 #   - object cloning
 #   - multiple data sets
 #   - multiple k-weights

 ## -------- Import data from a project file
 my $prj = Demeter::Data::Prj->new(file=>'data/methyltin/methyltin.prj');
 my @common = (fft_kmin => 2, fft_kmax => 10.5,
               bft_rmin => 1, bft_rmax => 2.4,
               fit_k1   => 1, fit_k2   => 1,    fit_k3 => 1);
 my $mmt = $prj->record(1);
 $mmt -> set(name => "Monomethyltin trichloride", @common);
 my $dmt = $prj->record(2);
 $dmt -> set(name => "Dimethyltin dichloride", @common);

 ## -------- make a Feff calculation
 my $feff = Demeter::Feff->new(file=>'data/methyltin/methyltin.inp');
 $feff -> set(workspace=>'data/methyltin/feff', screen=>0);
 $feff -> make_workspace;
 $feff -> run;
 my @list = $feff -> list_of_paths;

 ## -------- make some guess parameters
 my @gds = (Demeter::GDS->new(name=>'amp',     gds=>'guess', mathexp=>1),
            Demeter::GDS->new(name=>'enot',    gds=>'guess', mathexp=>0),
            Demeter::GDS->new(name=>'delr_c',  gds=>'guess', mathexp=>0),
            Demeter::GDS->new(name=>'ss_c',    gds=>'guess', mathexp=>0.003),
            Demeter::GDS->new(name=>'delr_cl', gds=>'guess', mathexp=>0),
            Demeter::GDS->new(name=>'ss_cl',   gds=>'guess', mathexp=>0.003),
           );

 ## -------- define some paths
 my @paths = (Demeter::Path->new(name    => "carbon neighbor",
                                 sp      => $list[0],
                                 parent  => $feff,
                                 data    => $dmt,
                                 n       => 2,
                                 s02     => 'amp',
                                 e0      => 'enot',
                                 delr    => 'delr_c',
                                 sigma2  => 'ss_c',),
              Demeter::Path->new(name    => "chlorine neighbor",
                                 sp      => $list[1],
                                 parent  => $feff,
                                 data    => $dmt,
                                 n       => 2,
                                 s02     => 'amp',
                                 e0      => 'enot',
                                 delr    => 'delr_cl',
                                 sigma2  => 'ss_cl',)
             );
 push @paths, $paths[0]->Clone(n=>1, data=>$mmt);
 push @paths, $paths[1]->Clone(n=>3, data=>$mmt);

 ## -------- and fit!
 my $fit = Demeter::Fit->new(data  => [$dmt, $mmt],
                             paths => \@paths,
                             gds   => \@gds);
 $fit -> fit;
 #$fit -> interview;
 ## set up plotting parameters for fit
 $fit-> po -> set(plot_fit =>  1,
                 r_pl     => 'm',
                 kweight  =>  2);
				 
 $mmt-> y_offset(1.0);
 $_  -> plot('r') foreach ($dmt, @paths[0,1],
                          $mmt, @paths[2,3]);
	
 sleep 5;
 $mmt-> pause;
 