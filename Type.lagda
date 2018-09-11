\begin{code}
module Type where
\end{code}

## Imports

\begin{code}
open import Data.Product using (Σ)
open import Function using (id; _∘_)
open import Relation.Binary.PropositionalEquality
  renaming (subst to substEq) using (_≡_; refl; cong; cong₂; trans; sym)
\end{code}

## Fixity declarations

To begin, we get all our infix declarations out of the way.
We list separately operators for judgements, types, and terms.
\begin{code}
infix  4 _∋⋆_
infix  4 _⊢⋆_
infixl 5 _,⋆_

infix  6 Π_
infixr 7 _⇒_

infix  5 ƛ_
infixl 7 _·_
infix  9 S_
\end{code}

## Kinds

The only kind is `*`, the kind of types.
\begin{code}
data Kind : Set where
  * : Kind
  _⇒_ : Kind → Kind → Kind
\end{code}
Let `J`, `K` range over kinds.

## Type contexts

A type context is either empty or extends a type
context by a type variable of a given kind.
\begin{code}
data Ctx⋆ : Set where
  ∅ : Ctx⋆
  _,⋆_ : Ctx⋆ → Kind → Ctx⋆
\end{code}
Let `Φ`, `Ψ` range over type contexts.

## Type variables

A type variable is indexed by its context and kind.
\begin{code}
data _∋⋆_ : Ctx⋆ → Kind → Set where

  Z : ∀ {Φ J}
      -------------
    → Φ ,⋆ J ∋⋆ J

  S_ : ∀ {Φ J K} -- S_ permits things like 'S f x' as well as 'S (f x)'...
    → Φ ∋⋆ J
      -------------
    → Φ ,⋆ K ∋⋆ J
\end{code}
Let `α`, `β` range over type variables.

## Types

A type is indexed by its context and kind.  A type is either a type
variable, a pi type, or a function type.
\begin{code}
data _⊢⋆_ : Ctx⋆ → Kind → Set where

  `_ : ∀ {Φ J}
    → Φ ∋⋆ J
      --------
    → Φ ⊢⋆ J

  Π_ : ∀ {Φ K}
    → Φ ,⋆ K ⊢⋆ *
      -----------
    → Φ ⊢⋆ *

  _⇒_ : ∀ {Φ}
    → Φ ⊢⋆ *
    → Φ ⊢⋆ *
      ------
    → Φ ⊢⋆ *

  ƛ_ :  ∀ {Φ K J}
    → Φ ,⋆ K ⊢⋆ J 
      -----------
    → Φ ⊢⋆ K ⇒ J

  _·_ : ∀{Φ K J}
    → Φ ⊢⋆ K ⇒ J
    → Φ ⊢⋆ K
      ------
    → Φ ⊢⋆ J

  μ_ : ∀{φ K}
    → φ ,⋆ K ⊢⋆ *
      -----------
    → φ ⊢⋆ *

\end{code}