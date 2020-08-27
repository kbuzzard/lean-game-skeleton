-- import the definition of the gcd maze
import mazes.gcd_maze.definition
import data.int.gcd
open maze direction

/-

# Bezout's Theorem Example maze.

You are in a maze of integers, all distinct. 

You can go north, south east or west.

North adds 8 to your integer, South subtracts 8.
East adds 13 to your integer, West subtracts 13

The exit is at 1, the gcd of 8 and 5.
When you're at the exit, type `out`.

Solver remark : there are infinitely many rooms.
-/

/- Lemma : no-side-bar
Can you prove this case of Bezout's Theorem?
-/
example : can_escape 8 13 0 :=
begin
  iterate 5 {n},
  iterate 3 {w},
  out
end

-- #eval nat.xgcd 8 13 -- (2, -3) -- hide