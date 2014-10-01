(** Signature specifying a comparison function on values of a given type.
*)

signature ORDER = sig
  type t
  val compare : t * t -> order
end

(**

[t] type of values to be compared.

[compare(a,b)] returns an order value.

*)
