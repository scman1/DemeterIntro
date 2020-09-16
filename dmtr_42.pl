 #!/usr/bin/perl
 use Demeter;
 
# Example derived from code published at:
#   https://bruceravel.github.io/demeter/documents/DPG/atoms.html

# The example shows how to manually input data to populate the atoms attribute.
# 

# title YBCO: Y Ba2 Cu3 O7
# space P M M M
# rmax=5.2              a 3.823   b 3.886 c 11.681
# core=cu2
# atom
# ! At.type   x        y       z      tag
   # Y       0.5      0.5     0.5
   # Ba      0.5      0.5     0.184
   # Cu      0        0       0        cu1
   # Cu      0        0       0.356    cu2
   # O       0        0.5     0        o1
   # O       0        0       0.158    o2
   # O       0        0.5     0.379    o3
   # O       0.5      0       0.377    o4

 my $atoms = Demeter::Atoms->new();
 $atoms -> set(a=>3.823, b=>3.886, c=>11.681);
 $atoms -> space('P M M M');
 ## add each site
 $atoms -> push_sites( join("|", 'Y',  0.5, 0.5, 0.5,   'y'  ) );
 $atoms -> push_sites( join("|", 'Ba', 0.5, 0.5, 0.184, 'ba' ) );
 $atoms -> push_sites( join("|", 'Cu', 0.0, 0.0, 0.0,   'cu1') );
 $atoms -> push_sites( join("|", 'Cu', 0.0, 0.0, 0.356, 'cu2') );
 $atoms -> push_sites( join("|", 'O',  0.0, 0.5, 0.0,   'o1' ) );
 $atoms -> push_sites( join("|", 'O',  0.0, 0.0, 0.158, 'o2' ) );
 $atoms -> push_sites( join("|", 'O',  0.0, 0.5, 0.379, 'o3' ) );
 $atoms -> push_sites( join("|", 'O',  0.5, 0.0, 0.377, 'o4' ) );
 $atoms -> core('cu2');
 $atoms -> set(rpath=>5.2, rmax => 8);
 # There are several output targets, which are formatted using templates from
 # the Atoms template set. The output targets, i.e. the arguments of the Write
 # method, that come with DEMETER are: feff6, feff7, feff8, atoms, p1, 
 # absorption, spacegroup, xyz, alchemy, overfull
 my @targets = qw(feff6 feff7 feff8 atoms p1 absorption spacegroup xyz alchemy overfull );
 foreach (@targets) {
  print "$_\n";
  print $atoms->Write($_);
}