\begin{code}
module TermIndexedByNormalType.Norm2Syn where

open import Type
open import Type.RenamingSubstitution
import TermIndexedBySyntacticType.Term as Syn
import TermIndexedByNormalType.Term as Norm
open import Type.BetaNormal
open import Type.Equality
open import Type.BetaNBE
open import Type.BetaNBE.Completeness
open import Type.BetaNBE.Soundness
open import Type.BetaNBE.Stability
open import Type.BetaNBE.RenamingSubstitution
open import Relation.Binary.PropositionalEquality renaming (subst to substEq) hiding ([_])
--open import TermIndexedByNormalType.Syn2Norm

open import Function
\end{code}

\begin{code}
embCtx : Norm.Ctx → Syn.Ctx
embCtx∥ : ∀ Γ → Norm.∥ Γ ∥ ≡ Syn.∥ embCtx Γ ∥

embCtx Norm.∅       = Syn.∅
embCtx (Γ Norm.,⋆ K) = embCtx Γ Syn.,⋆ K
embCtx (Γ Norm., A)  = embCtx Γ Syn., substEq (_⊢⋆ _) (embCtx∥ Γ) (embNf A)

embCtx∥ Norm.∅       = refl
embCtx∥ (Γ Norm.,⋆ K) = cong (_,⋆ K) (embCtx∥ Γ)
embCtx∥ (Γ Norm., A)  = embCtx∥ Γ
\end{code}


\begin{code}
lemT' : ∀{Γ Γ' J K}(A :  Γ ⊢Nf⋆ K)
 → (p : Γ ≡ Γ')
 → (q : Γ ,⋆ J ≡ Γ' ,⋆ J)
  → weaken (substEq (_⊢⋆ K) p (embNf A))
    ≡
    substEq (_⊢⋆ K) q (embNf (renameNf S A))
lemT' A refl refl = sym (rename-embNf S A)
\end{code}

\begin{code}
subst∋' : ∀ {Γ Γ' K}{A : Syn.∥ Γ ∥ ⊢⋆ K}{A' : Syn.∥ Γ' ∥ ⊢⋆ K}
 → (p : Γ ≡ Γ')
 → substEq (_⊢⋆ K) (cong Syn.∥_∥ p) A ≡ A' →
 (Γ Syn.∋ A) → Γ' Syn.∋ A'
subst∋' refl refl α = α
\end{code}

\begin{code}
embTyVar : ∀{Γ K}{A : Norm.∥ Γ ∥ ⊢Nf⋆ K}
  → Γ Norm.∋ A
  → embCtx Γ Syn.∋ substEq (_⊢⋆ K) (embCtx∥ Γ) (embNf A)
embTyVar Norm.Z     = Syn.Z
embTyVar (Norm.S α) = Syn.S (embTyVar α)
embTyVar {Γ Norm.,⋆ K} (Norm.T {A = A} α) = subst∋'
  refl
  (lemT' A (embCtx∥ Γ) (embCtx∥ (Γ Norm.,⋆ K)))
  (Syn.T (embTyVar α))
\end{code}

\begin{code}
subst⊢' : ∀ {Γ Γ' K}{A : Syn.∥ Γ ∥ ⊢⋆ K}{A' : Syn.∥ Γ' ∥ ⊢⋆ K}
 → (p : Γ ≡ Γ')
 → substEq (_⊢⋆ K) (cong Syn.∥_∥ p) A ≡ A' →
 (Γ Syn.⊢ A) → Γ' Syn.⊢ A'
subst⊢' refl refl α = α
\end{code}

\begin{code}
lemƛ' : ∀{Γ Γ'}(A B : Γ ⊢Nf⋆ *) →
      (p : Γ ≡ Γ') → 
      substEq (_⊢⋆ *) p (embNf A ⇒ embNf B)
      ≡
      substEq (_⊢⋆ *) p (embNf A) ⇒ substEq (_⊢⋆ *) p (embNf B)
lemƛ' A B refl = refl
\end{code}

\begin{code}
lemΠ' :  ∀{Γ Γ' K }(p : Γ ≡ Γ')(q : Γ ,⋆ K ≡ Γ' ,⋆ K)(B : Γ ,⋆ K ⊢Nf⋆ *) → 
  Π (substEq (_⊢⋆ *) q (embNf B)) ≡
  substEq (_⊢⋆ *) p (Π (embNf B))
lemΠ' refl refl B = refl
\end{code}

\begin{code}
lem[]'' : ∀{Γ Γ' K}(p : Γ ≡ Γ')(q : Γ ,⋆ K ≡ Γ' ,⋆ K)(A : Γ ⊢Nf⋆ K)(B : Γ ,⋆ K ⊢Nf⋆ *) →
  (((substEq (_⊢⋆ *) q (embNf B)) [ (substEq (_⊢⋆ K) p (embNf A)) ])
  ≡β
  substEq (_⊢⋆ *) p
  (embNf
   (eval
    (subst
     (λ x →
        embNf
        (substNf-cons
         (λ {K₁} x₁ → ne (` x₁)) A x))
     (embNf B))
    (idEnv Γ))))
lem[]'' refl refl A B = substEq (embNf B [ embNf A ] ≡β_) (cong embNf (trans (trans (subst-eval (embNf B) idCR (subst-cons ` (embNf A))) (idext (λ { Z → idext idCR (embNf A) ; (S α) → reflectCR (refl {x = ` α})}) (embNf B))) (sym (subst-eval (embNf B) idCR (embNf ∘ substNf-cons (ne ∘ `) A))))) (soundness (embNf B [ embNf A ]))
\end{code}

\begin{code}
lemμ : ∀{Γ Γ' K}(p : Γ ≡ Γ')(pat : Γ ⊢Nf⋆ (K ⇒ *) ⇒ K ⇒ *)(arg : Γ ⊢Nf⋆ K) → 
  substEq (_⊢⋆ *) p (μ1 · embNf pat · embNf arg) ≡
  μ1 · substEq (_⊢⋆ _) p (embNf pat) · substEq (_⊢⋆ _) p (embNf arg)
lemμ refl pat arg = refl
\end{code}

\begin{code}
open import Data.Sum
lemμ' : ∀{Γ Γ' K}(p : Γ ≡ Γ')(pat : Γ ⊢Nf⋆ (K ⇒ *) ⇒ K ⇒ *)(arg : Γ ⊢Nf⋆ K) →
  substEq (_⊢⋆ (K ⇒ *) ⇒ K ⇒ *) p (embNf pat) ·
  (μ1 · substEq (_⊢⋆ (K ⇒ *) ⇒ K ⇒ *) p (embNf pat))
  · substEq (_⊢⋆ K) p (embNf arg)
  ≡β
  substEq (_⊢⋆ *) p
  (embNf
   ((eval (embNf pat) (idEnv Γ) ·V
     inj₁
     (μ1 · reify (eval (embNf pat) (idEnv Γ))))
    ·V eval (embNf arg) (idEnv Γ)))
lemμ' refl pat arg = soundness (embNf pat · (μ1 · embNf pat) · embNf arg)
\end{code}

\begin{code}
open import Builtin.Constant.Type

lemcon : ∀{Γ Γ'}(p : Γ ≡ Γ')(tcn : TyCon)(s : Γ ⊢Nf⋆ #)
  → con tcn (substEq (_⊢⋆ #) p (embNf s)) ≡
    substEq (_⊢⋆ *) p (con tcn (embNf s))
lemcon refl tcn s = refl
\end{code}

\begin{code}
import Builtin.Signature Ctx⋆ Kind ∅ _,⋆_ * # _∋⋆_ Z S _⊢⋆_ ` con boolean size⋆
  as SSig
import Builtin.Signature
  Ctx⋆ Kind ∅ _,⋆_ * # _∋⋆_ Z S _⊢Nf⋆_ (ne ∘ `) con Norm.booleanNf size⋆
  as NSig
open import Builtin
import Builtin.Constant.Term Ctx⋆ Kind * # _⊢⋆_ con size⋆ as STermCon 
import Builtin.Constant.Term Ctx⋆ Kind * # _⊢Nf⋆_ con size⋆ as NTermCon 


substTC : ∀{Γ Γ'}(p : Γ ≡ Γ')(s : Γ ⊢⋆ #)(tcn : TyCon)
  → STermCon.TermCon (con tcn s)
  → STermCon.TermCon (con tcn (substEq (_⊢⋆ #) p s))
substTC refl s tcn t = t

embTypeTC : ∀{φ}{A : φ ⊢Nf⋆ *} → NTermCon.TermCon A → STermCon.TermCon (embNf A)
embTypeTC (NTermCon.integer s i p)    = STermCon.integer s i p
embTypeTC (NTermCon.bytestring s b p) = STermCon.bytestring s b p 
embTypeTC (NTermCon.size s)           = STermCon.size s
\end{code}
\begin{code}
embTy : ∀{Γ K}{A : Norm.∥ Γ ∥ ⊢Nf⋆ K}
  → Γ Norm.⊢ A
  → embCtx Γ Syn.⊢ substEq (_⊢⋆ K) (embCtx∥ Γ) (embNf A)
embTy (Norm.` α) = Syn.` (embTyVar α)
embTy {Γ} (Norm.ƛ {A = A}{B} t) =
  subst⊢' refl (sym (lemƛ' A B (embCtx∥ Γ)) ) (Syn.ƛ (embTy t))
embTy {Γ} (Norm._·_ {A = A}{B} t u) =
  subst⊢' refl (lemƛ' A B (embCtx∥ Γ)) (embTy t) Syn.· embTy u
embTy {Γ} (Norm.Λ {B = B} t) =
  subst⊢' refl (lemΠ' (embCtx∥ Γ) (embCtx∥ (Γ Norm.,⋆ _)) B) (Syn.Λ (embTy t))
embTy {Γ}(Norm._·⋆_ {K = K}{B = B} t A) = Syn.conv -- there's a substitution involved here so a conv is needed...
  (lem[]'' (embCtx∥ Γ) (embCtx∥ (Γ Norm.,⋆ K)) A B)
  (Syn._·⋆_
    (subst⊢' refl (sym (lemΠ' (embCtx∥ Γ) (embCtx∥ (Γ Norm.,⋆ K)) B)) (embTy t))
    (substEq (_⊢⋆ K) (embCtx∥ Γ) (embNf A)))
embTy {Γ} (Norm.wrap1 pat arg t) = subst⊢'
  refl
  (sym (lemμ (embCtx∥ Γ) pat arg))
  (Syn.wrap1
    (substEq (_⊢⋆ _) (embCtx∥ Γ) (embNf pat))
    (substEq (_⊢⋆ _) (embCtx∥ Γ) (embNf arg))
    (Syn.conv (sym≡β (lemμ' (embCtx∥ Γ) pat arg)) (embTy t)))
embTy {Γ} (Norm.unwrap1 {pat = pat}{arg} t) = Syn.conv
  (lemμ'
    (embCtx∥ Γ) pat arg)
    (Syn.unwrap1 (subst⊢' refl (lemμ (embCtx∥ Γ) pat arg) (embTy t)))
embTy {Γ} (Norm.con  {s = s}{tcn = tcn} t ) = subst⊢'
  refl
  (lemcon (embCtx∥ Γ) tcn s) (Syn.con (substTC (embCtx∥ Γ) (embNf s) tcn (embTypeTC t)))
embTy (Norm.builtin bn σ tel) = {!!}
embTy {Γ} (Norm.error A) = Syn.error (substEq (_⊢⋆ _) (embCtx∥ Γ) (embNf A) )
\end{code}