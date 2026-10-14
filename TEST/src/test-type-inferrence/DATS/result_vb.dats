staload "./../SATS/result_vb.sats"

#define ATS_DYNLOADFLAG 0
#define ATS_PACKNAME "result_vb"
#define ATS_EXTERN_PREFIX "result_vb_"


implement {succ}{fail}pure_result_vt( v) = Succ_vt( v)

implement {a}{fail}{b}bind_result_vt( env, func) =
  case env of
  | ~Fail_vt( some ) => Fail_vt( some)
  | ~Succ_vt( some ) => func( some)

implement {a}{fail}{b}clo_bind_result_vt( env, func) =
  case env of
  | ~Fail_vt( some ) => Fail_vt( some)
  | ~Succ_vt( some ) => func( some)

implement {a}{fail}{b}clo_bind0_result_vt( env, func) =
  case env of
  | ~Fail_vt( some ) => Fail_vt( some)
  | ~Succ_vt( _ ) => func( )

implement
  {env0}
  {env1}
  {a}
  {fail}
  {b}
  bind_env_result_vt( value, func) =
  case value of
  | ~Fail_vt( some ) => Fail_vt( some)
  | ~Succ_vt( some ) => func( some )

implement
  {env0}
  {env1}
  {a}
  {fail}
  {b}
  clo_bind_env_result_vt( value, func) =
  ( case value of
  | ~Fail_vt( some ) => Fail_vt( some)
  | ~Succ_vt( some ) => func( some )
  )

implement {a}{fail}{b}lift( env, value) =
  case value of
  | ~Fail_vt( some) => Fail_vt( @( env, some))
  | ~Succ_vt( some) => Succ_vt( @( env, some))

implement
  {env}
  {a}
  {fail}
  {b}
  unlift( value, func) = lift( env, func( some)) where {
  val ( env, some) = value
}

implement {a}{env}{fail}{b}withExcept{fe}( arg, fail_func, next ) =
( case ret of
| ~Fail_vt( some) => Fail_vt( @( env, fail_func( some)))
| ~Succ_vt( some) => Succ_vt( @( env, some))
) where {
    val ( env, value) = arg
    val ret = next( value)
  }

implement
  {a}
  {b}
  {fail}
  withExcept0{fe}( value, fail_func, next ) =
( case ret of
| ~Fail_vt( some) => Fail_vt( fail_func( some))
| ~Succ_vt( some) => Succ_vt( some)
) where {
    val ret = next( value)
  }

implement {a}{b}{fail}withExcept00{fe}( fail_func, next ) =
( case next of
| ~Fail_vt( some) => Fail_vt( fail_func( some))
| ~Succ_vt( some) => Succ_vt( some)
)

implement {a}{b}{fail}exceptOption0{fe}( value, fail_func, next ) =
( case ret of
| ~None_vt() => Fail_vt( fail_func( ))
| ~Some_vt( some) => Succ_vt( some)
) where {
    val ret = next( value)
  }

implement {b}{fail}exceptOption00( fail_func, next ) =
( case next of
| ~None_vt() => Fail_vt( fail_func( ))
| ~Some_vt( some) => Succ_vt( some)
)

implement {env}{a}{b}{fail}exceptOption000{fe}(env, fail, next, value) =
( case value of
| ~Some_vt( next_val ) => Succ_vt( next( env, next_val) )
| ~None_vt() => Fail_vt( fail( env))
)

implement main() = ()
