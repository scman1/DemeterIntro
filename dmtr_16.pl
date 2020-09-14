 #!/usr/bin/perl
 use Demeter qw(:ui=screen);

# Example derived from code published at:
#   https://bruceravel.github.io/demeter/documents/DPG/data/plot.html

# The single plotting backend allows replicating a plot. Does not work with 
# version 25. hs issues with a library called Term::Twiddle, which in turn 
# has a problem calling Time::HiRes (20200914).

 print "Sample fit to copper data demonstrating the singlefile plotting backend.\n";

 my $data = Demeter::Data -> new();
 $data->set_mode(screen  => 0, backend => 1);
 $data ->set(file       => "data/cu10k.chi",
             fft_kmin   => 3,        fft_kmax   => 14,
             fit_space  => 'r',
             fit_k1     => 1,        fit_k3     => 1,
             bft_rmin   => 1.6,      bft_rmax   => 4.3,
             fit_do_bkg => 0,
             name       => 'My copper data',
            );

 my @gds =  (Demeter::GDS -> new(gds => 'guess', name => 'alpha', mathexp => 0),
             Demeter::GDS -> new(gds => 'guess', name => 'amp',   mathexp => 1),
             Demeter::GDS -> new(gds => 'guess', name => 'enot',  mathexp => 0),
             Demeter::GDS -> new(gds => 'guess', name => 'theta', mathexp => 500),
             Demeter::GDS -> new(gds => 'set',   name => 'temp',  mathexp => 300),
             Demeter::GDS -> new(gds => 'set',   name => 'sigmm', mathexp => 0.00052),
            );

 my $feff = Demeter::Feff->new(file=>'../../cu/orig.inp', screen=>0, workspace=>'temp/');
 $feff -> rmax(5);
 $feff -> run;
 my @sp = @{ $feff->pathlist };

 my @paths = ();
 foreach my $i (0 .. 4) {
   $paths[$i] = Demeter::Path -> new();
   $paths[$i]->set(data     => $data,
                   sp       => $sp[$i],
                   s02      => 'amp',
                   e0       => 'enot',
                   delr     => 'alpha*reff',
                   sigma2   => 'debye(temp, theta) + sigmm',
                  );
 };

 my $fit = Demeter::Fit -> new(gds   => \@gds,
                               data  => [$data],
                               paths => \@paths
                              );

 $fit -> fit;

 ## plot normally using gnuplot
 $data->po->set(plot_data => 1, plot_fit  => 1,
                plot_bkg  => 0, plot_res  => 0,
                plot_win  => 1, plot_run  => 0,
                kweight   => 2,
                r_pl      => 'm', 'q_pl'    => 'r',
               );
 $data->po->space('R');
 $data -> plot_with('gnuplot');
 my $step = 0;  # stack the plot interestingly...
 foreach my $obj ($data, @paths,) {
     $obj -> plot;
     $step -= 0.8;
     $data -> y_offset($step);
 };
 $data -> y_offset(0);
 $data -> pause;

 ## replicate that plot in a single file
 $data->plot_with('singlefile');           # 1: switch to single file backend
 $data -> po -> prep(file=>'nifty_plot.dat', standard=>$data, space=>'R');

 $step = 0;
 foreach my $obj ($data, @paths,) {        # 5: make the plot
     $obj -> plot;
     $step -= 0.8;
     $data -> y_offset($step);
 };
 $data -> y_offset(0);
 $data -> po -> finish;
 $data -> unset_standard;