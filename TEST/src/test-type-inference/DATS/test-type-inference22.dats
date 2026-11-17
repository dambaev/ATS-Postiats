#include "share/atspre_staload.hats"

#define ATS_DYNLOADFLAG 0

staload "./../SATS/result_vb.sats"
staload _ = "./../DATS/result_vb.dats"
staload UN= "prelude/SATS/unsafe.sats"

overload pure with pure_result_vt;
overload >>= with bind_result_vt;
infixl 5 >>=

vtypedef resource_t = Option_vt(int)

fn
  cursorObject
  (
  ):
  resource_t
  = Some_vt(1) // $UN.cast{int}1

fn
  consumeObject
  ( v: resource_t
  ): void =
  ( case v of
  | ~Some_vt( _) => ()
  | ~None_vt() => ()
  )

viewdef not_null_t = ()-<prf> void

fn
  ensure_not_null
  ( res: !resource_t
  ):
  Option_vt( @( not_null_t | )) = Some_vt( @(not_null | )) where {
    extern prfn
      not_null():void
  }

absview boss_v
viewdef boss_takeback_v = (boss_v)-<prf> void

fn
  ensure_boss
  ( res: !resource_t
  ):
  Option_vt( @( boss_v, boss_takeback_v | )) = Some_vt( @(boss_pf(), boss_takeback | )) where {
    extern prfn
      boss_pf():boss_v
    extern prfn
      boss_takeback( boss_v): void
  }

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
  fn
    do_something
    ( p: !resource_t
    ): void = ()
  val clean = lam env =<fun1> pure v1 where {
          val (not_null, boss_pf, boss_takeback | v1, object) = $showtype env
          val () = consumeObject object
          prval () = boss_takeback boss_pf
        }
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
      >>= (( lam env =<fun1> pure ( $showtype @( env, cursorObject()))
          ))
      >>= (( lam env =<fun1>
             ( exceptOption000
               ( env1
               , lam env0 =<1> v1 where {
                   val @(v1, object) = $showtype env0
                   val () = consumeObject ($showtype object)
                 }
               , lam (env0, value)=<1> $showtype env1 where {
                   val @(v1, object) = $showtype env0
                   val @( not_null | ) = $showtype value
                   val env1 = @( not_null | v1, object)
                 }
               , ovalue
               )
             ) where {
               val @(v1, object) = ($showtype env)
               val ovalue = ensure_not_null( object)
               val env1 = @(v1, object)
            }
          ))
      >>= (( lam env =<fun1>
             ( exceptOption000
               ( env1
               , lam env0 =<1> v1 where {
                   val @( not_null | v1, object) = env0
                   val () = consumeObject object
                 }
               , lam (env0, value)=> env1 where {
                   val @(not_null | v1, object) = $showtype env0
                   val ( boss_pf, boss_takeback | ) = $showtype value
                   val env1 = @( not_null, boss_pf, boss_takeback | v1, object)
                 }
               , ovalue
               )
             ) where {
               val @(not_null | v1, object) = ($showtype env)
               prval () = not_null ()
               val ovalue = ensure_boss( object)
               val env1 = @(not_null | v1, object)
            }
          ))
      >>= clean
    ):value_t
}


implement main0() = {
  val () = test()
}
