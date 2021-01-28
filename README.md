# Demeter Intro
 The scripts included here follow the Demeter programming guide ([DPG](https://bruceravel.github.io/demeter/documents/DPG/index.html)). Not all examples are replicated because not all the sample files can be found easily. When posible, example files are substituted with equivalents from the [Demeter examples](https://github.com/bruceravel/demeter/tree/master/examples/data).


The following tables are provided to link the scripts and the corresponding
sections of the [DPG](https://bruceravel.github.io/demeter/documents/DPG/index.html)
that was used to create them.

[μ(E) data files.](https://bruceravel.github.io/demeter/documents/DPG/data/mue.html) 
The basic form of data import is from a column data file with the first and 
second columns including energy and μ(E). In that case, the data has already 
been processed from its raw form and saved in this immediately useful form.

Script     | Example                   | File         | File used
-------    | -------------             |------------- | -----  
[dmtr_01.pl](https://github.com/scman1/DemeterIntro/blob/master/dmtr_01.pl) | 2. The basics of data processing |None| 
[dmtr_02.pl](https://github.com/scman1/DemeterIntro/blob/master/dmtr_02.pl) | 2.1. μ(E) data files      | fe.060.dat |
[dmtr_03.pl](https://github.com/scman1/DemeterIntro/blob/master/dmtr_03.pl) | 2.1. μ(E) data files      | fe.060.dat |
[dmtr_04.pl](https://github.com/scman1/DemeterIntro/blob/master/dmtr_04.pl) | 2.1.1. Setting attributes | fe.060.dat |

[χ(k) data files.](https://bruceravel.github.io/demeter/documents/DPG/data/chi.html)
χ(k) data is data that have already been processed to have the background 
removed and to be properly normalized.  This is allowed, but is strongly 
discouraged. Many features of DEMETER that are nominally related to the χ(k)
data still make use of earlier aspects of the data processing. Note also that 
data that are imported as χ(k) cannot be plotted in energy.

Script     | Example                   | File         | File used
-------    | -------------             |------------- | -----  
[dmtr_05.pl](https://github.com/scman1/DemeterIntro/blob/master/dmtr_05.pl) | 2.2. χ(k) data files | cu10k.chi |


[Column data files.](https://bruceravel.github.io/demeter/documents/DPG/data/columns.html)
DEMETER assumes that your data are in columns when importing raw data from a 
beamline. DEMETER also assumes that one of the columns represents energy, and 
that two or more of the remaining columns represent signals on the various 
detectors. You must explicitly specify which column is which when you define the
Data object.

Script     | Example                   | File         | File used
-------    | -------------             |------------- | -----  
[dmtr_06.pl](https://github.com/scman1/DemeterIntro/blob/master/dmtr_06.pl) | 2.3.1. Transmission data | fe.060.dat |


[Athena project files.](https://bruceravel.github.io/demeter/documents/DPG/data/athena.html)
The most convenient method for importing data into a DEMETER program is to 
import directly from an ATHENA project file. Presumably, you have already used 
ATHENA to process your μ(E) data into an analysis-ready form. When data are 
imported from a project file, all the attributes of the Data object will be set
using the values found in the project file.

Script     | Example                   | File         | File used
-------    | -------------             |------------- | -----  
[dmtr_07.pl](https://github.com/scman1/DemeterIntro/blob/master/dmtr_07.pl) | 2.4.1. Creating Data objects|iron_data.prj| Fe_standards.prj
[dmtr_08.pl](https://github.com/scman1/DemeterIntro/blob/master/dmtr_08.pl) | 2.4.1. Creating Data objects|iron_data.prj| Fe_standards.prj
[dmtr_09.pl](https://github.com/scman1/DemeterIntro/blob/master/dmtr_09.pl) | 2.4.1. Creating Data objects|iron_data.prj| Fe_standards.prj
[dmtr_10.pl](https://github.com/scman1/DemeterIntro/blob/master/dmtr_10.pl) | 2.4.2. Obtaining other information from project files |iron_data.prj| Fe_standards.prj


[Multichannel data files.](https://bruceravel.github.io/demeter/documents/DPG/data/mc.html)
Multi-channel data objects (Data::MultiChannel) are created to avoid repeatedly
creating temporary arrays when data files contain multiple columns of data that 
can be independently processed as μ(E) data.

Script     | Example                   | File         | File used
-------    | -------------             |------------- | -----  
[dmtr_11.pl](https://github.com/scman1/DemeterIntro/blob/master/dmtr_11.pl) | 2.5.2. Importing data and reference|fe2o3.000|Fe_pyrite.000
[dmtr_12.pl](https://github.com/scman1/DemeterIntro/blob/master/dmtr_12.pl) | 2.5.3. Multicolumn transmission data|None|Fe_pyrite.000

[2.6. Special data types.](https://bruceravel.github.io/demeter/documents/DPG/data/special.html)
Beamline data wich cannot be read directly can be imported into DEMETER using 
filetype plugins. 

Script     | Example                   | File         | File used
-------    | -------------             |------------- | -----  
[dmtr_13.pl](https://github.com/scman1/DemeterIntro/blob/master/dmtr_13.pl) | 2.6.1. Filetype plugins         | file_from_x15b.001 | s_x15b.dat

[Plotting and basic processing.](https://bruceravel.github.io/demeter/documents/DPG/data/plot.html)
DEMETER allows the visualisation of data in the form of plots. These are grouped
in four spaces: energy, k, R and back-transform k.

Script     | Example                   | File         | File used
-------    | -------------             |------------- | -----  
[dmtr_14.pl](https://github.com/scman1/DemeterIntro/blob/master/dmtr_14.pl) | 2.8.1 Types of plots            | None               | fe.060.xmu
[dmtr_15.pl](https://github.com/scman1/DemeterIntro/blob/master/dmtr_15.pl) | 2.8.2 Plotting and overplotting | cu10k.chi      |  
[dmtr_16.pl](https://github.com/scman1/DemeterIntro/blob/master/dmtr_16.pl) | 2.8.3. The singlefile plotting backend | iron_data.prj      | Fe_standards.prj 

[Aligning Data.](https://bruceravel.github.io/demeter/documents/DPG/mue/align.html)
DEMETER uses a simple alignment algorithm:
 - Chose a Data object is chosen as the alignment standard, The standard is one 
   that doesn't move 
 - Align other data to the standard by applying an E0 shift. 
 - Compute The derivative spectrum for both the standard and the data. An E0 
   shift and an overall amplitude are the variable parameters used to fit the 
   data to the standard. 
 - Discard amplitude value, and set the fitted E0 shift the bkg_eshift attribute 
   of the aligned data.

The algorithm works well for good quality data. Although, even for very good 
data. However, if data starts many volts out of alignment, the fit is likely to 
find a false minimum. In these cases, the bkg_eshift attribute needs to be sety 
by hand to something close, before calling the align method.

Script     | Example                   | File         | File used
-------    | -------------             |------------- | -----  
[dmtr_17.pl](https://github.com/scman1/DemeterIntro/blob/master/dmtr_17.pl) | 3.1. Aligning Data   | U_DNA.prj    | Fe_standards.prj 
[dmtr_18.pl](https://github.com/scman1/DemeterIntro/blob/master/dmtr_18.pl) | 3.1. Aligning Data   | U_DNA.prj    | Fe_standards.prj 

[Merging data.](https://bruceravel.github.io/demeter/documents/DPG/mue/merge.html)
Merging data is one of the essential data processing steps. 


Script     | Example                   | File         | File used
-------    | -------------             |------------- | -----  
[dmtr_19.pl](https://github.com/scman1/DemeterIntro/blob/master/dmtr_19.pl) | 3.2.1. Plot merged data with standard deviation   | U_DNA.prj|cyanobacteria.prj 
[dmtr_20.pl](https://github.com/scman1/DemeterIntro/blob/master/dmtr_20.pl) | 3.2.1. Plot merged data with variance  | U_DNA.prj|cyanobacteria.prj 

[Deglitching data.](https://bruceravel.github.io/demeter/documents/DPG/mue/deglitch.html)
"Deglitching" is the process of removing spurious points from data. This is an 
arbitrary procedure as There is no obvious definition of what consititutes a 
spurious data point.

Script     | Example                   | File         | File used
-------    | -------------             |------------- | -----  
[dmtr_21.pl](https://github.com/scman1/DemeterIntro/blob/master/dmtr_21.pl) | 3.3. Deglitching data | uhup.003 |

[Truncating data.](https://bruceravel.github.io/demeter/documents/DPG/mue/truncate.html)
Truncating is the process of removing data from one end or the other of a data 
set. The Truncate method takes two arguments: (1) either of the words 'before'
or 'after', to indicate whether data is to be removed from the front or back of
the data; (2) the energy value before/after which all data points are removed.

Script     | Example                   | File         | File used
-------    | -------------             |------------- | -----  
[dmtr_22.pl](https://github.com/scman1/DemeterIntro/blob/master/dmtr_22.pl) | 3.4. Truncating data | fe.060 |

The Plot object is used to control the details of how plots are made and 
displayed by DEMETER. The po method is a method of the base class inherited by 
all DEMETER objects and makes the Plot object readily accessible at all times in 
your program.

[Plotting in energy.](https://bruceravel.github.io/demeter/documents/DPG/highlevel/plot.html#plotting-in-energy)

Script     | Example                   | File         | File used
-------    | -------------             |------------- | -----  
[dmtr_23.pl](https://github.com/scman1/DemeterIntro/blob/master/dmtr_23.pl) | 4.4.1.1. Data, background, pre-edge, & post-edge || fe.060 
[dmtr_24.pl](https://github.com/scman1/DemeterIntro/blob/master/dmtr_24.pl) | 4.4.1.2. Normalized data & background | |fe.060 
[dmtr_25.pl](https://github.com/scman1/DemeterIntro/blob/master/dmtr_25.pl) | 4.4.1.3. Flattened data & background | |fe.060 
[dmtr_26.pl](https://github.com/scman1/DemeterIntro/blob/master/dmtr_26.pl) | 4.4.1.4. Derivative of mu | |fe.060 
[dmtr_27.pl](https://github.com/scman1/DemeterIntro/blob/master/dmtr_27.pl) | 4.4.1.5. Data, I0 channel, & signal channel | |fe.060 
[dmtr_28.pl](https://github.com/scman1/DemeterIntro/blob/master/dmtr_28.pl) | 4.4.1.6. Data at two different edges with E0 subtracted || fe.060.xmu, cu010k.dat 

[Plotting in k.](https://bruceravel.github.io/demeter/documents/DPG/highlevel/plot.html#plotting-in-k)

Script     | Example                   | File         | File used
-------    | -------------             |------------- | -----  
[dmtr_29.pl](https://github.com/scman1/DemeterIntro/blob/master/dmtr_29.pl) | 4.4.2.1. Plotting in k-space || cyanobacteria.prj  
[dmtr_30.pl](https://github.com/scman1/DemeterIntro/blob/master/dmtr_30.pl) | 4.4.2.2. Plotting in chi(k) in energy || fe.060  
[dmtr_31.pl](https://github.com/scman1/DemeterIntro/blob/master/dmtr_31.pl) | 4.4.2.3. k-space with all three k-weights || cyanobacteria.prj  

[Plotting in R.](https://bruceravel.github.io/demeter/documents/DPG/highlevel/plot.html#plotting-in-r)

Script     | Example                   | File         | File used
-------    | -------------             |------------- | -----  
[dmtr_32.pl](https://github.com/scman1/DemeterIntro/blob/master/dmtr_32.pl) | 4.4.3.1. Magnitude in R-space & R-space window | | fe.060   
[dmtr_33.pl](https://github.com/scman1/DemeterIntro/blob/master/dmtr_33.pl) | 4.4.3.2. Data in R-space as envelope, real part, & imaginary part |  |fe.060   
[dmtr_34.pl](https://github.com/scman1/DemeterIntro/blob/master/dmtr_34.pl) | 4.4.3.3. R-space with all three k-weights |     | cyanobacteria.prj
[dmtr_35.pl](https://github.com/scman1/DemeterIntro/blob/master/dmtr_35.pl) | 4.4.3.4. Magnitude and real part in R space |    | cyanobacteria.prj

[Plotting in q.](https://bruceravel.github.io/demeter/documents/DPG/highlevel/plot.html#plotting-in-r)

Script     | Example                   | File         | File used
-------    | -------------             |------------- | -----  
[dmtr_36.pl](https://github.com/scman1/DemeterIntro/blob/master/dmtr_36.pl) | 4.4.4.1. Plotting in back-transform k-space | | cyanobacteria.prj   
[dmtr_37.pl](https://github.com/scman1/DemeterIntro/blob/master/dmtr_37.pl) | 4.4.4.2. k-space & the real part of back-transform k-space |  |cyanobacteria.prj   

## XANES data

Script     | Example                   | File         | File used
-------    | -------------             |------------- | -----  
[dmtr_38.pl](https://github.com/scman1/DemeterIntro/blob/master/dmtr_38.pl) | [Linear combination fitting](https://bruceravel.github.io/demeter/documents/DPG/xanes/lcf.html) | cyanobacteria.prj | 

## Atoms

Script     | Example                   | File         | File used
-------    | -------------             |------------- | -----  
[dmtr_39.pl](https://github.com/scman1/DemeterIntro/blob/master/dmtr_39.pl) | [Input crystal data (inp)](https://bruceravel.github.io/demeter/documents/DPG/atoms.html#input-crystal-data)|ybco.inp|ybco-atoms.inp
[dmtr_40.pl](https://github.com/scman1/DemeterIntro/blob/master/dmtr_40.pl) | [Input crystal data (cif2)](https://bruceravel.github.io/demeter/documents/DPG/atoms.html#input-crystal-data)|AuCl.cif|
[dmtr_41.pl](https://github.com/scman1/DemeterIntro/blob/master/dmtr_41.pl) | [Manually inputing crystal data](https://bruceravel.github.io/demeter/documents/DPG/atoms.html#manually-inputing-crystal-data)||
[dmtr_42.pl](https://github.com/scman1/DemeterIntro/blob/master/dmtr_42.pl) | [Output targets](https://bruceravel.github.io/demeter/documents/DPG/atoms.html#output)||

## Feff

Script     | Example                   | File         | File used
-------    | -------------             |------------- | -----  
[dmtr_43.pl](https://github.com/scman1/DemeterIntro/blob/master/dmtr_43.pl) | [Starting from a conventional feff.inp file](https://bruceravel.github.io/demeter/documents/DPG/feff/input.html#starting-from-a-conventional-feff-inp-file)|feff.inp|
[dmtr_44.pl](https://github.com/scman1/DemeterIntro/blob/master/dmtr_44.pl) | [Starting from an atoms object](https://bruceravel.github.io/demeter/documents/DPG/feff/input.html#starting-from-an-atoms-object)|atoms.inp|
[dmtr_45.pl](https://github.com/scman1/DemeterIntro/blob/master/dmtr_45.pl) | [Computing potentials](https://bruceravel.github.io/demeter/documents/DPG/feff/potph.html)|feff.inp|
[dmtr_46.pl](https://github.com/scman1/DemeterIntro/blob/master/dmtr_46.pl) | [Path finder](https://bruceravel.github.io/demeter/documents/DPG/feff/pathfinder.html)|feff.inp|
[dmtr_47.pl](https://github.com/scman1/DemeterIntro/blob/master/dmtr_47.pl) | [Path finder](https://bruceravel.github.io/demeter/documents/DPG/feff/pathfinder.html)|feff.inp|
[dmtr_48.pl](https://github.com/scman1/DemeterIntro/blob/master/dmtr_48.pl) | [Path interpretation](https://bruceravel.github.io/demeter/documents/DPG/feff/intrp.html)|feff.inp|
[dmtr_49.pl](https://github.com/scman1/DemeterIntro/blob/master/dmtr_49.pl) | [Path interpretation](https://bruceravel.github.io/demeter/documents/DPG/feff/intrp.html)|feff.yaml|

## Scattering paths

Script     | Example                   | File         | File used
-------    | -------------             |------------- | -----  
[dmtr_50.pl](https://github.com/scman1/DemeterIntro/blob/master/dmtr_50.pl) | [Calculating individual scattering path](https://bruceravel.github.io/demeter/documents/DPG/paths/paths.html#calculating-individual-scattering-paths)|feff.inp|
[dmtr_51.pl](https://github.com/scman1/DemeterIntro/blob/master/dmtr_51.pl) | [Writing feffNNNN.dat files](https://bruceravel.github.io/demeter/documents/DPG/paths/paths.html#writing-feffnnnn-dat-files)|feff.yaml|
[dmtr_52.pl](https://github.com/scman1/DemeterIntro/blob/master/dmtr_52.pl) | [Examining the degenerate paths](https://bruceravel.github.io/demeter/documents/DPG/paths/paths.html#examining-the-degenerate-paths)|feff.yaml|
[dmtr_53.pl](https://github.com/scman1/DemeterIntro/blob/master/dmtr_53.pl) | [Semantic path descriptions](https://bruceravel.github.io/demeter/documents/DPG/paths/semantic.html#semantic-path-descriptions)|feff.yaml|
[dmtr_54.pl](https://github.com/scman1/DemeterIntro/blob/master/dmtr_54.pl) | [Path parameters](https://bruceravel.github.io/demeter/documents/DPG/paths/pathparams.html)|feff.yaml|
[dmtr_55.pl](https://github.com/scman1/DemeterIntro/blob/master/dmtr_55.pl) | [Plotting individual paths](https://bruceravel.github.io/demeter/documents/DPG/paths/plot.html)|feff.yaml, athena.prj|feff.yaml, HgDNA.prj
[dmtr_56.pl](https://github.com/scman1/DemeterIntro/blob/master/dmtr_56.pl) | [Running Feff outside of Demeter](https://bruceravel.github.io/demeter/documents/DPG/paths/existing.html)|feff0001.dat|feff0001.dat
[dmtr_57.pl](https://github.com/scman1/DemeterIntro/blob/master/dmtr_57.pl) | [Running Feff outside of Demeter](https://bruceravel.github.io/demeter/documents/DPG/paths/existing.html)|feff0001.dat|feff0001.dat, HgDNA.prj

## Guess/Def/Set (GDS) Parameters
Script     | Example                   | File         | File used
-------    | -------------             |------------- | -----  
[dmtr_58.pl](https://github.com/scman1/DemeterIntro/blob/master/dmtr_58.pl) | [Guess/Def/Set Parameters](https://bruceravel.github.io/demeter/documents/DPG/gds.html)||
[dmtr_59.pl](https://github.com/scman1/DemeterIntro/blob/master/dmtr_59.pl) | [Reporting on and annotating GDS parameters](https://bruceravel.github.io/demeter/documents/DPG/gds.html#reporting-on-and-annotating-gds-parameters)||

## Fitting EXAFS data
Script     | Example                   | File         | File used
-------    | -------------             |------------- | -----  
[dmtr_60.pl](https://github.com/scman1/DemeterIntro/blob/master/dmtr_60.pl) | [Fitting EXAFS data](https://bruceravel.github.io/demeter/documents/DPG/fit/index.html)|cu_data.prj, cu_metal.inp|cu.prj, atoms.inp
[dmtr_61.pl](https://github.com/scman1/DemeterIntro/blob/master/dmtr_61.pl) | [Multiple dataset fitting](https://bruceravel.github.io/demeter/documents/DPG/fit/collection.html#multiple-data-set-fitting)|cu_data.prj, cu_metal.inp|cu.prj, atoms.inp
[dmtr_62.pl](https://github.com/scman1/DemeterIntro/blob/master/dmtr_62.pl) | [After a fit](https://bruceravel.github.io/demeter/documents/DPG/fit/after.html)|cu_data.prj, cu_metal.inp|cu.prj, atoms.inp

## Using perl structures
Script     | Example                   | File         | File used
-------    | -------------             |------------- | -----  
[dmtr_63.pl](https://github.com/scman1/DemeterIntro/blob/master/dmtr_63.pl) |[Using perl to structure a fit](https://bruceravel.github.io/demeter/documents/DPG/perl.html)|iron_data.prj|Fe_standards.prj

## Using perl structures
Script     | Example                   | File         | File used
-------    | -------------             |------------- | -----  
[dmtr_64.pl](https://github.com/scman1/DemeterIntro/blob/master/dmtr_64.pl) |[Local guess parameters and the characteristic value](https://bruceravel.github.io/demeter/documents/DPG/lgcv.html)|cu_data.prj, cu_metal.inp|cu.prj, atoms.inp

## Full Examples
Script     | Example                   | File         | File used
-------    | -------------             |------------- | -----  
[dmtr_65.pl](https://github.com/scman1/DemeterIntro/blob/master/dmtr_65.pl) |[Methylin chloride](https://bruceravel.github.io/demeter/documents/DPG/examples/methyltin.html)|methyltin.prj, methyltin.inp|


## Notes and Issues

This project uses Demeter 0.9.25 with Strawberry Perl(32). The latest 64bit version and earlier 64bit versions throw a compilation error when adding a dll. This is latest version which works with windows 10 and the command line.

To execute the scripts it is required to run command as an administrator. Otherwise, you will get an error message

Processing sections 3.5 to 3.10 are missing (marked as todo)

| Issue                            | Cause                                      | Checked on|
| -------------                    |-------------                               | -----     |
| Cannot run Demeter 0.9.26 (64)   | Perl fails loading IFFEFIT dll             | 20200910  |
| Cannot run last plotting example (2.8.3) | Issues with Term::Twiddle and Time::HiRes  | 20200914  |
| Output of example is binary not serialised text (7.3) | -  | 20200916  |

# Acknowledgements and Funding
For more details about the of the motivation for the development of the resources
in this repository see:
[UK Catalysis Hub Core Theme](https://ukcatalysishub.co.uk/core/).

UK Catalysis Hub supports the development of this repository, funded by
EPSRC grants:  EP/R026939/1, EP/R026815/1, EP/R026645/1, EP/R027129/1,
and EP/M013219/1(biocatalysis))
