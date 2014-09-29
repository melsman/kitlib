(* Compatibility module for Standard ML 90. *) 

signature SML90 =
  sig
    val sqrt : real -> real             (* Math *)
    val sin : real -> real
    val cos : real -> real
    val arctan : real -> real
    val exp : real -> real
    val ln : real -> real

    val chr : int -> string             (* Strings *)
    val ord : string -> int
    val explode : string -> string list
    val implode : string list -> string

    exception Abs and Diff and Exp and Floor and Neg and Prod and Sum
      and Mod and Quot and Sqrt and Ln and Ord and Io of string and
      Interrupt

    type instream and outstream         (* Input/output *)

    val std_in : instream
    val open_in : string -> instream
    val input : instream * int -> string
    val lookahead : instream -> string
    val close_in : instream -> unit
    val end_of_stream : instream -> bool
    val std_out : outstream;
    val open_out : string -> outstream
    val output : outstream * string -> unit
    val close_out : outstream -> unit
  end

