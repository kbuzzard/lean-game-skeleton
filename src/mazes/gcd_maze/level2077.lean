-- import the definition of the gcd maze
import mazes.gcd_maze.definition
import data.int.gcd
open maze direction

/-

# Bezout's Theorem Example maze.

You are in a maze of integers, all distinct. 

You can go north, south east or west.

North adds 20 to your integer, South subtracts 20.
East adds 77 to your integer, West subtracts 77

The exit is at 1, the gcd of 20 and 77.
When you're at the exit, type `out`.

Solver remark : there are infinitely many rooms.
-/

/- Lemma : no-side-bar
Can you prove this case of Bezout's Theorem?
-/
example : can_escape 20 77 0 :=
begin
  iterate 27 {n},
  iterate 7 {w},
  out
end

