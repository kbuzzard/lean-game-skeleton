-- import the definition of the gcd maze
import mazes.gcd_maze.definition
import data.int.gcd
open maze direction

/-

# Prove Bezout's Theorem

You are in a maze of integers, all distinct. 

You can go north, south east or west.

North adds `a` to your integer, South subtracts `a`.
East adds `b` to your integer, West subtracts `b`.
You start at 0. The exit is at `nat.gcd a b`.
Can you prove you can always exit?

Solver remark : there are infinitely many mazes.
-/

/- Lemma : no-side-bar
Can you prove you can escape in the general case?
-/
theorem challenge (A B : ℕ) : can_escape A B 0 :=
begin
  have solution : can_escape A B (nat.gcd A B),
    out,
  have hs : ∀ t l : ℕ, can_escape A B t → can_escape A B (t + l*A),
  { intros t l,
    induction l with d hd,
    { intro h, convert h, simp },
    intro h,
    specialize hd h,
    s,
    convert hd,
    ring
  },
  have hns : ∀ t : ℤ, ∀ l : ℤ, can_escape A B t → can_escape A B (t + l * A),
  { intros t l,
    apply int.induction_on l; clear l,
    { intro h, convert h, ring},
    { intros d hd, 
      intro h, specialize hd h,
      s,
      convert hd,
      ring,
    },
    { intros d hd, 
      intro h, specialize hd h,
      n,
      convert hd using 1,
      ring,
    } },
  have hew : ∀ t : ℤ, ∀ m : ℤ, can_escape A B t → can_escape A B (t + m * B),
  { intros t l,
    apply int.induction_on l; clear l,
    { intro h, convert h, ring},
    { intros d hd, 
      intro h, specialize hd h,
      w,
      convert hd,
      ring,
    },
    { intros d hd, 
      intro h, specialize hd h,
      e,
      convert hd using 1,
      ring,
    } },
  suffices : ∃ L M : ℤ, L * A + M * B = nat.gcd A B,
  { rcases this with ⟨L, M, h⟩,
    rw ← h at solution,
    specialize hew _ (-M) solution,
    simp at hew,
    specialize hns _ (-L) hew,
    convert hns,
    ring,
  },
  have h := nat.gcd_eq_gcd_ab A B,
  rw h,
  use [A.gcd_a B, A.gcd_b B],
  ring,
end

