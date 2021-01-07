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

Type syntax, renaming and substitution, a reduction algorithm (not
used) and a definition of type equality.

<pre class="Agda"><a id="1487" class="Keyword">import</a> <a id="1494" href="Type.html" class="Module">Type</a>
<a id="1499" class="Keyword">import</a> <a id="1506" href="Type.RenamingSubstitution.html" class="Module">Type.RenamingSubstitution</a>
<a id="1532" class="Keyword">import</a> <a id="1539" href="Type.Reduction.html" class="Module">Type.Reduction</a>
<a id="1554" class="Keyword">import</a> <a id="1561" href="Type.Equality.html" class="Module">Type.Equality</a>
</pre>
## Normal Types

Beta normal forms, a beta NBE algorithm and accompanying soundness,
completeness and stability proofs and necessary equipment for
substituting into normal types by embedding back into syntax,
substituting and renormalising.

<pre class="Agda"><a id="1826" class="Keyword">import</a> <a id="1833" href="Type.BetaNormal.html" class="Module">Type.BetaNormal</a>
<a id="1849" class="Keyword">import</a> <a id="1856" href="Type.BetaNBE.html" class="Module">Type.BetaNBE</a>
<a id="1869" class="Keyword">import</a> <a id="1876" href="Type.BetaNBE.Soundness.html" class="Module">Type.BetaNBE.Soundness</a>
<a id="1899" class="Keyword">import</a> <a id="1906" href="Type.BetaNBE.Completeness.html" class="Module">Type.BetaNBE.Completeness</a>
<a id="1932" class="Keyword">import</a> <a id="1939" href="Type.BetaNBE.Stability.html" class="Module">Type.BetaNBE.Stability</a>
<a id="1962" class="Keyword">import</a> <a id="1969" href="Type.BetaNBE.RenamingSubstitution.html" class="Module">Type.BetaNBE.RenamingSubstitution</a>
</pre>


## Builtins

Builtins extend the core System F-omega-mu calculus with primitive
types such as integers and bytestrings and operations on them.

<pre class="Agda"><a id="2158" class="Keyword">import</a> <a id="2165" href="Builtin.Signature.html" class="Module">Builtin.Signature</a>
<a id="2183" class="Keyword">import</a> <a id="2190" href="Builtin.Constant.Type.html" class="Module">Builtin.Constant.Type</a>
<a id="2212" class="Keyword">import</a> <a id="2219" href="Builtin.Constant.Term.html" class="Module">Builtin.Constant.Term</a>
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

<pre class="Agda"><a id="2793" class="Keyword">import</a> <a id="2800" href="Declarative.html" class="Module">Declarative</a>
<a id="2812" class="Keyword">import</a> <a id="2819" href="Declarative.RenamingSubstitution.html" class="Module">Declarative.RenamingSubstitution</a>
<a id="2852" class="Keyword">import</a> <a id="2859" href="Declarative.Erasure.html" class="Module">Declarative.Erasure</a>

<a id="2880" class="Keyword">import</a> <a id="2887" href="Declarative.Examples.html" class="Module">Declarative.Examples</a>
<a id="2908" class="Keyword">import</a> <a id="2915" href="Declarative.Examples.StdLib.Function.html" class="Module">Declarative.Examples.StdLib.Function</a>
<a id="2952" class="Keyword">import</a> <a id="2959" href="Declarative.Examples.StdLib.ChurchNat.html" class="Module">Declarative.Examples.StdLib.ChurchNat</a>
<a id="2997" class="Keyword">import</a> <a id="3004" href="Declarative.Examples.StdLib.Nat.html" class="Module">Declarative.Examples.StdLib.Nat</a>
</pre>
## Algorithmic syntax

Terms, reduction and evaluation where terms are indexed by normal
types

<pre class="Agda"><a id="3141" class="Keyword">import</a> <a id="3148" href="Algorithmic.html" class="Module">Algorithmic</a>
<a id="3160" class="Keyword">import</a> <a id="3167" href="Algorithmic.RenamingSubstitution.html" class="Module">Algorithmic.RenamingSubstitution</a>
<a id="3200" class="Keyword">import</a> <a id="3207" href="Algorithmic.Reduction.html" class="Module">Algorithmic.Reduction</a>
<a id="3229" class="Keyword">import</a> <a id="3236" href="Algorithmic.Evaluation.html" class="Module">Algorithmic.Evaluation</a>
<a id="3259" class="Keyword">import</a> <a id="3266" href="Algorithmic.Main.html" class="Module">Algorithmic.Main</a>
<a id="3283" class="Keyword">import</a> <a id="3290" href="Algorithmic.Completeness.html" class="Module">Algorithmic.Completeness</a>
<a id="3315" class="Keyword">import</a> <a id="3322" href="Algorithmic.Soundness.html" class="Module">Algorithmic.Soundness</a>
<a id="3344" class="Keyword">import</a> <a id="3351" href="Algorithmic.Erasure.html" class="Module">Algorithmic.Erasure</a>
<a id="3371" class="Keyword">import</a> <a id="3378" href="Algorithmic.Erasure.RenamingSubstitution.html" class="Module">Algorithmic.Erasure.RenamingSubstitution</a>
<a id="3419" class="Comment">--import Algorithmic.Erasure.Reduction</a>
<a id="3458" class="Keyword">import</a> <a id="3465" href="Algorithmic.CK.html" class="Module">Algorithmic.CK</a>
<a id="3480" class="Keyword">import</a> <a id="3487" href="Algorithmic.CEKV.html" class="Module">Algorithmic.CEKV</a>

<a id="3505" class="Keyword">import</a> <a id="3512" href="Algorithmic.Examples.html" class="Module">Algorithmic.Examples</a>
</pre>
## Extrinsically typed syntax a.k.a. Well Scoped Terms

Extrinsically typed terms, reduction and evaluation

<pre class="Agda"><a id="3651" class="Keyword">import</a> <a id="3658" href="Scoped.html" class="Module">Scoped</a>
<a id="3665" class="Keyword">import</a> <a id="3672" href="Scoped.RenamingSubstitution.html" class="Module">Scoped.RenamingSubstitution</a>

<a id="3701" class="Keyword">import</a> <a id="3708" href="Scoped.Reduction.html" class="Module">Scoped.Reduction</a>

<a id="3726" class="Keyword">import</a> <a id="3733" href="Scoped.Extrication.html" class="Module">Scoped.Extrication</a>
<a id="3752" class="Keyword">import</a> <a id="3759" href="Scoped.Extrication.RenamingSubstitution.html" class="Module">Scoped.Extrication.RenamingSubstitution</a>
<a id="3799" class="Comment">--import Scoped.Extrication.Reduction</a>
<a id="3837" class="Keyword">import</a> <a id="3844" href="Scoped.Erasure.html" class="Module">Scoped.Erasure</a>
<a id="3859" class="Comment">--import Scoped.Erasure.RenamingSubstitution</a>
<a id="3904" class="Comment">--import Scoped.Erasure.Reduction</a>
<a id="3938" class="Keyword">import</a> <a id="3945" href="Scoped.CK.html" class="Module">Scoped.CK</a>
</pre>
## Untyped terms

Untyped terms, reduction and evaluation

<pre class="Agda"><a id="4023" class="Keyword">import</a> <a id="4030" href="Untyped.html" class="Module">Untyped</a>
<a id="4038" class="Keyword">import</a> <a id="4045" href="Untyped.RenamingSubstitution.html" class="Module">Untyped.RenamingSubstitution</a>
<a id="4074" class="Keyword">import</a> <a id="4081" href="Untyped.Reduction.html" class="Module">Untyped.Reduction</a>
</pre>
## Type checker

This takes a well-scoped term and produces an intrinsically typed term
as evidence of successful typechecking.

<pre class="Agda"><a id="4237" class="Keyword">import</a> <a id="4244" href="Check.html" class="Module">Check</a>
</pre>
## Executable

This module is is compiled to Haskell and then can be compiled by ghc
to produce an executable.

<pre class="Agda"><a id="4371" class="Keyword">import</a> <a id="4378" href="Main.html" class="Module">Main</a>
</pre>
