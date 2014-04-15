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
    "<script>" <scriptcontents> "</script>" 
  }

  rule child {
    | <script>
    | <element> 
    | <text>
  }

  regex text {
    [ \w | \s ]+
  }

  rule attribute {
    <name> '=' <quote> [^$<quote>] $<quote> 
  }

  regex scriptcontents {
    .+ <?before "</script>"> 
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
