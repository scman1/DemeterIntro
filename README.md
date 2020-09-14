# Demeter Intro
 The scripts included here follow the Demeter programming guide ([DPG](https://bruceravel.github.io/demeter/documents/DPG/index.html)). Not all examples are replicated because not all the sample files can be found easily. When posible, example files are substituted with equivalents from the [Demeter examples](https://github.com/bruceravel/demeter/tree/master/examples/data).
 
## Note

This project uses Demeter 9.25 with Strawberry Perl(32). The latest 64bit version and earlier 64bit versions throw a compilation error when adding a dll. This is latest version which works with windows 10 and the command line.

To execute the scripts it is required to run command as an administrator. Otherwise, you will get an error message

| Issue                            | Cause                                      | Checked on|
| -------------                    |-------------                               | -----     |
| Cannot run Demeter 0.9.26 (64)   | Perl fails loading IFFEFIT dll             | 20200910  |
| Cannot run last plotting example | Issues with Term::Twiddle and Time::HiRes  | 20200914  |
