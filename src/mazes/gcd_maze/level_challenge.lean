-- import the definition of the gcd maze
import mazes.gcd_maze.definition
import data.int.gcd
open maze direction

/-

# Prove Bezout's Theorem

You are in a maze of integers, all distinct. 

You can go north, south east or west.

North adds `a` to your integer, South subtracts `a`.
East adds `b` to your integer, West subtracts `b`.
You start at 0. The exit is at `nat.gcd a b`.
Can you prove you can always exit?

Solver remark : there are infinitely many mazes.
-/

/- Lemma : no-side-bar
Can you prove you can escape in the general case?
-/
theorem challenge (a b : ℕ) : can_escape a b 0 :=
begin
  have solution : can_escape a b (nat.gcd a b),
    out,
  sorry








end

