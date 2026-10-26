#include "share/atspre_staload.hats"

#define ATS_DYNLOADFLAG 0

staload "./../SATS/result_vb.sats"
staload _ = "./../DATS/result_vb.dats"
staload UN= "prelude/SATS/unsafe.sats"

overload pure with pure_result_vt;
overload >>= with bind_result_vt;
infixl 5 >>=

fn
  cursorObject
  (
  ):
  Option_vt( int)
  = Some_vt( 1)
fn
  do_something
  ( p: !Option_vt(int)
  ): void = ()

fn
  test(): void = {
  val () = ( case $showtype value of
           | ~Fail_vt( reason ) => println!("Fail_vt") where {
               val () = ( case reason of
                        | ~None_vt() => ()
                        | ~Some_vt( some ) => ()
                        )
             }
           | ~Succ_vt( v ) =>
             ( case $showtype v of
             | ~None_vt() => assertloc( false)
             | ~Some_vt( some) => assertloc( some = 4)
             )
           )
} where {
  vtypedef value_t = Result_vt( Option_vt(int), Option_vt( int ) )
  val value:value_t =
    (
          pure 1
      >>= ( lam v =<fun1> pure( @( $showtype v, 2) ) )
      >>= ( lam v =<fun1> pure( @( v1, v2, 3) ) where { val @(v1, v2) = $showtype v})
      >>= ( lam v =<fun1> pure( @( v1, v2, v3, Some_vt 4, Some_vt 5) ) where { val @(v1, v2, v3) = v})
      >>= ( lam v =<fun1> pure( v4) where {
              val @(v1, v2, v3, v4, v5) = v
              val () = ( case v5 of
                       | ~None_vt() => ()
                       | ~Some_vt( _ ) => ()
                       )
            }
          )
      >>= ( lam env =<fun1> pure ( $showtype @( env, cursorObject()))
          )
      >>= ( lam env =<fun1> pure ($showtype ret) where {
              val @(v1, object) = ($showtype env)
              val () = do_something( object)
              val ret = @(v1, object)
            }
          )
      >>= ( lam env =<fun1> pure v1 where {
              val (v1, object) = $showtype env
              val () = ( case object of
                       | ~None_vt() => ()
                       | ~Some_vt( _ ) => ()
                       )
            }
          )
    ):value_t
}


implement main0() = {
  val () = test()
}
