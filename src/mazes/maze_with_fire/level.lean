-- import the definition of the maze surrounded by fore
import mazes.maze_with_fire.solutions.definition
namespace maze

/-

# Maze with fire.

You are in a maze of twisty passages, all distinct. 

You can go north, south east or west.

If you fall into the fire, you will end up in the room of death,
room 5, from which there is no escape.

Solver remark : there are 6 rooms.

Use `n`, `s`,`e`, `w` to move around. The exit is room `4`.
When you're at the exit, type `out`.
-/

/- Lemma : no-side-bar
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
