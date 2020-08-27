-- import the definition of the example maze
import mazes.noneuclidean_maze.solutions.definition

/-!

# Non-euclidean maze.

You are in a maze of twisty passages, all distinct. 

You can go north, south east or west.

If you hit the wall there's an error.

When you're at the exit, type `out`.
-/

open maze direction

/- Solver remark : there are at most 10 rooms. -/

theorem solve : can_escape A :=
begin
  -- you start in room A.
  -- move around e.g. `go north,`. Don't forget the comma 
  go south,
  go east,
  s,
  n,n,w,
  -- leave from room J with `out`.
  sorry,
end
