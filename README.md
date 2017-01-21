## kitlib

_A collection of Standard ML libraries_

-----

The collection of libraries are organised in mlb-files, each of which
exports a number of signatures, functors, and structures. Identifiers
follow the naming convention that signatures are fully capitalized,
whereas functors and structures start with a capital letter (functors
below are denoted with an `f` in parenthesis, and structures with an `s` in cases of ambiguity).

 MLB file   | modules
 -----------|----------
 `base/base.mlb` | ORDER
 `finmap/finmap.mlb` | MONO_FINMAP, IntFinMap, StringFinMap, OrderFinMap (f)
 `hashtable/hashtable.mlb` | POLYHASH, Polyhash
 `listsort/listsort.mlb` | LISTSORT, Listsort
 `md5/md5.mlb` | MD5, Md5
 `pickle/pickle.mlb` | PICKLE, Pickle
 `pprint/pprint.mlb` | PPRINT, PPrint
 `random/random.mlb` | RANDOM, Random
 `regexp/regexp.mlb` | REG_EXP, RegExp
 `set/set.mlb` | MONO_SET, IntSet, NatSet, StringSet, OrderSet (f)
 `sml90/sml90.mlb` | SML90, SML90 (s)
 `susp/susp.mlb` | SUSP, Susp
 `uref/uref.mlb` | UREF, Uref
 `utest/utest.mlb` | UTEST, Utest

License
======
See the [LICENSE](LICENSE) file for an overview.





