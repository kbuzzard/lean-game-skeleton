-- import the definition of the example maze
import mazes.example_maze.definition

-- World name -- Four Mazes

/-

# Maze 1 : Example maze.

You are in a maze of twisty passages, all distinct! 

You can go north, south east or west.
-/

namespace maze -- hide

/- 
There are 5 rooms. Rooms are called 0,1,2,3,4 , with 0 being
where you start and 4 being the exit.
 -/

/-
Use n,s,e,w to move around. When you're at the exit, type `out`.
-/

/-
  Don't forget the commas.
  Don't bang into the walls -- those are errors.
  When you get there, the tactic to get you out is `out`. 
  There is also a magic word, rumoured to be
  an ancient translation of the word `sorry`.
-/

/- Lemma : no-side-bar
See if you can get out of this maze.
-/
lemma can_escape_example_maze : (mk 0).can_escape :=
begin
  xyzzy,






end

end maze
