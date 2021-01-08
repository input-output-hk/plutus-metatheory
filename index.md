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

The type level language is similar to simply typed lambda calculus
with the addition of constants for forall, mu, and builtin
contants. The `Type` module containts kinds, contexts and types. Types
are intrinsically scoped and kinded and variables are represented
using De Bruijn indices. Parallel renaming and substitution are
implemented in the `Type.RenamingSubstitution` module and they are
shown to be satisfy the functor and relative monad laws
respectively. The `Type.Reduction` module contains a small step
reduction algorithm for types. It is not used directly in the
formalisation as computation on types is carried out using
normalisation by evaluation instead. Equality of types is specified in
the `Type.Equality` module. Equality serves as a specification of
type compuation and is used in the normalisation proof.

<pre class="Agda"><a id="2207" class="Keyword">import</a> <a id="2214" href="Type.html" class="Module">Type</a>
<a id="2219" class="Keyword">import</a> <a id="2226" href="Type.RenamingSubstitution.html" class="Module">Type.RenamingSubstitution</a>
<a id="2252" class="Keyword">import</a> <a id="2259" href="Type.Reduction.html" class="Module">Type.Reduction</a>
<a id="2274" class="Keyword">import</a> <a id="2281" href="Type.Equality.html" class="Module">Type.Equality</a>
</pre>
## Normal Types

Beta normal forms, a beta NBE algorithm and accompanying soundness,
completeness and stability proofs and necessary equipment for
substituting into normal types by embedding back into syntax,
substituting and renormalising.

<pre class="Agda"><a id="2546" class="Keyword">import</a> <a id="2553" href="Type.BetaNormal.html" class="Module">Type.BetaNormal</a>
<a id="2569" class="Keyword">import</a> <a id="2576" href="Type.BetaNBE.html" class="Module">Type.BetaNBE</a>
<a id="2589" class="Keyword">import</a> <a id="2596" href="Type.BetaNBE.Soundness.html" class="Module">Type.BetaNBE.Soundness</a>
<a id="2619" class="Keyword">import</a> <a id="2626" href="Type.BetaNBE.Completeness.html" class="Module">Type.BetaNBE.Completeness</a>
<a id="2652" class="Keyword">import</a> <a id="2659" href="Type.BetaNBE.Stability.html" class="Module">Type.BetaNBE.Stability</a>
<a id="2682" class="Keyword">import</a> <a id="2689" href="Type.BetaNBE.RenamingSubstitution.html" class="Module">Type.BetaNBE.RenamingSubstitution</a>
</pre>


## Builtins

Builtins extend the core System F-omega-mu calculus with primitive
types such as integers and bytestrings and operations on them.

<pre class="Agda"><a id="2878" class="Keyword">import</a> <a id="2885" href="Builtin.Signature.html" class="Module">Builtin.Signature</a>
<a id="2903" class="Keyword">import</a> <a id="2910" href="Builtin.Constant.Type.html" class="Module">Builtin.Constant.Type</a>
<a id="2932" class="Keyword">import</a> <a id="2939" href="Builtin.Constant.Term.html" class="Module">Builtin.Constant.Term</a>
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

<pre class="Agda"><a id="3513" class="Keyword">import</a> <a id="3520" href="Declarative.html" class="Module">Declarative</a>
<a id="3532" class="Keyword">import</a> <a id="3539" href="Declarative.RenamingSubstitution.html" class="Module">Declarative.RenamingSubstitution</a>
<a id="3572" class="Keyword">import</a> <a id="3579" href="Declarative.Erasure.html" class="Module">Declarative.Erasure</a>

<a id="3600" class="Keyword">import</a> <a id="3607" href="Declarative.Examples.html" class="Module">Declarative.Examples</a>
<a id="3628" class="Keyword">import</a> <a id="3635" href="Declarative.Examples.StdLib.Function.html" class="Module">Declarative.Examples.StdLib.Function</a>
<a id="3672" class="Keyword">import</a> <a id="3679" href="Declarative.Examples.StdLib.ChurchNat.html" class="Module">Declarative.Examples.StdLib.ChurchNat</a>
<a id="3717" class="Keyword">import</a> <a id="3724" href="Declarative.Examples.StdLib.Nat.html" class="Module">Declarative.Examples.StdLib.Nat</a>
</pre>
## Algorithmic syntax

Terms, reduction and evaluation where terms are indexed by normal
types

<pre class="Agda"><a id="3861" class="Keyword">import</a> <a id="3868" href="Algorithmic.html" class="Module">Algorithmic</a>
<a id="3880" class="Keyword">import</a> <a id="3887" href="Algorithmic.RenamingSubstitution.html" class="Module">Algorithmic.RenamingSubstitution</a>
<a id="3920" class="Keyword">import</a> <a id="3927" href="Algorithmic.Reduction.html" class="Module">Algorithmic.Reduction</a>
<a id="3949" class="Keyword">import</a> <a id="3956" href="Algorithmic.Evaluation.html" class="Module">Algorithmic.Evaluation</a>
<a id="3979" class="Keyword">import</a> <a id="3986" href="Algorithmic.Main.html" class="Module">Algorithmic.Main</a>
<a id="4003" class="Keyword">import</a> <a id="4010" href="Algorithmic.Completeness.html" class="Module">Algorithmic.Completeness</a>
<a id="4035" class="Keyword">import</a> <a id="4042" href="Algorithmic.Soundness.html" class="Module">Algorithmic.Soundness</a>
<a id="4064" class="Keyword">import</a> <a id="4071" href="Algorithmic.Erasure.html" class="Module">Algorithmic.Erasure</a>
<a id="4091" class="Keyword">import</a> <a id="4098" href="Algorithmic.Erasure.RenamingSubstitution.html" class="Module">Algorithmic.Erasure.RenamingSubstitution</a>
<a id="4139" class="Comment">--import Algorithmic.Erasure.Reduction</a>
<a id="4178" class="Keyword">import</a> <a id="4185" href="Algorithmic.CK.html" class="Module">Algorithmic.CK</a>
<a id="4200" class="Keyword">import</a> <a id="4207" href="Algorithmic.CEKV.html" class="Module">Algorithmic.CEKV</a>

<a id="4225" class="Keyword">import</a> <a id="4232" href="Algorithmic.Examples.html" class="Module">Algorithmic.Examples</a>
</pre>
## Extrinsically typed syntax a.k.a. Well Scoped Terms

Extrinsically typed terms, reduction and evaluation

<pre class="Agda"><a id="4371" class="Keyword">import</a> <a id="4378" href="Scoped.html" class="Module">Scoped</a>
<a id="4385" class="Keyword">import</a> <a id="4392" href="Scoped.RenamingSubstitution.html" class="Module">Scoped.RenamingSubstitution</a>

<a id="4421" class="Keyword">import</a> <a id="4428" href="Scoped.Reduction.html" class="Module">Scoped.Reduction</a>

<a id="4446" class="Keyword">import</a> <a id="4453" href="Scoped.Extrication.html" class="Module">Scoped.Extrication</a>
<a id="4472" class="Keyword">import</a> <a id="4479" href="Scoped.Extrication.RenamingSubstitution.html" class="Module">Scoped.Extrication.RenamingSubstitution</a>
<a id="4519" class="Comment">--import Scoped.Extrication.Reduction</a>
<a id="4557" class="Keyword">import</a> <a id="4564" href="Scoped.Erasure.html" class="Module">Scoped.Erasure</a>
<a id="4579" class="Comment">--import Scoped.Erasure.RenamingSubstitution</a>
<a id="4624" class="Comment">--import Scoped.Erasure.Reduction</a>
<a id="4658" class="Keyword">import</a> <a id="4665" href="Scoped.CK.html" class="Module">Scoped.CK</a>
</pre>
## Untyped terms

Untyped terms, reduction and evaluation

<pre class="Agda"><a id="4743" class="Keyword">import</a> <a id="4750" href="Untyped.html" class="Module">Untyped</a>
<a id="4758" class="Keyword">import</a> <a id="4765" href="Untyped.RenamingSubstitution.html" class="Module">Untyped.RenamingSubstitution</a>
<a id="4794" class="Keyword">import</a> <a id="4801" href="Untyped.Reduction.html" class="Module">Untyped.Reduction</a>
</pre>
## Type checker

This takes a well-scoped term and produces an intrinsically typed term
as evidence of successful typechecking.

<pre class="Agda"><a id="4957" class="Keyword">import</a> <a id="4964" href="Check.html" class="Module">Check</a>
</pre>
## Executable

This module is is compiled to Haskell and then can be compiled by ghc
to produce an executable.

<pre class="Agda"><a id="5091" class="Keyword">import</a> <a id="5098" href="Main.html" class="Module">Main</a>
</pre>
