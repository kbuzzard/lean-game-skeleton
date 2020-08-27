-- import the definition of the example maze
import mazes.gcd_maze.definition
import data.int.gcd

/-!

# Non-euclidean maze.

You are in a maze of integers, all distinct. 

You can go north, south east or west.

north adds 8 to your integer, south subtracts 8
east adds 3 to your integer, west subtrascts 3

When you're at the exit, type `out`.
-/

open maze direction

/- Solver remark : there are infinitely many rooms. -/

theorem challenge (a b : ℕ) : can_escape a b 0 :=
begin
  have solution : can_escape a b (nat.gcd a b),
    out,
  sorry







  
end

