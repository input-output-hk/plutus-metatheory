\begin{code}
module Type.BetaNormal where
\end{code}

## Fixity declarations

To begin, we get all our infix declarations out of the way.
\begin{code}
infix  4 _⊢Nf⋆_
infix 4 _⊢NeN⋆_
\end{code}

## Imports

\begin{code}
open import Type
open import Type.RenamingSubstitution
open import Builtin.Constant.Type

open import Relation.Binary.PropositionalEquality
  renaming (subst to substEq) using (_≡_; refl; cong; cong₂; trans; sym)
open import Function
open import Agda.Builtin.Nat
\end{code}

## Type β-normal forms

We mutually define normal forms and neutral terms. It is guaranteed
that not further beta reductions are possible. Neutral terms can be
variables, neutral applications (where the term in the function
position cannot be a lambda), or recursive types. Normal forms can be
pi types, function types, lambdas or neutral terms.

\begin{code}

data _⊢Nf⋆_ : Ctx⋆ → Kind → Set

data _⊢NeN⋆_ : Ctx⋆ → Kind → Set where
  ` : ∀ {Φ J}
    → Φ ∋⋆ J
      --------
    → Φ ⊢NeN⋆ J

  _·_ : ∀{Φ K J}
    → Φ ⊢NeN⋆ (K ⇒ J)
    → Φ ⊢Nf⋆ K
      ------
    → Φ ⊢NeN⋆ J

  μ1 : ∀{φ K}
     ---------------------------------
    → φ ⊢NeN⋆ ((K ⇒ *) ⇒ K ⇒ *) ⇒ K ⇒ *

data _⊢Nf⋆_ where

  Π : ∀ {Φ K}
    → Φ ,⋆ K ⊢Nf⋆ *
      -----------
    → Φ ⊢Nf⋆ *

  _⇒_ : ∀ {Φ}
    → Φ ⊢Nf⋆ *
    → Φ ⊢Nf⋆ *
      ------
    → Φ ⊢Nf⋆ *

  ƛ :  ∀ {Φ K J}
    → Φ ,⋆ K ⊢Nf⋆ J
      -----------
    → Φ ⊢Nf⋆ (K ⇒ J)

  ne : ∀{φ K}
    → φ ⊢NeN⋆ K
      --------
    → φ ⊢Nf⋆ K

  size⋆ : ∀{φ} → Nat → φ ⊢Nf⋆ #

  con : ∀{φ} → TyCon → φ ⊢Nf⋆ # → φ ⊢Nf⋆ *

\end{code}

# Renaming

We need to be able to weaken (introduce a new variable into the
context) in normal forms so we define renaming which subsumes
weakening.

\begin{code}
renameNf : ∀ {Φ Ψ}
  → Ren Φ Ψ
    -----------------------------
  → (∀ {J} → Φ ⊢Nf⋆ J → Ψ ⊢Nf⋆ J)
renameNeN : ∀ {Φ Ψ}
  → Ren Φ Ψ
    -------------------------------
  → (∀ {J} → Φ ⊢NeN⋆ J → Ψ ⊢NeN⋆ J)

renameNf ρ (Π A)       = Π (renameNf (ext ρ) A)
renameNf ρ (A ⇒ B)     = renameNf ρ A ⇒ renameNf ρ B
renameNf ρ (ƛ B)       = ƛ (renameNf (ext ρ) B)
renameNf ρ (ne A)      = ne (renameNeN ρ A)
renameNf ρ (size⋆ n)   = size⋆ n
renameNf ρ (con tcn s) = con tcn (renameNf ρ s)

renameNeN ρ (` x)   = ` (ρ x)
renameNeN ρ (A · x) = renameNeN ρ A · renameNf ρ x
renameNeN ρ μ1      = μ1
\end{code}

\begin{code}
weakenNf : ∀ {Φ J K}
  → Φ ⊢Nf⋆ J
    -------------
  → Φ ,⋆ K ⊢Nf⋆ J
weakenNf = renameNf S
\end{code}

\begin{code}
renameNeN-cong : ∀ {Φ Ψ}
  → {f g : Ren Φ Ψ}
  → (∀ {J}(x : Φ ∋⋆ J) → f x ≡ g x)
  → ∀{K}(A : Φ ⊢NeN⋆ K)
    -------------------------
  → renameNeN f A ≡ renameNeN g A

renameNf-cong : ∀ {Φ Ψ}
  → {f g : Ren Φ Ψ}
  → (∀ {J}(x : Φ ∋⋆ J) → f x ≡ g x)
  → ∀{K}(A : Φ ⊢Nf⋆ K)
    ---------------------------
  → renameNf f A ≡ renameNf g A
renameNf-cong p (Π A)       = cong Π (renameNf-cong (ext-cong p) A)
renameNf-cong p (A ⇒ B)     = cong₂ _⇒_ (renameNf-cong p A) (renameNf-cong p B)
renameNf-cong p (ƛ A)       = cong ƛ (renameNf-cong (ext-cong p) A)
renameNf-cong p (ne A)      = cong ne (renameNeN-cong p A)
renameNf-cong p (size⋆ n)   = refl
renameNf-cong p (con tcn s) = cong (con tcn) (renameNf-cong p s)

renameNeN-cong p (` x)   = cong ` (p x)
renameNeN-cong p (A · B) = cong₂ _·_ (renameNeN-cong p A) (renameNf-cong p B)
renameNeN-cong p μ1      = refl
\end{code}

\begin{code}
renameNf-id : ∀ {Φ}
  → ∀ {J}
  → (n : Φ ⊢Nf⋆ J)
    -----------------
  → renameNf id n ≡ n

renameNeN-id : ∀ {Φ}
  → ∀ {J}
  → (n : Φ ⊢NeN⋆ J)
    ------------------
  → renameNeN id n ≡ n

renameNf-id (Π n)       =
  cong Π (trans (renameNf-cong ext-id n) (renameNf-id n))
renameNf-id (n ⇒ n')    = cong₂ _⇒_ (renameNf-id n) (renameNf-id n')
renameNf-id (ƛ n)       =
  cong ƛ (trans (renameNf-cong ext-id n) (renameNf-id n))
renameNf-id (ne x)      = cong ne (renameNeN-id x)
renameNf-id (size⋆ n)   = refl
renameNf-id (con tcn s) = cong (con tcn) (renameNf-id s)

renameNeN-id (` x)    = refl
renameNeN-id (n · n') = cong₂ _·_ (renameNeN-id n) (renameNf-id n')
renameNeN-id μ1       = refl
\end{code}

\begin{code}
renameNf-comp : ∀{Φ Ψ Θ}
  → {g : Ren Φ Ψ}
  → {f : Ren Ψ Θ}
  → ∀{J}(A : Φ ⊢Nf⋆ J)
    -------------------------------------------
  → renameNf (f ∘ g) A ≡ renameNf f (renameNf g A)
renameNeN-comp : ∀{Φ Ψ Θ}
  → {g : Ren Φ Ψ}
  → {f : Ren Ψ Θ}
  → ∀{J}(A : Φ ⊢NeN⋆ J)
    -------------------------------------------
  → renameNeN (f ∘ g) A ≡ renameNeN f (renameNeN g A)

renameNf-comp (Π B)       =
  cong Π (trans (renameNf-cong ext-comp B) (renameNf-comp B))
renameNf-comp (A ⇒ B)     = cong₂ _⇒_ (renameNf-comp A) (renameNf-comp B)
renameNf-comp (ƛ B)       = 
  cong ƛ (trans (renameNf-cong ext-comp B) (renameNf-comp B))
renameNf-comp (ne n)      = cong ne (renameNeN-comp n)
renameNf-comp (size⋆ n)   = refl
renameNf-comp (con tcn s) = cong (con tcn) (renameNf-comp s)

renameNeN-comp (` x) = cong ` refl
renameNeN-comp (A · x) = cong₂ _·_ (renameNeN-comp A) (renameNf-comp x)
renameNeN-comp μ1    = refl
\end{code}

Embedding normal forms back into terms

\begin{code}
embNf : ∀{Γ K} → Γ ⊢Nf⋆ K → Γ ⊢⋆ K
embNeN : ∀{Γ K} → Γ ⊢NeN⋆ K → Γ ⊢⋆ K

embNf (Π B)       = Π (embNf B)
embNf (A ⇒ B)     = embNf A ⇒ embNf B
embNf (ƛ B)       = ƛ (embNf B)
embNf (ne B)      = embNeN B
embNf (size⋆ n)   = size⋆ n
embNf (con tcn s) = con tcn (embNf s)

embNeN (` x)   = ` x
embNeN (A · B) = embNeN A · embNf B
embNeN μ1      = μ1
\end{code}

\begin{code}
rename-embNf : ∀ {Φ Ψ}
  → (ρ : Ren Φ Ψ)
  → ∀ {J}
  → (n : Φ ⊢Nf⋆ J)
    -----------------------------------------
  → embNf (renameNf ρ n) ≡ rename ρ (embNf n)

rename-embNeN : ∀ {Φ Ψ}
  → (ρ : Ren Φ Ψ)
  → ∀ {J}
  → (n : Φ ⊢NeN⋆ J)
    --------------------------------------------
  → embNeN (renameNeN ρ n) ≡ rename ρ (embNeN n)

rename-embNf ρ (Π B)       = cong Π (rename-embNf (ext ρ) B)
rename-embNf ρ (A ⇒ B)     = cong₂ _⇒_ (rename-embNf ρ A) (rename-embNf ρ B)
rename-embNf ρ (ƛ B)       = cong ƛ (rename-embNf (ext ρ) B)
rename-embNf ρ (ne n)      = rename-embNeN ρ n
rename-embNf ρ (size⋆ n)   = refl
rename-embNf ρ (con tcn s) = cong (con tcn) (rename-embNf ρ s)

rename-embNeN ρ (` x)    = refl
rename-embNeN ρ (n · n') = cong₂ _·_ (rename-embNeN ρ n) (rename-embNf ρ n')
rename-embNeN ρ μ1       = refl
\end{code}

# Assemblies

\begin{code}
booleanNf : ∀{Γ} → Γ ⊢Nf⋆ *
booleanNf = Π (ne (` Z) ⇒ ne (` Z) ⇒ ne (` Z))
\end{code}
