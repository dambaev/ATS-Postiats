#include "share/atspre_staload.hats"

#define ATS_DYNLOADFLAG 0


implement main0() = {
  val () = println!("success")
  val v = @( 1, 2, 3)
  val () = assertloc( v.0 = 1 && v.1 = 2 && v.2 = 3)
}
