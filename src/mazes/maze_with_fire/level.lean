-- import the definition of the example maze
import mazes.maze_with_fire.solutions.definition

/-

# Maze with fire.

You are in a maze of twisty passages, all distinct. 

You can go north, south east or west.

If you fall into the fire, you will end up in the room of death,
room 5.
-/

namespace maze

/- Solver remark : there are 6 rooms. -/

/-- Use n,s,e,w to move around. When you're at the exit, type `out`. -/

/- Lenna : no-side-bar
Can you solve this maze?
-/
example : goal :=
begin
  -- ready...
  unfold goal,
  -- go!
  e,
  n,
  e,
  e,
  out,
end

end maze
