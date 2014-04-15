#!/usr/bin/env perl6

use lib './lib';
use HTML::Grammar;

my $basic = q{
<html>
  <test>data</test>
  <data></data>
  <ul>
    <li> bullshit </li>
    <li> li 2 </li>
    <li> <ul> <li> sub li </li> </ul> </li>
  </ul>
</html>
};

my $script = "
  <html>
    <head>
      <script>
        var a = { a: 5 }; 
        
        
        
      </script>
    </head>
  </html>
";

$script.say;
#HTML::Grammar.parse($basic).say;
HTML::Grammar.parse($script).say;

#HTML::Grammar.parse(slurp './S05.html').say;
