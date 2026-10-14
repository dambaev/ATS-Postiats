#include "share/atspre_staload.hats"

#define ATS_DYNLOADFLAG 0

staload "./../SATS/result_vb.sats"

overload pure with pure_result_vt;
overload >>= with clo_bind_result_vt;
infixl 5 >>=

fn
  test(): void =
  ( case (value:value_t) of
  | ~Fail_vt( reason:int ) => ()
  | ~Succ_vt( v ) => assertloc( v.0 = 1 && v.1 = 2 && v.2 = 3) where {
    prval _ = $showtype v
  }
  ) where {
  vtypedef value_t = Result_vt( int, @(int, int, int) )
  val value: value_t = Succ_vt ( @( 1, 2, 3))
}


implement main0() = {
  val () = test()
}
