#include "share/atspre_staload.hats"

#define ATS_DYNLOADFLAG 0

staload "./../SATS/result_vb.sats"

overload pure with pure_result_vt;
overload >>= with clo_bind_result_vt;
infixl 5 >>=

fn
  test(): void = {
  val () = ( case value of
           | ~Fail_vt( reason ) => ()
           | ~Succ_vt( v ) => assertloc( v.0 = 1 && v.1 = 2 && v.2 = 3)
           )
} where {
  val value:Result_vt( int, @(int, int, int) ) =
    pure 1
    >>= ( lam v =<cloref1> pure( @( v, 2) ) )
    >>= ( lam v =<cloref1> pure( @( v1, v2, 3) ) where { val @(v1, v2) = $showtype v})
}


implement main0() = {
  val () = test()
}
