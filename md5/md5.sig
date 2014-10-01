(** MD5 Message-Digest Algorithm.

Copyright (C) 2001 Daniel Wang. All rights reserved.

Derived from the RSA Data Security, Inc. Taken from the MLton whole
program Standard ML compiler; see the file
../doc/license/MLton-LICENSE for license information.
*)

signature MD5 = sig
  type md5state
  val init        : md5state
  val update      : (md5state * Word8Vector.vector) -> md5state
  val final       : md5state -> Word8Vector.vector
  val toHexString : Word8Vector.vector -> string
  val fromString  : string -> string
  val fromFile    : string -> string
end

(**
[md5state] type of an md5 state.

[init] is the initial md5state.

[update(m,v)] returns a digest for v based on m.

[final m] returns a word8 vector representing the digest m.

[toHexString v] returns a string representing the word8-vector
representation v of a digest.

[fromString s] returns a string representation of a digest of s.

[fromFile f] returns a string representation of a digest of the
content of the file f. May raise Fail.
*)
