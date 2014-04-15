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

my $script = q{
  <html>
    <head>
      <script>
        var a = 5;
        while(a<10){
          a++;
        };
      </script>
    </head>
  </html>
};

#HTML::Grammar.parse($basic).say;
HTML::Grammar.parse($script).say;

#HTML::Grammar.parse(slurp './S05.html').say;
