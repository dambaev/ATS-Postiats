#include "share/atspre_staload.hats"

#define ATS_DYNLOADFLAG 0

staload "./../SATS/result_vb.sats"
staload _ = "./../DATS/result_vb.dats"

overload pure with pure_result_vt;
overload >>= with bind_result_vt;
infixl 5 >>=

fn
  test(): void = {
  val () = ( case $showtype value of
           | ~Fail_vt( reason ) => () where { val v = $showtype reason}
           | ~Succ_vt( v ) => assertloc( v.0 = 1 && v.1 = 2 && v.2 = 3 && v.3 = 4)
           )
} where {
  vtypedef value_t = Result_vt( int, @(int, int, int, int) )
  val value:(Result_vt(int, @(int,int,int,int))) =
    (
          pure 1
      >>= ( lam v =<fun1> pure( @( $showtype v, 2) ) )
      >>= ( lam v =<fun1> pure( @( v1, v2, 3) ) where { val @(v1, v2) = $showtype v})
      >>= ( lam v =<fun1> pure( @( v1, v2, v3, 4) ) where { val @(v1, v2, v3) = v})
    ):value_t
}


implement main0() = {
  val () = test()
}
