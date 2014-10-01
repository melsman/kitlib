(** Pretty Printing Library

This library provides pretty-printing support for values that can be
represented as a tree of strings. The library provides operations for
constructing document values, which can then be printed using 'output'
or converted into a string using 'toString'.

A document can be one of three things:

  (1) a LEAF, containing a string which will not be decomposed or 
      split over lines; 
  (2) a NODE with a 'start' string, a 'finish' string, a list of 
      'children', and a 'childsep', which is the separator that will
      be used between children if there are more than two;
  (3) a HNODE, (H for "horizontal") which is similar to a NODE, but
      has no indent field.

A NODE document is printed on one line, if possible. Otherwise, it is
printed by putting the children vertically between the 'start' string
and the 'finish' string.  In the latter case every child is indented
by 'indent' blanks. The 'start' and 'finish' fields can be empty
strings.  Furthermore, when n children are vertically adjacent and the
separator is LEFT, the separator will appear left-adjusted in front of
child 2 to child n and if the separator is RIGHT it will appear
appended to the end of child 1 to child (n-1).

HNODE documents are printed as NODE documents, except that children of
an HNODE each are printed in their flat version (no line breaks inside
any of them), with as many as possible on each line.  This is useful
for printing lists of integers or short strings, for example.  When
raggedRight is turned on, at least one child will be printed on each
line, even if this exceeds the page width.

When a document is printed, a maximum width of the produced output, in
characters, may be specified. The width must be >= 3, so that there
is at least space for printing "..." . The meaning of "..." in the
output is "something goes here, but I don't have the space to show you
what it is".

Users are responsible for putting white space in the start, finish,
and childsep strings to ensure that atoms do not get stuck
together. So, for a local declaration, for instance, start would be
"local ", finish would be " end", and childsep would (probably,
depending on taste) be (LEFT " in ").  LEAF documents do not need
surrounding spaces. The library removes leading spaces from any
childsep or finish string that ends up at the start of a line (such as
" in " or " end" above), to preserve left justification.

Originally written by Mads Tofte, 1989. Modified by Martin Elsman.

*)

signature PPRINT = sig
  datatype sep = NOSEP | LEFT of string | RIGHT of string

  datatype doc = LEAF of string
               | NODE of {start : string, finish: string, indent: int,
                          children: doc list,
                          childsep: sep}
               | HNODE of {start : string, finish: string, 
                           children: doc list,
                           childsep: sep}

  val layout_opt      : ('a -> doc) -> 'a option -> doc
  val layout_pair     : ('a -> doc) -> ('b -> doc) -> 'a * 'b -> doc
  val layout_list     : ('a -> doc) -> 'a list -> doc
  val layout_together : int -> doc list -> doc

  val flatten1        : doc -> string

  val outputDoc'      : (int -> string) -> (string -> unit) -> bool * int -> doc -> unit
  val outputDoc       : (string -> unit) -> bool * int -> doc -> unit
  val printDoc        : bool * int -> doc -> unit

end

(**

[type doc] is the type of documents to be printed. 

[oneLiner d] formats doc to a single string of indefinite length.

[outputDoc pr (raggedRight,w) d] prints the document d with a width of
w characters, calling pr each time a line is to be output; Thus pr is
supposed to output the line (without inserting leading or trailing
newline).

[outputDoc' prWs pr (raggedRight,w) d] prints the document d with a
width of w characters, calling pr each time a line is to be output;
Thus pr is supposed to output the line (without inserting leading or
trailing newline). The function prWs is used to print whitespace
bigger than 64 characters.

*)
