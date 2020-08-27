/-
The asterisks are fire.

******  
**234*
*01***
****


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
def maze := ℕ 
-- Lean remarks:
-- this definition is an implementation detail.
-- This type will be made irreducible at the end.

-- Let's now make the interface for `maze`.
namespace maze

def mk (n : ℕ) : maze := n

/-
******  
**234*
*01***
****
-/

/-- The map. Interface will be unknown to player -/
inductive can_escape : maze → Prop
-- exit is room 4
| have_escaped : can_escape $ mk 4
-- fire is room 5.
-- think of it as "is north of"
| N0 : can_escape (mk 5) → can_escape (mk 0)
| N1 : can_escape (mk 2) → can_escape (mk 1)
| N2 : can_escape (mk 5) → can_escape (mk 2)
| N3 : can_escape (mk 5) → can_escape (mk 3)
| N4 : can_escape (mk 5) → can_escape (mk 4)
| N5 : can_escape (mk 5) → can_escape (mk 5)
-- "is south of"
| S0 : can_escape (mk 5) → can_escape (mk 0)
| S1 : can_escape (mk 5) → can_escape (mk 1)
| S2 : can_escape (mk 1) → can_escape (mk 2)
| S3 : can_escape (mk 5) → can_escape (mk 3)
| S4 : can_escape (mk 5) → can_escape (mk 4)
| S5 : can_escape (mk 5) → can_escape (mk 5)

| E0 : can_escape (mk 1) → can_escape (mk 0)
| E1 : can_escape (mk 5) → can_escape (mk 1)
| E2 : can_escape (mk 3) → can_escape (mk 2)
| E3 : can_escape (mk 4) → can_escape (mk 3)
| E4 : can_escape (mk 5) → can_escape (mk 4)
| E5 : can_escape (mk 5) → can_escape (mk 5)

| W0 : can_escape (mk 5) → can_escape (mk 0)
| W1 : can_escape (mk 0) → can_escape (mk 1)
| W2 : can_escape (mk 5) → can_escape (mk 2)
| W3 : can_escape (mk 2) → can_escape (mk 3)
| W4 : can_escape (mk 3) → can_escape (mk 4)
| W5 : can_escape (mk 5) → can_escape (mk 5)

/-- the goal is to prove that you can escape from the start -/
@[reducible] def goal : Prop := can_escape (mk 0)
/-- the unique room for which the `out` works is room 4 -/
def hint : can_escape (mk 4) := can_escape.have_escaped

end maze

namespace tactic.interactive

--open maze.can_escape

open tactic

meta def n :=
`[apply maze.can_escape.N0 <|>
  apply maze.can_escape.N1 <|>
  apply maze.can_escape.N2 <|> 
  apply maze.can_escape.N3 <|> 
  apply maze.can_escape.N4 <|> 
  apply maze.can_escape.N5 <|> 
  fail "you cannot go north"]

meta def s :=
`[apply maze.can_escape.S0 <|>
  apply maze.can_escape.S1 <|>
  apply maze.can_escape.S2 <|> 
  apply maze.can_escape.S3 <|> 
  apply maze.can_escape.S4 <|> 
  apply maze.can_escape.S5 <|> 
  fail "you cannot go south"]

meta def e :=
`[apply maze.can_escape.E0 <|>
  apply maze.can_escape.E1 <|>
  apply maze.can_escape.E2 <|> 
  apply maze.can_escape.E3 <|> 
  apply maze.can_escape.E4 <|> 
  apply maze.can_escape.E5 <|> 
  fail "you cannot go east"]

meta def W :=
`[apply maze.can_escape.W0 <|>
  apply maze.can_escape.W1 <|>
  apply maze.can_escape.W2 <|> 
  apply maze.can_escape.W3 <|> 
  apply maze.can_escape.W4 <|> 
  apply maze.can_escape.W5 <|> 
  fail "you cannot go west"]

meta def out := `[apply have_escaped <|> fail "you are not at the exit"]

-- hand-generated solver
meta def xyzzy :=
`[ {e,n,e,e,out} <|> {n,e,e,out} <|> {e,e,out} <|> {e,out} <|> {out} ]

end tactic.interactive
