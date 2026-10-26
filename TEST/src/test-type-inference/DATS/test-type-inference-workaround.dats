#include "share/atspre_staload.hats"

#define ATS_DYNLOADFLAG 0

staload "./../SATS/result_vb.sats"
staload _ = "./../DATS/result_vb.dats"

overload pure with pure_result_vt;
overload >>= with clo_bind_result_vt;
infixl 5 >>=

fn
  test(): void = {
  val () = ( case (value:value_t) of
           | ~Fail_vt( reason ) => () where { prval _ = $showtype reason}
           | ~Succ_vt( v ) => assertloc( v.0 = 1 && v.1 = 2 && v.2 = 3)
           )
} where {
  vtypedef value_t = Result_vt( int, @(int, int, int) )
  val value:value_t =
    pure 1
    >>= ( lam v =<cloref1> pure( @( $showtype v, 2) ) )
    >>= ( foo_local where {
            fn
              foo_local
              ( v: @( int, int)
              ):<cloref1> value_t = pure( @( v1, v2, 3) ) where {
              val (v1,v2) = v
            }
          }
        )
}


implement main0() = {
  val () = test()
}
