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

-- I can't make this work
--notation `you ` `are ` `inn ` `room `: 37 z := can_escape 6 10 z
--theorem solve : can_escape 6 10 (0 : ℤ) :=
--begin
--  n,
--  n,
--  w,
--  out,
--end
--
--example : can_escape 8 13 0 :=
--begin
--  
--end


example : can_escape 20 77 0 :=
begin
  iterate 27 {n},
  iterate 7 {w},
  out
end.

--#eval nat.gcd 20 77 -- 1
--#eval nat.xgcd 20 77 -- (27, -7)

--theorem challenge (a b : ℕ) : can_escape a b 0 :=
--sorry

--#eval nat.gcd 6 10
--
--#check nat.xgcd 8 3
--#eval nat.xgcd 8 3 -- -1, 3, so "subtract 8 once, and add 3 3 times"
