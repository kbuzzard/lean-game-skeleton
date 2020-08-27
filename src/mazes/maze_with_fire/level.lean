-- import the definition of the example maze
import mazes.maze_with_fire.solutions.definition

/-!

# Maze with fire.

You are in a maze of twisty passages, all distinct. 

You can go north, south east or west.

If you fall into the fire, you will end up in the room of death,
room 5.
-/

namespace maze

/- Solver remark : there are 6 rooms. -/

/-- Use n,s,e,w to move around. When you're at the exit, type `out`. -/

example : goal :=
begin
  -- ready...
  unfold goal,
  -- go!
  s,
  n,
  s,
  e,
  n,
  sorry,
  -- Don't forget the commas.
  -- Don't bang into the walls -- those are errors.
  -- When you get there, the tactic to get you out is `out`. 
  -- There is also a magic word, rumoured to be
  -- an ancient translation of the word `sorry`.
end

end maze
