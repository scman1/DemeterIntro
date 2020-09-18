#!/usr/bin/perl
use Demeter;

# Example derived from code published at:
#   https://bruceravel.github.io/demeter/documents/DPG/gds.html#reporting-on-and-annotating-gds-parameters


# DEMETER provides several ways of examining GDS objects. Along with direct
# examination of the attributes, such as bestfit and error, there are several
# kinds of textual reports on the state of the GDS object and its parameter.
# The example shows three of these report

my $amp_param = Demeter::GDS -> new(gds     => 'guess',
                                    name    => 'amp',
                                    mathexp => 1);

# ... some time later, after a fit ...
printf("State of the %s GDS parameter object\n", $amp_param ->name);
printf("Note:\n");
print($amp_param -> note, $/);
printf("Report:\n");
print($amp_param -> report, $/);
printf("Full report:\n");
print($amp_param -> full_report, $/);

# There is the option of annotating a parameter to a user-defined string. When
# explicitly set, the automatic annotation after a fit finishes does not happen.
# The purpose of the annotation is to store a description of the purpose served
# in a fitting model by a parameter. 

# The example shows how to annotate the parameter:

$amp_param -> note("This parameter represents S_0^2.");
printf("State of the %s GDS parameter object after annotation\n", 
       $amp_param ->name);
printf("Note:\n");
print($amp_param -> note, $/);
printf("Report:\n");
print($amp_param -> report, $/);
printf("Full report:\n");
print($amp_param -> full_report, $/);