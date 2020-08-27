-- import the definition of the example maze
import mazes.gcd_maze.definition
import data.int.gcd

/-

# Non-euclidean maze.

You are in a maze of integers, all distinct. 

You can go north, south east or west.

north adds 20 to your integer, south subtracts 20
east adds 77 to your integer, west subtracts 77

When you're at the exit, type `out`.
-/

open maze direction

/- Solver remark : there are infinitely many rooms. -/

example : can_escape 20 77 0 :=
begin
  iterate 27 {n},
  iterate 7 {w},
  out
end.
