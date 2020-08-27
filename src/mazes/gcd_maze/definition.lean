import tactic

-- start in room 0
-- need to find our way to room gcd(a,b)

/-- Solver docs : Terms of type `maze` are rooms in the game. -/


@[derive has_reflect]
inductive direction : Type
| north | east | south | west

namespace maze

/-
ABC
DEF
GHI
-/

section parameter_a_b

parameters (a b : ℕ)

@[reducible] definition maze := ℤ 

instance : has_coe ℤ (maze) := ⟨id⟩


/-- north = +a, south = -a, east = +b, west = -b-/
def go (d : direction) (m : maze) : maze :=
direction.rec_on d
  -- go north = add 8  
  (m + a)
    -- go east = add 3
  (m + b)
  -- go south = subtract 8
  (m - a)
  -- go west = subtract 3
  (m - b)

/-- The predicate of being able to escape from the maze -/
inductive can_escape : maze → Prop
| exit : can_escape (nat.gcd a b)
| go : ∀ d x, can_escape (go d x) → can_escape x

end parameter_a_b

end maze

open maze direction

open tactic

meta def go (d : direction) : tactic unit :=
`[apply can_escape.go %%d, unfold maze.go, norm_num,
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
