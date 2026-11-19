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
  {env:viewt@ype+}
  free_env_func
  ( env: !INV(env)
  , func: (INV(env))-<fun1> void
  ):<>
  ((INV(env))-<fun1> void) = func


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
                        | ~some_error_vt() => ()
                        )
             }
           | ~Succ_vt( v ) =>
             ( case $showtype v of
             | ~None_vt() => assertloc( false)
             | ~Some_vt( some) => assertloc( some = 4)
             )
           )
} where {
  datavtype error_vt = some_error_vt of ()
  vtypedef env_vt = Option_vt( int)
  vtypedef value_t = Result_vt( error_vt, env_vt )
  fn
    do_something
    ( p: !resource_t
    ): void = ()
  val value =
      (
          ( pure( $showtype @( env1, free_env) ) where {
                val env1 = @{ some_field = Some_vt(g0ofg1 4)
                            }
                val free_env =
                      free_env_func
                      ( env1
                      , lam env=<1> {
                          prval _ = $showtype env
                          val () = ( case env.some_field of
                                   | ~None_vt() => ()
                                   | ~Some_vt( _) => ()
                                   )
                        }
                      )
              }
          )
      >>= ( lam env =<fun1> pure ($showtype @(env1, free_env)) where {
              val (env0, free_env0) = env
              val resource = cursorObject()
              val env1 = @{ resource = resource
                          , prev = env0
                          , prev_free = free_env0
                          }
              val free_env =
                    free_env_func
                    ( env1
                    , lam env=<1> {
                        val () = consumeObject( env.resource)
                        val () = env.prev_free env.prev
                      }
                    )
            }
          )
      >>= ( lam env =<fun1>
            ( exceptOption000
              ( env
              , lam env =<1> some_error_vt() where {
                  val (env0, free_env0) = env
                  val () = free_env0 env0
                }
              , lam (env,value) =<1> ($showtype @(env1, free_env)) where {
                  val @(env0, free_env0) = env
                  val @(not_null_resource | ) = value
                  val env1 = @{ not_null_resource = @( not_null_resource | )
                              , prev = env0
                              , prev_free = free_env0
                              }
                  val free_env =
                        free_env_func
                        ( env1
                        , lam env=<1> {
                            val @( not_null_resource | ) = env.not_null_resource
                            val () = env.prev_free env.prev
                          }
                        )
                }
              , ovalue
              )
            ) where {
              val ovalue = ensure_not_null( env.0.resource)
            }
          )
      >>= ( lam env =<fun1>
            ( exceptOption000
              ( env
              , lam env =<1> some_error_vt() where {
                  val (env0, free_env0) = env
                  val () = free_env0 env0
                }
              , lam (env,value) =<1> $showtype @(env1, free_env) where {
                  val @(boss_pf, boss_takeback | ) = value
                  val @(env0, free_env0) = env
                  val env1 =
                        @{ boss_pf = @( boss_pf, boss_takeback | )
                         , prev = env0
                         , prev_free = free_env0
                         }
                  val free_env =
                        free_env_func
                        ( env1
                        , lam env=<1> {
                            val @( boss_pf, boss_takeback | ) = env.boss_pf
                            prval () = boss_takeback boss_pf
                            val () = env.prev_free env.prev
                          }
                        )
                }
              , ovalue
              )
            ) where {
              val ovalue = ensure_boss( env.0.prev.resource)
            }
          )
      >>= ( lam env =<1> pure (Some_vt (g0ofg1 4)) where {
              val (env0, free_env0) = env
              val () = free_env0 env0
            }
          )
      ):value_t
}


implement main0() = {
  val () = test()
}
