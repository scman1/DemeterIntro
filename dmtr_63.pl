 #!/usr/bin/perl
 use Demeter;

 # Example derived from code published at:
 #   https://bruceravel.github.io/demeter/documents/DPG/perl.html
 
 # It is  helpful to use perl's data and control structures when precessing
 # large quatities of data. In this example, a list of attribute names and
 # values common to all Data objects is defined on lines 14-17 and it is then
 # assigned to each Data object on line 22, before plotting. 
 # Because attributes are updated, the plot will trigger all appropriate data
 # processing steps for each data set.

 my @params = (bkg_pre1    => -30,  bkg_pre2    => -150,
               bkg_nor1    => 150,  bkg_nor2    => 1757.5,
               bkg_spl1    => 0.5,  bkg_spl2    => 22,
               fft_kmax    => 3,    fft_kmin    => 14,);

 my $prj = Demeter::Data::Prj -> new(file=>'data/Fe_standards.prj');
 my ($data1, $data2) = $prj -> records(1,2);
 foreach my $obj ($data1, $data2) {
    $obj -> set(@params);
    $obj -> plot('R');
	sleep 3;
 };