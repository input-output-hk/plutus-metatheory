---
layout: page
title: Table of Contents
---

The Formalisation is split into several sections.

The main body of the formalisation involves a intrinsically typed
implementation of Plutus Core (PLC). It contains types, normal types,
builtins, terms indexed by ordinary types, and terms indexed by normal
types. There is a reduction semantics, CK and CEK machines. There are
proofs of various syntactic properties, a normalisation proof for the
type level language, and a progress proof for the term level
reduction semantics.

There are two additional versions of the PLC language beyond the
intrinsically typed treatment. There is an extrinsically typed but
intrinsically scoped version which is used to represent terms prior
to typechecking and also can be executed directly, and there is a
untyped version of PLC which can also be executed directly.

The final two pieces are a type checker which is guaranteed to be
sound and an executable that is intended to be compiled into Haskell.

1. [Types](#types)
2. [Normalisation of types](#normal-types)
3. [Builtin machinery](#builtins)
4. [Declarative terms](#declarative-syntax)
5. [Algorithmic terms](#algorithmic-syntax)
6. [Well-scoped types and terms](#extrinsically-typed-syntax-aka-well-scoped-terms)
7. [Untyped terms](#untyped-terms)
8. [A typechecker](#type-checker)
9. [An executable](#executable)

## Types

The type level language is similar to simply-typed lambda-calculus
with the addition of constants for forall, μ, and builtin
contants. The [`Type`](Type.html) module containts kinds, contexts and
types. Types are intrinsically scoped and kinded and variables are
represented using De Bruijn indices. Parallel renaming and
substitution are implemented in the
[`Type.RenamingSubstitution`](Type/RenamingSubstitution.html) module
and they are shown to be satisfy the functor and relative monad laws
respectively. The [`Type.Reduction`](Type/Reduction.html) module
contains a small step reduction algorithm for types. It is not used
directly in the formalisation as computation on types is carried out
using normalisation by evaluation instead. Equality of types is
specified in the [`Type.Equality`](Type/Equality.html)
module. Equality serves as a specification of type compuation and is
used in the normalisation proof.

<pre class="Agda"><a id="2297" class="Keyword">import</a> <a id="2304" href="Type.html" class="Module">Type</a>
<a id="2309" class="Keyword">import</a> <a id="2316" href="Type.RenamingSubstitution.html" class="Module">Type.RenamingSubstitution</a>
<a id="2342" class="Keyword">import</a> <a id="2349" href="Type.Equality.html" class="Module">Type.Equality</a>
<a id="2363" class="Keyword">import</a> <a id="2370" href="Type.Reduction.html" class="Module">Type.Reduction</a>
</pre>
## Normal Types

Beta normal forms, a beta NBE algorithm and accompanying soundness,
completeness and stability proofs and necessary equipment for
substituting into normal types by embedding back into syntax,
substituting and renormalising.

<pre class="Agda"><a id="2636" class="Keyword">import</a> <a id="2643" href="Type.BetaNormal.html" class="Module">Type.BetaNormal</a>
<a id="2659" class="Keyword">import</a> <a id="2666" href="Type.BetaNBE.html" class="Module">Type.BetaNBE</a>
<a id="2679" class="Keyword">import</a> <a id="2686" href="Type.BetaNBE.Soundness.html" class="Module">Type.BetaNBE.Soundness</a>
<a id="2709" class="Keyword">import</a> <a id="2716" href="Type.BetaNBE.Completeness.html" class="Module">Type.BetaNBE.Completeness</a>
<a id="2742" class="Keyword">import</a> <a id="2749" href="Type.BetaNBE.Stability.html" class="Module">Type.BetaNBE.Stability</a>
<a id="2772" class="Keyword">import</a> <a id="2779" href="Type.BetaNBE.RenamingSubstitution.html" class="Module">Type.BetaNBE.RenamingSubstitution</a>
</pre>
## Builtins

Builtins extend the core System F-omega-mu calculus with primitive
types such as integers and bytestrings and operations on them.

<pre class="Agda"><a id="2966" class="Keyword">import</a> <a id="2973" href="Builtin.Signature.html" class="Module">Builtin.Signature</a>
<a id="2991" class="Keyword">import</a> <a id="2998" href="Builtin.Constant.Type.html" class="Module">Builtin.Constant.Type</a>
<a id="3020" class="Keyword">import</a> <a id="3027" href="Builtin.Constant.Term.html" class="Module">Builtin.Constant.Term</a>
</pre>
## Declarative syntax

A version of the syntax of terms, indexed by types, that includes the
so-called conversion rule as a syntactic constructor. This is the most
direct rendering of the typing rules as syntax but it is hard to
execute programs presented in this syntax. No treatment of execution
is given here, instead we introduce an alternative (algorithmic)
syntax without the conversion rule below. This version serves as a
reference/specification and we prove that the more algorithmic syntax
is sound and complete with respect to it.

<pre class="Agda"><a id="3601" class="Keyword">import</a> <a id="3608" href="Declarative.html" class="Module">Declarative</a>
<a id="3620" class="Keyword">import</a> <a id="3627" href="Declarative.RenamingSubstitution.html" class="Module">Declarative.RenamingSubstitution</a>
<a id="3660" class="Keyword">import</a> <a id="3667" href="Declarative.Erasure.html" class="Module">Declarative.Erasure</a>

<a id="3688" class="Keyword">import</a> <a id="3695" href="Declarative.Examples.html" class="Module">Declarative.Examples</a>
<a id="3716" class="Keyword">import</a> <a id="3723" href="Declarative.Examples.StdLib.Function.html" class="Module">Declarative.Examples.StdLib.Function</a>
<a id="3760" class="Keyword">import</a> <a id="3767" href="Declarative.Examples.StdLib.ChurchNat.html" class="Module">Declarative.Examples.StdLib.ChurchNat</a>
<a id="3805" class="Keyword">import</a> <a id="3812" href="Declarative.Examples.StdLib.Nat.html" class="Module">Declarative.Examples.StdLib.Nat</a>
</pre>
## Algorithmic syntax

Terms, reduction and evaluation where terms are indexed by normal
types

<pre class="Agda"><a id="3949" class="Keyword">import</a> <a id="3956" href="Algorithmic.html" class="Module">Algorithmic</a>
<a id="3968" class="Keyword">import</a> <a id="3975" href="Algorithmic.RenamingSubstitution.html" class="Module">Algorithmic.RenamingSubstitution</a>
<a id="4008" class="Keyword">import</a> <a id="4015" href="Algorithmic.Reduction.html" class="Module">Algorithmic.Reduction</a>
<a id="4037" class="Keyword">import</a> <a id="4044" href="Algorithmic.Evaluation.html" class="Module">Algorithmic.Evaluation</a>
<a id="4067" class="Keyword">import</a> <a id="4074" href="Algorithmic.Main.html" class="Module">Algorithmic.Main</a>
<a id="4091" class="Keyword">import</a> <a id="4098" href="Algorithmic.Completeness.html" class="Module">Algorithmic.Completeness</a>
<a id="4123" class="Keyword">import</a> <a id="4130" href="Algorithmic.Soundness.html" class="Module">Algorithmic.Soundness</a>
<a id="4152" class="Keyword">import</a> <a id="4159" href="Algorithmic.Erasure.html" class="Module">Algorithmic.Erasure</a>
<a id="4179" class="Keyword">import</a> <a id="4186" href="Algorithmic.Erasure.RenamingSubstitution.html" class="Module">Algorithmic.Erasure.RenamingSubstitution</a>
<a id="4227" class="Comment">--import Algorithmic.Erasure.Reduction</a>
<a id="4266" class="Keyword">import</a> <a id="4273" href="Algorithmic.CK.html" class="Module">Algorithmic.CK</a>
<a id="4288" class="Keyword">import</a> <a id="4295" href="Algorithmic.CEKV.html" class="Module">Algorithmic.CEKV</a>

<a id="4313" class="Keyword">import</a> <a id="4320" href="Algorithmic.Examples.html" class="Module">Algorithmic.Examples</a>
</pre>
## Extrinsically typed syntax a.k.a. Well Scoped Terms

Extrinsically typed terms, reduction and evaluation

<pre class="Agda"><a id="4459" class="Keyword">import</a> <a id="4466" href="Scoped.html" class="Module">Scoped</a>
<a id="4473" class="Keyword">import</a> <a id="4480" href="Scoped.RenamingSubstitution.html" class="Module">Scoped.RenamingSubstitution</a>

<a id="4509" class="Keyword">import</a> <a id="4516" href="Scoped.Reduction.html" class="Module">Scoped.Reduction</a>

<a id="4534" class="Keyword">import</a> <a id="4541" href="Scoped.Extrication.html" class="Module">Scoped.Extrication</a>
<a id="4560" class="Keyword">import</a> <a id="4567" href="Scoped.Extrication.RenamingSubstitution.html" class="Module">Scoped.Extrication.RenamingSubstitution</a>
<a id="4607" class="Comment">--import Scoped.Extrication.Reduction</a>
<a id="4645" class="Keyword">import</a> <a id="4652" href="Scoped.Erasure.html" class="Module">Scoped.Erasure</a>
<a id="4667" class="Comment">--import Scoped.Erasure.RenamingSubstitution</a>
<a id="4712" class="Comment">--import Scoped.Erasure.Reduction</a>
<a id="4746" class="Keyword">import</a> <a id="4753" href="Scoped.CK.html" class="Module">Scoped.CK</a>
</pre>
## Untyped terms

Untyped terms, reduction and evaluation

<pre class="Agda"><a id="4831" class="Keyword">import</a> <a id="4838" href="Untyped.html" class="Module">Untyped</a>
<a id="4846" class="Keyword">import</a> <a id="4853" href="Untyped.RenamingSubstitution.html" class="Module">Untyped.RenamingSubstitution</a>
<a id="4882" class="Keyword">import</a> <a id="4889" href="Untyped.Reduction.html" class="Module">Untyped.Reduction</a>
</pre>
## Type checker

This takes a well-scoped term and produces an intrinsically typed term
as evidence of successful typechecking.

<pre class="Agda"><a id="5045" class="Keyword">import</a> <a id="5052" href="Check.html" class="Module">Check</a>
</pre>
## Executable

This module is is compiled to Haskell and then can be compiled by ghc
to produce an executable.

<pre class="Agda"><a id="5179" class="Keyword">import</a> <a id="5186" href="Main.html" class="Module">Main</a>
</pre>
