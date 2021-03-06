\begin{code}
module Type where
\end{code}

## Fixity declarations

To begin, we get all our infix declarations out of the way.

\begin{code}
infix  4 _∋⋆_
infix  4 _⊢⋆_
infixl 5 _,⋆_

infix  6 Π
infixr 7 _⇒_

infix  5 ƛ
infixl 7 _·_
infix  9 S
\end{code}

## Imports

\begin{code}
open import Agda.Builtin.Nat

open import Builtin.Constant.Type
\end{code}

## Kinds

The kind of types is `*`. Plutus core core is based on System Fω which
is higher order so we have `⇒` for type level functions. We also have
a kind called `#` which is used for sized integers and bytestrings.

\begin{code}
data Kind : Set where
  *   : Kind               -- type
  #   : Kind               -- size
  _⇒_ : Kind → Kind → Kind -- function kind
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

Type variables are not named, they are numbered (de Bruijn indices).

A type variable is indexed by its context and kind. For a given
context, it's impossible to construct a variable that is out of
scope.

\begin{code}
data _∋⋆_ : Ctx⋆ → Kind → Set where

  Z : ∀ {Φ J}
      -------------
    → Φ ,⋆ J ∋⋆ J

  S : ∀ {Φ J K}
    → Φ ∋⋆ J
      -------------
    → Φ ,⋆ K ∋⋆ J
\end{code}

Let `α`, `β` range over type variables.

## Types

A type is indexed by its context and kind. Types are intrinsically
scoped and kinded: it's impossible to construct an ill-kinded
application and it's impossible to refer to a variable that is not in
scope.

A type is either a type variable, a pi type, a function type, a
lambda, an application, an iso-recursive type `μ`, a size, or a type
constant (base type). Note that recursive types range over an
arbitrary kind `k` which goes beyond standard iso-recursive types.

\begin{code}
data _⊢⋆_ : Ctx⋆ → Kind → Set where

  ` : ∀ {Φ J}
    → Φ ∋⋆ J
      --------
    → Φ ⊢⋆ J

  Π : ∀ {Φ K}
    → Φ ,⋆ K ⊢⋆ *
      -----------
    → Φ ⊢⋆ *

  _⇒_ : ∀ {Φ}
    → Φ ⊢⋆ *
    → Φ ⊢⋆ *
      ------
    → Φ ⊢⋆ *

  ƛ :  ∀ {Φ K J}
    → Φ ,⋆ K ⊢⋆ J 
      -----------
    → Φ ⊢⋆ K ⇒ J

  _·_ : ∀{Φ K J}
    → Φ ⊢⋆ K ⇒ J
    → Φ ⊢⋆ K
      ------
    → Φ ⊢⋆ J

  μ1 : ∀{φ K}
      --------------------------------
    → φ ⊢⋆ ((K ⇒ *) ⇒ K ⇒ *) ⇒ K ⇒ *

  size⋆ : ∀{φ}
    → Nat
      ------
    → φ ⊢⋆ #

  con : ∀{φ}
    → TyCon
    → φ ⊢⋆ #
      ------
    → φ ⊢⋆ *

\end{code}

Let `A`, `B`, `C` range over types.

## Type Abbreviations
TODO: these should be in the stdlib
\begin{code}
unit : ∀{Γ} → Γ ⊢⋆ *
unit = Π (` Z ⇒ ` Z)

boolean : ∀{Γ} → Γ ⊢⋆ *
boolean = Π (` Z ⇒ ` Z ⇒ ` Z)
\end{code}
