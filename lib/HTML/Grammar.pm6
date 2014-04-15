#!/usr/bin/env perl6
use Grammar::Tracer;

grammar HTML::Grammar {
  rule TOP {
    ^
      <doctype>?
      <root=element>
    $
  }

  regex doctype {
    '<!DOCTYPE ' [^\>]+ '>'
  }

  rule element {
    '<' <name=tag> <attribute>*
    [
      | '/>'
      | '>' <child>* '</' $<name> '>'
    ]
  }

  rule script {
    '<script' <attribute>* 
    [
      | '/>'
      | '>' <scriptcontents> '</script>'
      | '>' <space> '</script>'
    ]
  }

  rule child {
    | <element> 
    | <script>
    | <text>
  }

  regex text {
    [ \w | \s ]+
  }

  rule attribute {
    <name> '=' <quote> [^$<quote>] $<quote> 
  }

  regex scriptcontents {
    [ . | \r | \n ]+
  }

  token quote {
    [\'\"]
  }

  token space {
    [ \s ]*
  }

  token tag {
    <name>+
    { $<name> ne 'script' }
  }

  token name {
    [ \w | \- ]+
  }

};
