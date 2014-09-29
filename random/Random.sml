(* Random -- Moscow ML library 1995-04-23 *)

structure Random : RANDOM =
  struct

    (* Generating random numbers.  Paulson, page 96 *)

    fun getrealtime() : {sec : int, usec : int} =
        let val t = Time.now()
            val r = Time.toReal t
            val s = Real.floor r
            val us = Real.floor (1000.0 * (r - real s))
        in {sec=s, usec=us}
        end

    type generator = {seedref : real ref}

    val a = 16807.0 
    val m = 2147483647.0 
    fun nextrand seed = let val t = a*seed 
			in t - m * real(floor(t/m)) 
			end

    fun newgenseed seed = {seedref = ref (nextrand seed)}

    fun newgen () =
      let val {sec, usec} = getrealtime ()
      in newgenseed (real sec + real usec) 
      end
      
(*
    fun newgen () =
      let (*val {sec, usec} = Time.now ()*)
	val now = Time.now ()
      in (*newgenseed (real sec + real usec) *)
(*	newgenseed (real(Time.toMicroseconds now)) *)  (* raises Overflow; ME 1998-10-20*)
	newgenseed (Time.toReal now)
      end
*)
    fun random {seedref as ref seed} = (seedref := nextrand seed; seed / m)

    fun randomlist (n, {seedref as ref seed0}) = 
      let fun h 0 seed res = (seedref := seed; res)
	    | h i seed res = h (i-1) (nextrand seed) (seed / m :: res)
      in h n seed0 [] 
      end

    fun range (min, max) = 
      if min >= max then raise Fail "Random.range: empty range" 
      else fn {seedref as ref seed} =>
	   (seedref := nextrand seed; min + (floor(real(max-min) * seed / m)))

    fun rangelist (min, max) =
      if min >= max then raise Fail "Random.rangelist: empty range" 
      else fn (n, {seedref as ref seed0}) => 
	   let fun h 0 seed res = (seedref := seed; res)
		 | h i seed res = h (i-1) (nextrand seed) 
	                    (min + floor(real(max-min) * seed / m) :: res)
	   in h n seed0 [] 
	   end
  end
