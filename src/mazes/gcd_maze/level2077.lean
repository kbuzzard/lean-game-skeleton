-- import the definition of the example maze
import mazes.gcd_maze.definition
import data.int.gcd
open maze direction

/-

# Non-euclidean maze.

You are in a maze of integers, all distinct. 

You can go north, south east or west.

north adds 20 to your integer, south subtracts 20
east adds 77 to your integer, west subtracts 77

The exit is at 1, the gcd of 20 and 77.
When you're at the exit, type `out`.
-/


/-

Solver remark : there are infinitely many rooms.

-/

/- Lemma : no-side-bar
Can you prove Bezout's Theorem in this example?
-/
example : can_escape 20 77 0 :=
begin
  iterate 27 {n},
  iterate 7 {w},
  out
end

