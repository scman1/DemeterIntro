 #!/usr/bin/perl
 use Demeter;

# Example derived from code published at:
#   https://bruceravel.github.io/demeter/documents/DPG/data/plot.html

# The plot method typically will overplot data, that is add a new trace to the
# existing plot. If you wish to start a new plot, you must explicitly do so.

# In this example, the plot is cleared before showing next plot.

 my $prj = Demeter::Data::Prj -> new(file=>'data/Fe_standards.prj');
 my ($data1, $data2) = $prj -> records(1,2);
 $_ -> plot('k') foreach ($data1, $data2);
 sleep 3;
 $data1 -> po -> start_plot;
 $_ -> plot('R') foreach ($data1, $data2);
 sleep 3;