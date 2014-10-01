
structure StringSet : MONO_SET =
  OrderSet(struct type t = string
                  open String
           end)
