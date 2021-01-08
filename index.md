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
<a id="2342" class="Keyword">import</a> <a id="2349" href="Type.Reduction.html" class="Module">Type.Reduction</a>
<a id="2364" class="Keyword">import</a> <a id="2371" href="Type.Equality.html" class="Module">Type.Equality</a>
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

<pre class="Agda"><a id="2968" class="Keyword">import</a> <a id="2975" href="Builtin.Signature.html" class="Module">Builtin.Signature</a>
<a id="2993" class="Keyword">import</a> <a id="3000" href="Builtin.Constant.Type.html" class="Module">Builtin.Constant.Type</a>
<a id="3022" class="Keyword">import</a> <a id="3029" href="Builtin.Constant.Term.html" class="Module">Builtin.Constant.Term</a>
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

<pre class="Agda"><a id="3603" class="Keyword">import</a> <a id="3610" href="Declarative.html" class="Module">Declarative</a>
<a id="3622" class="Keyword">import</a> <a id="3629" href="Declarative.RenamingSubstitution.html" class="Module">Declarative.RenamingSubstitution</a>
<a id="3662" class="Keyword">import</a> <a id="3669" href="Declarative.Erasure.html" class="Module">Declarative.Erasure</a>

<a id="3690" class="Keyword">import</a> <a id="3697" href="Declarative.Examples.html" class="Module">Declarative.Examples</a>
<a id="3718" class="Keyword">import</a> <a id="3725" href="Declarative.Examples.StdLib.Function.html" class="Module">Declarative.Examples.StdLib.Function</a>
<a id="3762" class="Keyword">import</a> <a id="3769" href="Declarative.Examples.StdLib.ChurchNat.html" class="Module">Declarative.Examples.StdLib.ChurchNat</a>
<a id="3807" class="Keyword">import</a> <a id="3814" href="Declarative.Examples.StdLib.Nat.html" class="Module">Declarative.Examples.StdLib.Nat</a>
</pre>
## Algorithmic syntax

Terms, reduction and evaluation where terms are indexed by normal
types

<pre class="Agda"><a id="3951" class="Keyword">import</a> <a id="3958" href="Algorithmic.html" class="Module">Algorithmic</a>
<a id="3970" class="Keyword">import</a> <a id="3977" href="Algorithmic.RenamingSubstitution.html" class="Module">Algorithmic.RenamingSubstitution</a>
<a id="4010" class="Keyword">import</a> <a id="4017" href="Algorithmic.Reduction.html" class="Module">Algorithmic.Reduction</a>
<a id="4039" class="Keyword">import</a> <a id="4046" href="Algorithmic.Evaluation.html" class="Module">Algorithmic.Evaluation</a>
<a id="4069" class="Keyword">import</a> <a id="4076" href="Algorithmic.Main.html" class="Module">Algorithmic.Main</a>
<a id="4093" class="Keyword">import</a> <a id="4100" href="Algorithmic.Completeness.html" class="Module">Algorithmic.Completeness</a>
<a id="4125" class="Keyword">import</a> <a id="4132" href="Algorithmic.Soundness.html" class="Module">Algorithmic.Soundness</a>
<a id="4154" class="Keyword">import</a> <a id="4161" href="Algorithmic.Erasure.html" class="Module">Algorithmic.Erasure</a>
<a id="4181" class="Keyword">import</a> <a id="4188" href="Algorithmic.Erasure.RenamingSubstitution.html" class="Module">Algorithmic.Erasure.RenamingSubstitution</a>
<a id="4229" class="Comment">--import Algorithmic.Erasure.Reduction</a>
<a id="4268" class="Keyword">import</a> <a id="4275" href="Algorithmic.CK.html" class="Module">Algorithmic.CK</a>
<a id="4290" class="Keyword">import</a> <a id="4297" href="Algorithmic.CEKV.html" class="Module">Algorithmic.CEKV</a>

<a id="4315" class="Keyword">import</a> <a id="4322" href="Algorithmic.Examples.html" class="Module">Algorithmic.Examples</a>
</pre>
## Extrinsically typed syntax a.k.a. Well Scoped Terms

Extrinsically typed terms, reduction and evaluation

<pre class="Agda"><a id="4461" class="Keyword">import</a> <a id="4468" href="Scoped.html" class="Module">Scoped</a>
<a id="4475" class="Keyword">import</a> <a id="4482" href="Scoped.RenamingSubstitution.html" class="Module">Scoped.RenamingSubstitution</a>

<a id="4511" class="Keyword">import</a> <a id="4518" href="Scoped.Reduction.html" class="Module">Scoped.Reduction</a>

<a id="4536" class="Keyword">import</a> <a id="4543" href="Scoped.Extrication.html" class="Module">Scoped.Extrication</a>
<a id="4562" class="Keyword">import</a> <a id="4569" href="Scoped.Extrication.RenamingSubstitution.html" class="Module">Scoped.Extrication.RenamingSubstitution</a>
<a id="4609" class="Comment">--import Scoped.Extrication.Reduction</a>
<a id="4647" class="Keyword">import</a> <a id="4654" href="Scoped.Erasure.html" class="Module">Scoped.Erasure</a>
<a id="4669" class="Comment">--import Scoped.Erasure.RenamingSubstitution</a>
<a id="4714" class="Comment">--import Scoped.Erasure.Reduction</a>
<a id="4748" class="Keyword">import</a> <a id="4755" href="Scoped.CK.html" class="Module">Scoped.CK</a>
</pre>
## Untyped terms

Untyped terms, reduction and evaluation

<pre class="Agda"><a id="4833" class="Keyword">import</a> <a id="4840" href="Untyped.html" class="Module">Untyped</a>
<a id="4848" class="Keyword">import</a> <a id="4855" href="Untyped.RenamingSubstitution.html" class="Module">Untyped.RenamingSubstitution</a>
<a id="4884" class="Keyword">import</a> <a id="4891" href="Untyped.Reduction.html" class="Module">Untyped.Reduction</a>
</pre>
## Type checker

This takes a well-scoped term and produces an intrinsically typed term
as evidence of successful typechecking.

<pre class="Agda"><a id="5047" class="Keyword">import</a> <a id="5054" href="Check.html" class="Module">Check</a>
</pre>
## Executable

This module is is compiled to Haskell and then can be compiled by ghc
to produce an executable.

<pre class="Agda"><a id="5181" class="Keyword">import</a> <a id="5188" href="Main.html" class="Module">Main</a>
</pre>
