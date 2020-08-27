-- import the definition of the example maze
import mazes.example_maze.definition

/-!

# Example maze.

You are in a maze of twisty passages, all alike! 

You can go north, south east or west.

-/

namespace maze

/- Solver remark : there are 5 rooms.
 Rooms are called 0,1,2,3,4 . 4 is the exit.
 -/

/-- Use n,s,e,w to move around. When you're at the exit, type `out`. -/

/-

   XX
   01X
   23X
    4


-/
example : goal :=
begin
  -- ready...
  unfold goal,
  -- ⊢ (mk 0).can_escape -- "you can escape from room 0"
  -- go!
  s,
  n,
  s,
  e,
  n,
  w,
  e,
  s,
  s,
  out,
  -- Don't forget the commas.
  -- Don't bang into the walls -- those are errors.
  -- When you get there, the tactic to get you out is `out`. 
  -- There is also a magic word, rumoured to be
  -- an ancient translation of the word `sorry`.
end

end maze
