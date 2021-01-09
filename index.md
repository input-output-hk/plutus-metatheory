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
contains a small step reduction algorithm for types and the
[`Type.CK`](Type/CK.html) contains a CK machine for
types. Neither are used directly in the formalisation as computation
on types is carried out using normalisation by evaluation
instead. Equality of types is specified in the
[`Type.Equality`](Type/Equality.html) module. Equality serves as a
specification of type compuation and is used in the normalisation
proof.

<pre class="Agda"><a id="2365" class="Keyword">import</a> <a id="2372" href="Type.html" class="Module">Type</a>
<a id="2377" class="Keyword">import</a> <a id="2384" href="Type.RenamingSubstitution.html" class="Module">Type.RenamingSubstitution</a>
<a id="2410" class="Keyword">import</a> <a id="2417" href="Type.Equality.html" class="Module">Type.Equality</a>
<a id="2431" class="Keyword">import</a> <a id="2438" href="Type.Reduction.html" class="Module">Type.Reduction</a>
<a id="2453" class="Keyword">import</a> <a id="2460" href="Type.CK.html" class="Module">Type.CK</a>
</pre>
## Normal Types

Beta normal forms, a beta NBE algorithm and accompanying soundness,
completeness and stability proofs and necessary equipment for
substituting into normal types by embedding back into syntax,
substituting and renormalising.

<pre class="Agda"><a id="2719" class="Keyword">import</a> <a id="2726" href="Type.BetaNormal.html" class="Module">Type.BetaNormal</a>
<a id="2742" class="Keyword">import</a> <a id="2749" href="Type.BetaNBE.html" class="Module">Type.BetaNBE</a>
<a id="2762" class="Keyword">import</a> <a id="2769" href="Type.BetaNBE.Soundness.html" class="Module">Type.BetaNBE.Soundness</a>
<a id="2792" class="Keyword">import</a> <a id="2799" href="Type.BetaNBE.Completeness.html" class="Module">Type.BetaNBE.Completeness</a>
<a id="2825" class="Keyword">import</a> <a id="2832" href="Type.BetaNBE.Stability.html" class="Module">Type.BetaNBE.Stability</a>
<a id="2855" class="Keyword">import</a> <a id="2862" href="Type.BetaNBE.RenamingSubstitution.html" class="Module">Type.BetaNBE.RenamingSubstitution</a>
</pre>
## Builtins

Builtins extend the core System F-omega-mu calculus with primitive
types such as integers and bytestrings and operations on them.

<pre class="Agda"><a id="3049" class="Keyword">import</a> <a id="3056" href="Builtin.Signature.html" class="Module">Builtin.Signature</a>
<a id="3074" class="Keyword">import</a> <a id="3081" href="Builtin.Constant.Type.html" class="Module">Builtin.Constant.Type</a>
<a id="3103" class="Keyword">import</a> <a id="3110" href="Builtin.Constant.Term.html" class="Module">Builtin.Constant.Term</a>
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

<pre class="Agda"><a id="3684" class="Keyword">import</a> <a id="3691" href="Declarative.html" class="Module">Declarative</a>
<a id="3703" class="Keyword">import</a> <a id="3710" href="Declarative.RenamingSubstitution.html" class="Module">Declarative.RenamingSubstitution</a>
<a id="3743" class="Keyword">import</a> <a id="3750" href="Declarative.Erasure.html" class="Module">Declarative.Erasure</a>

<a id="3771" class="Keyword">import</a> <a id="3778" href="Declarative.Examples.html" class="Module">Declarative.Examples</a>
<a id="3799" class="Keyword">import</a> <a id="3806" href="Declarative.Examples.StdLib.Function.html" class="Module">Declarative.Examples.StdLib.Function</a>
<a id="3843" class="Keyword">import</a> <a id="3850" href="Declarative.Examples.StdLib.ChurchNat.html" class="Module">Declarative.Examples.StdLib.ChurchNat</a>
<a id="3888" class="Keyword">import</a> <a id="3895" href="Declarative.Examples.StdLib.Nat.html" class="Module">Declarative.Examples.StdLib.Nat</a>
</pre>
## Algorithmic syntax

Terms, reduction and evaluation where terms are indexed by normal
types

<pre class="Agda"><a id="4032" class="Keyword">import</a> <a id="4039" href="Algorithmic.html" class="Module">Algorithmic</a>
<a id="4051" class="Keyword">import</a> <a id="4058" href="Algorithmic.RenamingSubstitution.html" class="Module">Algorithmic.RenamingSubstitution</a>
<a id="4091" class="Keyword">import</a> <a id="4098" href="Algorithmic.Reduction.html" class="Module">Algorithmic.Reduction</a>
<a id="4120" class="Keyword">import</a> <a id="4127" href="Algorithmic.Evaluation.html" class="Module">Algorithmic.Evaluation</a>
<a id="4150" class="Keyword">import</a> <a id="4157" href="Algorithmic.Main.html" class="Module">Algorithmic.Main</a>
<a id="4174" class="Keyword">import</a> <a id="4181" href="Algorithmic.Completeness.html" class="Module">Algorithmic.Completeness</a>
<a id="4206" class="Keyword">import</a> <a id="4213" href="Algorithmic.Soundness.html" class="Module">Algorithmic.Soundness</a>
<a id="4235" class="Keyword">import</a> <a id="4242" href="Algorithmic.Erasure.html" class="Module">Algorithmic.Erasure</a>
<a id="4262" class="Keyword">import</a> <a id="4269" href="Algorithmic.Erasure.RenamingSubstitution.html" class="Module">Algorithmic.Erasure.RenamingSubstitution</a>
<a id="4310" class="Comment">--import Algorithmic.Erasure.Reduction</a>
<a id="4349" class="Keyword">import</a> <a id="4356" href="Algorithmic.CK.html" class="Module">Algorithmic.CK</a>
<a id="4371" class="Keyword">import</a> <a id="4378" href="Algorithmic.CEKV.html" class="Module">Algorithmic.CEKV</a>

<a id="4396" class="Keyword">import</a> <a id="4403" href="Algorithmic.Examples.html" class="Module">Algorithmic.Examples</a>
</pre>
## Extrinsically typed syntax a.k.a. Well Scoped Terms

Extrinsically typed terms, reduction and evaluation

<pre class="Agda"><a id="4542" class="Keyword">import</a> <a id="4549" href="Scoped.html" class="Module">Scoped</a>
<a id="4556" class="Keyword">import</a> <a id="4563" href="Scoped.RenamingSubstitution.html" class="Module">Scoped.RenamingSubstitution</a>

<a id="4592" class="Keyword">import</a> <a id="4599" href="Scoped.Reduction.html" class="Module">Scoped.Reduction</a>

<a id="4617" class="Keyword">import</a> <a id="4624" href="Scoped.Extrication.html" class="Module">Scoped.Extrication</a>
<a id="4643" class="Keyword">import</a> <a id="4650" href="Scoped.Extrication.RenamingSubstitution.html" class="Module">Scoped.Extrication.RenamingSubstitution</a>
<a id="4690" class="Comment">--import Scoped.Extrication.Reduction</a>
<a id="4728" class="Keyword">import</a> <a id="4735" href="Scoped.Erasure.html" class="Module">Scoped.Erasure</a>
<a id="4750" class="Comment">--import Scoped.Erasure.RenamingSubstitution</a>
<a id="4795" class="Comment">--import Scoped.Erasure.Reduction</a>
<a id="4829" class="Keyword">import</a> <a id="4836" href="Scoped.CK.html" class="Module">Scoped.CK</a>
</pre>
## Untyped terms

Untyped terms, reduction and evaluation

<pre class="Agda"><a id="4914" class="Keyword">import</a> <a id="4921" href="Untyped.html" class="Module">Untyped</a>
<a id="4929" class="Keyword">import</a> <a id="4936" href="Untyped.RenamingSubstitution.html" class="Module">Untyped.RenamingSubstitution</a>
<a id="4965" class="Keyword">import</a> <a id="4972" href="Untyped.Reduction.html" class="Module">Untyped.Reduction</a>
</pre>
## Type checker

This takes a well-scoped term and produces an intrinsically typed term
as evidence of successful typechecking.

<pre class="Agda"><a id="5128" class="Keyword">import</a> <a id="5135" href="Check.html" class="Module">Check</a>
</pre>
## Executable

This module is is compiled to Haskell and then can be compiled by ghc
to produce an executable.

<pre class="Agda"><a id="5262" class="Keyword">import</a> <a id="5269" href="Main.html" class="Module">Main</a>
</pre>
