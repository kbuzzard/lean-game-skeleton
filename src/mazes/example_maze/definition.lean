/-
Ideas about a maze game, from the Xena Discord.
-/
import tactic -- I don't even know if I need this

/-
This is an example level of a puzzle game.

AB
CD
 E

01
23
 4

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

/-- The map. Interface will be unknown to player -/
inductive can_escape : maze → Prop
| have_escaped : can_escape $ mk 4
| N1 : can_escape (mk 0) → can_escape (mk 2)
| N2 : can_escape (mk 1) → can_escape (mk 3)
| N3 : can_escape (mk 3) → can_escape (mk 4)
| S1 : can_escape (mk 2) → can_escape (mk 0)
| S2 : can_escape (mk 3) → can_escape (mk 1)
| S3 : can_escape (mk 4) → can_escape (mk 3)
| E1 : can_escape (mk 1) → can_escape (mk 0)
| E2 : can_escape (mk 3) → can_escape (mk 2)
| W1 : can_escape (mk 0) → can_escape (mk 1)
| W2 : can_escape (mk 2) → can_escape (mk 3)

@[reducible] def goal : Prop := can_escape (mk 0)
def hint : can_escape (mk 4) := can_escape.have_escaped

end maze

namespace tactic.interactive

--open maze.can_escape

open tactic

meta def n :=
`[apply maze.can_escape.N1 <|> apply maze.can_escape.N2 <|> apply maze.can_escape.N3 <|> fail "you cannot go north"]

meta def s :=
`[apply maze.can_escape.S1 <|> apply maze.can_escape.S2 <|> apply maze.can_escape.S3 <|> fail "you cannot go south"]

meta def e :=
`[apply maze.can_escape.E1 <|> apply maze.can_escape.E2 <|> fail "you cannot go east"]

meta def w :=
`[apply maze.can_escape.W1 <|> apply maze.can_escape.W2 <|> fail "you cannot go west"]

meta def out := `[apply maze.can_escape.have_escaped <|> fail "you are not at the exit"]

-- hand-generated solver
meta def xyzzy :=
`[ {s,e,s, out} <|> {s,s,out} <|> {e,s,out} <|> {s,out} <|> {out} ]

end tactic.interactive
