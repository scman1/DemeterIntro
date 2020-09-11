#!/usr/bin/perl
use Demeter;

# code snippet from https://bruceravel.github.io/demeter/documents/DPG/data/columns.html

# Example importing column data (XAS data)
# DEMETER assumes that your data are in columns, that one of the columns 
# represents energy, and that two or more of the remaining columns represent 
# signals on the various detectors. You must explicitly specify which column is
# which when you define the Data object.

 my $data = Demeter::Data -> new();
 $data -> set(file        => "data/fe.060.dat",
              name        => 'Fe 60K',
              energy      => '$1', # column 1 is energy
              numerator   => '$2', # column 2 is I0
              denominator => '$3', # column 3 is It
              ln          => 1,    # these are transmission data
             );
 $data -> plot('E');