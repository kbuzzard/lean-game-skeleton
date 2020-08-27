-- import the definition of the example maze
import mazes.gcd_maze.definition
import data.int.gcd

/-

# Prove Bezout's Theorem

You are in a maze of integers, all distinct. 

You can go north, south east or west.

north adds a to your integer, south subtracts a
east adds b to your integer, west subtracts b
The exit is at gcd a b.
Can you prove you can always exit?
-/

open maze direction

/-

Solver remark : there are infinitely many rooms.

-/

/- Lemma : no-side-bar
Can you prove the general case?
-/
theorem challenge (a b : ℕ) : can_escape a b 0 :=
begin
  have solution : can_escape a b (nat.gcd a b),
    out,
  sorry








end

