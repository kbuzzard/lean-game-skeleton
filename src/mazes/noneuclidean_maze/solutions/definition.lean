import tactic
/-
 WWW
WABCW
WDEFW
WGHIW
 WWW

and secret room J

-- start in room A
-- have to find the secret and get to room J
-- W is a temp wall room which we never go into.

Can people write computer programs in Lean which solve
levels like this?

Can people write computer programs in Python which design
levels like this?

The below is Lean 3 code. 
Can stuff like this be made to work in Lean 4? I have
Lean 4 working on my laptop, it's usable, but you have
to learn the emacs interface. Is there any way to make
this easier for people wanting to transition from VS Code?
-/

/-- Solver docs : Terms of type `maze` are rooms in the game. -/
inductive maze : Type
| A /- start -/
| B | C | D | E | F | G | H | I -- other rooms
| J -- exit room
| W /- temp wall term for when a player hits a wall-/

@[derive has_reflect]
inductive direction : Type
| north | east | south | west

namespace maze

/-
ABC
DEF
GHI
-/

/-- This is basically the map of the maze -/
def go (d : direction) (m : maze) : maze :=
direction.rec_on d
  (maze.rec_on m W W W A B C D E F J W)
  (maze.rec_on m B C W E F W H I W J W)
  (maze.rec_on m D E F G H I W W W J W)
  (maze.rec_on m W A B W D E W J H J W)

/-- The predicate of being able to escape from the maze -/
inductive can_escape : maze → Prop
| exit : can_escape J
| go : ∀ d x, can_escape (go d x) → can_escape x

end maze

open maze direction

open tactic

meta def go (d : direction) : tactic unit :=
`[apply can_escape.go %%d, unfold maze.go,
fail_if_success { guard_target can_escape W } <|> fail "You hit a wall!" ]

meta def tactic.interactive.n := `[go north]
meta def tactic.interactive.s := `[go south]
meta def tactic.interactive.e := `[go east]
meta def tactic.interactive.w := `[go west]

open tactic

meta def out : tactic unit :=
`[apply can_escape.exit <|> fail "you are not at the exit level J"]


-- theorem solve : can_escape A :=
-- begin
--   s,
--   sorry,
-- end

-- I have no solver
-- meta def xyzzy : tactic unit := sorry
-- --`[ {e,n,e,e,out} <|> {n,e,e,out} <|> {e,e,out} <|> {e,out} <|> {out} ]
