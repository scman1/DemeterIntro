#!/usr/bin/perl
use Demeter;

# Example derived from code published at:
#   https://bruceravel.github.io/demeter/documents/DPG/gds.html

# In DEMETER, every part of a fit is an object. The same is true of the
# parameters of the fit. DEMETER allows defining new GDS parameter objects.

# A new guess parameter is defined as follows.
my $new_param = Demeter::GDS->new(gds     => 'guess',
                                  name    => 'deltar',
                                  mathexp => 0.0);

printf("New GDS object:\n");
printf ( "\tgds = %s\n\tname = %s\n\tmathexp = %s\n",
         $new_param->gds, $new_param->name, $new_param->mathexp);

# gds, name, and mathexp are normal attributes of the GDS object and can be
# treated like attributes of any object. For instance, the following line
# changes the starting value of the deltar parameter.
$new_param->mathexp(0.025);
printf("Modified GDS object:\n");
printf ( "\tgds = %s\n\tname = %s\n\tmathexp = %s\n",
         $new_param->gds, $new_param->name, $new_param->mathexp);

# The following example shows a def parameter that takes an actual math
# expression	 
$new_param = Demeter::GDS->new(gds     => 'def',
                               name    => 'c',
                               mathexp => '(a + b) * tan(angle/2) / (a - b)');
							   
printf("GDS parameter object that takes a math expression:\n");
printf("\tgds = %s\n\tname = %s\n\tmathexp = %s\n",
         $new_param->gds, $new_param->name, $new_param->mathexp);


my $a_param = $new_param->simpleGDS('guess deltar = 0.0');

printf("GDS parameter created using simplified interface:\n");
printf("\tgds = %s\n\tname = %s\n\tmathexp = %s\n",
         $a_param->gds, $a_param->name, $a_param->mathexp);

printf("Full report:\n");
print($new_param -> full_report, $/);

printf("Full report:\n");
print($a_param -> full_report, $/);