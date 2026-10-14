(* This library is an analogue to Haskell's ByteString library
*)
#define ATS_DYNLOADFLAG 0
#define ATS_PACKNAME "result_vb"
#define ATS_EXTERN_PREFIX "result_vb_"

dataview result_vb(c:bool, a:view+,b: view+) =
  | fail_vb(false, a, b) of a
  | succ_vb(true, a, b) of b

praxi
  result_vb_unsucc
  {a,b:viewt@ype+}
  ( x: !result_vb( true, INV(a), INV(b)) >> b
  ):<prf> void

praxi
  result_vb_unfail
  {a,b:viewt@ype+}
  ( x: !result_vb( false, INV(a), INV(b)) >> a
  ):<prf> void

praxi
  result_vb_fail
  {a,b:viewt@ype+}
  ( x: !INV(a) >> result_vb( false, INV(a), INV(b))
  ):<prf> void

praxi
  result_vb_succ
  {a,b:viewt@ype+}
  ( x: !INV(a) >> result_vb( true, INV(a), INV(b))
  ):<prf> void

dataviewtype Result_vt( fail: viewt@ype+, succ: viewt@ype+) =
  | Fail_vt( fail, succ) of fail
  | Succ_vt( fail, succ) of succ

fn
  {succ:viewt@ype+}
  {fail:viewt@ype+}
  pure_result_vt
  ( v: INV(succ)
  ):<>
  Result_vt( fail, succ)

fn
  {a:viewt@ype+}
  {fail:viewt@ype+}
  {b:viewt@ype+}
  bind_result_vt
  {fe:eff}
  ( value: Result_vt( INV(fail), INV(a))
  , next: (INV(a))-<fe> Result_vt( INV(fail), INV(b))
  ):<fe>
  Result_vt( INV(fail), INV(b))

fn
  {a:viewt@ype+}
  {fail:viewt@ype+}
  {b:viewt@ype+}
  clo_bind_result_vt
  {fe:eff}
  ( value: Result_vt( INV(fail), INV(a))
  , next: (INV(a))-<cloref,fe> Result_vt( INV(fail), INV(b))
  ):<fe>
  Result_vt( INV(fail), INV(b))

fn
  {a:t@ype+}
  {fail:viewt@ype+}
  {b:viewt@ype+}
  clo_bind0_result_vt
  {fe:eff}
  ( value: Result_vt( INV(fail), INV(a))
  , next: ()-<fe> Result_vt( fail, b)
  ):<fe>
  Result_vt( INV(fail), INV(b))

fn
  {env0:viewt@ype+}
  {env1:viewt@ype+}
  {a:viewt@ype+}
  {fail:viewt@ype+}
  {b:viewt@ype+}
  bind_env_result_vt
  {fe:eff}
  ( value: Result_vt( @(INV(env0), INV(fail))
                    , @(INV(env0), INV(a))
                    )
  , next: ( @(INV(env0), INV(a)) )-<fe>
    Result_vt( @(INV(env0), INV(fail))
             , @(INV(env1), INV(b))
             )
  ):<fe>
  Result_vt( @(INV(env0), INV(fail))
           , @(INV(env1), INV(b))
           )

fn
  {env0:viewt@ype+}
  {env1:viewt@ype+}
  {a:viewt@ype+}
  {fail:viewt@ype+}
  {b:viewt@ype+}
  clo_bind_env_result_vt
  {fe:eff}
  ( value: Result_vt( @(INV(env0), INV(fail))
                    , @(INV(env0), INV(a))
                    )
  , next: ( @(INV(env0), INV(a)) )-<cloref,fe>
    Result_vt( @(INV(env0), INV(fail))
             , @(INV(env1), INV(b))
             )
  ):<fe>
  Result_vt( @(INV(env0), INV(fail))
           , @(INV(env1), INV(b))
           )

fn
  {env:viewt@ype+}
  {fail:viewt@ype+}
  {succ:viewt@ype+}
  lift
  ( env: INV(env)
  , Result_vt
    ( INV(fail)
    , INV(succ)
    )
  ):<>
  Result_vt
    ( @( INV(env), INV(fail))
    , @( INV(env), INV(succ))
    )

fn
  {env:viewt@ype+}
  {a:viewt@ype+}
  {fail:viewt@ype+}
  {b:viewt@ype+}
  unlift
  {fe:eff}
  ( value:  @(INV(env), INV(a))
  , next: ( INV(a) )-<fe>
    Result_vt( INV(fail)
             , INV(b)
             )
  ):<fe>
  Result_vt( @(INV(env), INV(fail))
           , @(INV(env), INV(b))
           )

fn
  {a:viewt@ype+}
  {env:viewt@ype+}
  {b:viewt@ype+}
  {fail:viewt@ype+}
  withExcept
  {fe:eff}
  ( value: @( INV(env), INV(a))
  , fail: (INV(a))-<> INV(fail)
  , next: ( INV(a) )-<fe> Result_vt( INV(a) , INV(b))
  ):<fe>
  Result_vt( @( INV(env), INV(fail))
           , @( INV(env), INV(b))
           )

fn
  {a:viewt@ype+}
  {b:viewt@ype+}
  {fail:viewt@ype+}
  withExcept0
  {fe:eff}
  ( value: INV(a)
  , fail: (INV(a))-<> INV(fail)
  , next: ( INV(a) )-<fe> Result_vt( INV(a) , INV(b))
  ):<fe>
  Result_vt( INV(fail)
           , INV(b)
           )

fn
  {a:viewt@ype+}
  {b:viewt@ype+}
  {fail:viewt@ype+}
  withExcept00
  {fe:eff}
  ( fail: (INV(a))-<> INV(fail)
  , next: Result_vt( INV(a) , INV(b))
  ):<fe>
  Result_vt( INV(fail)
           , INV(b)
           )

fn
  {a:viewt@ype+}
  {b:viewt@ype+}
  {fail:viewt@ype+}
  exceptOption0
  {fe:eff}
  ( value: INV(a)
  , fail: ()-<> INV(fail)
  , next: ( INV(a) )-<fe> Option_vt( INV(b))
  ):<fe>
  Result_vt( INV(fail)
           , INV(b)
           )

fn
  {env:viewt@ype+}
  {b:viewt@ype+}
  {a:viewt@ype+}
  {fail:viewt@ype+}
  exceptOption000
  {fe:eff}
  ( env: INV(env)
  , fail: (INV(env))-<fe> INV(fail)
  , next: ( INV(env), INV(a) )-<fe> INV(b)
  , value: INV(Option_vt( INV(a)))
  ):<fe>
  Result_vt( INV(fail)
           , INV(b)
           )

fn
  {b:viewt@ype+}
  {fail:viewt@ype+}
  exceptOption00
  ( fail: ()-<> INV(fail)
  , next: Option_vt( INV(b))
  ):<>
  Result_vt( INV(fail)
           , INV(b)
           )


fn main():void
