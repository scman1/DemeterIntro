# Demeter Intro
 The scripts included here follow the Demeter programming guide ([DPG](https://bruceravel.github.io/demeter/documents/DPG/index.html)). Not all examples are replicated because not all the sample files can be found easily. When posible, example files are substituted with equivalents from the [Demeter examples](https://github.com/bruceravel/demeter/tree/master/examples/data).


List of scripts and the examples they come from
Script     | Example                   | File         | File used
-------    | -------------             |------------- | -----  
dmtr_01.pl | 2. The basics of data processing |None| 
dmtr_02.pl | 2.1. μ(E) data files      | fe.060.dat |
dmtr_03.pl | 2.1. μ(E) data files      | fe.060.dat |
dmtr_04.pl | 2.1.1. Setting attributes | fe.060.dat |
dmtr_05.pl | 2.2. χ(k) data files | cu10k.chi |
dmtr_06.pl | 2.3.1. Transmission data | fe.060.dat |
dmtr_07.pl | 2.4.1. Creating Data objects|iron_data.prj| Fe_standards.prj
dmtr_08.pl | 2.4.1. Creating Data objects|iron_data.prj| Fe_standards.prj
dmtr_09.pl | 2.4.1. Creating Data objects|iron_data.prj| Fe_standards.prj
dmtr_10.pl | 2.4.2. Obtaining other information from project files |iron_data.prj| Fe_standards.prj
dmtr_11.pl | 2.5.2. Importing data and reference|fe2o3.000|Fe_pyrite.000
dmtr_12.pl | 2.5.3. Multicolumn transmission data|None|Fe_pyrite.000
dmtr_13.pl| 2.6.1. Filetype plugins         | file_from_x15b.001 | s_x15b.dat
dmtr_14.pl| 2.8.1 Types of plots            | None               | fe.060.xmu
dmtr_15.pl| 2.8.2 Plotting and overplotting | cu10k.chi      |  
dmtr_16.pl| 2.8.3. The singlefile plotting backend | iron_data.prj      | Fe_standards.prj 
dmtr_17.pl| 3.1. Aligning Data   | U_DNA.prj    | Fe_standards.prj 
dmtr_18.pl| 3.1. Aligning Data   | U_DNA.prj    | Fe_standards.prj 
dmtr_19.pl| 3.2.1. Plot merged data with standard deviation   | U_DNA.prj|cyanobacteria.prj 
dmtr_20.pl| 3.2.1. Plot merged data with variance  | U_DNA.prj|cyanobacteria.prj 
dmtr_21.pl| 3.3. Deglitching data | uhup.003 |
dmtr_22.pl| 3.4. Truncating data | fe.060 |
dmtr_23.pl| 4.4.1.1. Data, background, pre-edge, & post-edge | fe.060 |
dmtr_24.pl| 4.4.1.2. Normalized data & background | fe.060 |
dmtr_25.pl| 4.4.1.3. Flattened data & background | fe.060 |
dmtr_26.pl| 4.4.1.4. Derivative of mu | fe.060 |
dmtr_27.pl| 4.4.1.5. Data, I0 channel, & signal channel | fe.060 |
dmtr_28.pl| 4.4.1.6. Data at two different edges with E0 subtracted | fe.060.xmu, cu010k.dat |
dmtr_29.pl| 4.4.2.1. Plotting in k-space | cyanobacteria.prj  |
dmtr_30.pl| 4.4.2.2. Plotting in chi(k) in energy | fe.060  |
dmtr_31.pl| 4.4.2.3. k-space with all three k-weights | cyanobacteria.prj  |

## Notes and Issues

This project uses Demeter 0.9.25 with Strawberry Perl(32). The latest 64bit version and earlier 64bit versions throw a compilation error when adding a dll. This is latest version which works with windows 10 and the command line.

To execute the scripts it is required to run command as an administrator. Otherwise, you will get an error message

Processing sections 3.5 to 3.10 are missing (marked as todo)


| Issue                            | Cause                                      | Checked on|
| -------------                    |-------------                               | -----     |
| Cannot run Demeter 0.9.26 (64)   | Perl fails loading IFFEFIT dll             | 20200910  |
| Cannot run last plotting example (2.8.3) | Issues with Term::Twiddle and Time::HiRes  | 20200914  |



