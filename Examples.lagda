\begin{code}
module Examples where
\end{code}

## Imports

\begin{code}
open import Data.Product using (Σ)
open import Function using (id; _∘_)
open import Relation.Binary.PropositionalEquality
  renaming (subst to substEq) using (_≡_; refl; cong; cong₂; trans; sym)

open import Type
import Type.RenamingSubstitution as ⋆
open import Term
open import Term.RenamingSubstitution
open import Evaluation
\end{code}

## Examples

### Scott Numerals

From http://lucacardelli.name/Papers/Notes/scott2.pdf

M = μ X . G X
G X = ∀ R. R → (X → R) → R)
μ X . G X = ∀ X . (G X → X) → X -- what is the status of this?
N = G M
in  : N → M
out : M → N

0    = Λ R . λ x : R . λ y : M → R . x
     : N
succ = λ n : N . Λ R . λ x : R . λ y : M → R . y (in n)
     : N → N
case = λ n : N . Λ R . λ a : R . λ f : N → N . n [R] a (f ∘ out)
     : N → ∀ R . R → (N → R) → R


--

\begin{code}
module Scott where
  G : ∀{Γ} → Γ ,⋆  * ⊢⋆ *
  G = Π ` Z ⇒ (` (S Z) ⇒ (` Z)) ⇒ (` Z)
  
  M : ∀{Γ} → Γ ⊢⋆ *
  M = μ G
  
  N : ∀{Γ} → Γ ⊢⋆ *
  N  =  G ⋆.[ M ]
  
  Zero : ∅ ⊢ N
  Zero = Λ (ƛ (ƛ (` (S (Z )))))
  
  Succ : ∅ ⊢ N ⇒ N
  Succ = ƛ (Λ (ƛ (ƛ (` Z · wrap G (` (S (S (T Z))))))))
  
  One : ∅ ⊢ N
  One = Succ · Zero
  
  Two : ∅ ⊢ N
  Two = Succ · (Succ · Zero)
  
  case : ∅ ⊢ N ⇒ (Π ` Z ⇒ (N ⇒ (` Z)) ⇒ (` Z))
  case = ƛ (Λ (ƛ (ƛ (` (S (S (T Z)))) ·⋆ (` Z) · (` (S Z)) · (ƛ ` (S Z) · unwrap (` Z)))))
\end{code}

### Church Numerals

\begin{code}
module Church where
  N : ∀{Γ} → Γ ⊢⋆ *
  N = Π (` Z) ⇒ (` Z ⇒ ` Z) ⇒ (` Z)

  Zero : ∅ ⊢ N
  Zero = Λ (ƛ (ƛ (` (S Z))))

  Succ : ∅ ⊢ N ⇒ N
  Succ = ƛ (Λ (ƛ (ƛ ` Z · ((` (S (S (T Z)))) ·⋆ (` Z) · (` (S Z)) · (` Z)))))
  
  Iter : ∅ ⊢ Π ` Z ⇒ (` Z ⇒ ` Z) ⇒ N ⇒ (` Z)
  Iter = Λ (ƛ (ƛ (ƛ ((` Z) ·⋆ (` Z) · (` (S (S Z))) · (` (S Z))))))

  -- two plus two
  One : ∅ ⊢ N
  One = Succ · Zero

  Two : ∅ ⊢ N
  Two = Succ · One

  Three : ∅ ⊢ N
  Three = Succ · Two

  Four : ∅ ⊢ N
  Four = Succ · Three

  Plus : ∅ ⊢ N → ∅ ⊢ N → ∅ ⊢ N
  Plus x y = Iter ·⋆ N · x · Succ · y -- by induction on the second y

  TwoPlusTwo = Plus Two Two

open Church public
\end{code}

-- Church "4"
eval (gas 100000000) Four
(done
 (Λ
  (ƛ
   (ƛ
    (` Z) ·
    (((Λ
       (ƛ
        (ƛ
         (` Z) ·
         (((Λ
            (ƛ
             (ƛ
              (` Z) ·
              (((Λ
                 (ƛ
                  (ƛ
                   (` Z) · (((Λ (ƛ (ƛ (` (S Z))))) ·⋆ (` Z)) · (` (S Z)) · (` Z)))))
                ·⋆ (` Z))
               · (` (S Z))
               · (` Z)))))
           ·⋆ (` Z))
          · (` (S Z))
          · (` Z)))))
      ·⋆ (` Z))
     · (` (S Z))
     · (` Z)))))
 V-Λ_)

-- Church "2 + 2"
eval (gas 100000000) (Plus Two Two)

(done
 (Λ
  (ƛ
   (ƛ
    (` Z) ·
    (((Λ
       (ƛ
        (ƛ
         (` Z) ·
         (((Λ
            (ƛ
             (ƛ
              (` Z) ·
              (((Λ
                 (ƛ
                  (ƛ
                   (` Z) · (((Λ (ƛ (ƛ (` (S Z))))) ·⋆ (` Z)) · (` (S Z)) · (` Z)))))
                ·⋆ (` Z))
               · (` (S Z))
               · (` Z)))))
           ·⋆ (` Z))
          · (` (S Z))
          · (` Z)))))
      ·⋆ (` Z))
     · (` (S Z))
     · (` Z)))))
 V-Λ_)