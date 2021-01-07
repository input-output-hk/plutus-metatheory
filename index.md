---
layout: page
title: Table of Contents
---

The Formalisation is split into several sections:

1. [Types](#types)
2. [Normalisation of types](#normal-types)
3. [Builtin machinery](#builtins)
4. [Declarative terms](#declarative-syntax)
5. [Algorithmic terms](#algorithmic-syntax)
6. [Well-scoped types and terms](#extrinsically-typed-syntax-aka-well-scoped-terms)
7. [A typechecker](#type-checker)
8. [Untyped terms](#untyped-terms)
9. [An executable](#executable)


## Types

Type syntax, renaming and substitution, a reduction algorithm (not
used) and a definition of type equality.

<pre class="Agda"><a id="593" class="Keyword">import</a> <a id="600" href="Type.html" class="Module">Type</a>
<a id="605" class="Keyword">import</a> <a id="612" href="Type.RenamingSubstitution.html" class="Module">Type.RenamingSubstitution</a>
<a id="638" class="Keyword">import</a> <a id="645" href="Type.Reduction.html" class="Module">Type.Reduction</a>
<a id="660" class="Keyword">import</a> <a id="667" href="Type.Equality.html" class="Module">Type.Equality</a>
</pre>
## Normal Types

Beta normal forms, a beta NBE algorithm and accompanying soundness,
completeness and stability proofs and necessary equipment for
substituting into normal types by embedding back into syntax,
substituting and renormalising.

<pre class="Agda"><a id="932" class="Keyword">import</a> <a id="939" href="Type.BetaNormal.html" class="Module">Type.BetaNormal</a>
<a id="955" class="Keyword">import</a> <a id="962" href="Type.BetaNBE.html" class="Module">Type.BetaNBE</a>
<a id="975" class="Keyword">import</a> <a id="982" href="Type.BetaNBE.Soundness.html" class="Module">Type.BetaNBE.Soundness</a>
<a id="1005" class="Keyword">import</a> <a id="1012" href="Type.BetaNBE.Completeness.html" class="Module">Type.BetaNBE.Completeness</a>
<a id="1038" class="Keyword">import</a> <a id="1045" href="Type.BetaNBE.Stability.html" class="Module">Type.BetaNBE.Stability</a>
<a id="1068" class="Keyword">import</a> <a id="1075" href="Type.BetaNBE.RenamingSubstitution.html" class="Module">Type.BetaNBE.RenamingSubstitution</a>
</pre>


## Builtins

Builtins extend the core System F-omega-mu calculus with primitive
types such as integers and bytestrings and operations on them.

<pre class="Agda"><a id="1264" class="Keyword">import</a> <a id="1271" href="Builtin.Signature.html" class="Module">Builtin.Signature</a>
<a id="1289" class="Keyword">import</a> <a id="1296" href="Builtin.Constant.Type.html" class="Module">Builtin.Constant.Type</a>
<a id="1318" class="Keyword">import</a> <a id="1325" href="Builtin.Constant.Term.html" class="Module">Builtin.Constant.Term</a>
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

<pre class="Agda"><a id="1899" class="Keyword">import</a> <a id="1906" href="Declarative.html" class="Module">Declarative</a>
<a id="1918" class="Keyword">import</a> <a id="1925" href="Declarative.RenamingSubstitution.html" class="Module">Declarative.RenamingSubstitution</a>
<a id="1958" class="Keyword">import</a> <a id="1965" href="Declarative.Erasure.html" class="Module">Declarative.Erasure</a>

<a id="1986" class="Keyword">import</a> <a id="1993" href="Declarative.Examples.html" class="Module">Declarative.Examples</a>
<a id="2014" class="Keyword">import</a> <a id="2021" href="Declarative.Examples.StdLib.Function.html" class="Module">Declarative.Examples.StdLib.Function</a>
<a id="2058" class="Keyword">import</a> <a id="2065" href="Declarative.Examples.StdLib.ChurchNat.html" class="Module">Declarative.Examples.StdLib.ChurchNat</a>
<a id="2103" class="Keyword">import</a> <a id="2110" href="Declarative.Examples.StdLib.Nat.html" class="Module">Declarative.Examples.StdLib.Nat</a>
</pre>
## Algorithmic syntax

Terms, reduction and evaluation where terms are indexed by normal
types

<pre class="Agda"><a id="2247" class="Keyword">import</a> <a id="2254" href="Algorithmic.html" class="Module">Algorithmic</a>
<a id="2266" class="Keyword">import</a> <a id="2273" href="Algorithmic.RenamingSubstitution.html" class="Module">Algorithmic.RenamingSubstitution</a>
<a id="2306" class="Keyword">import</a> <a id="2313" href="Algorithmic.Reduction.html" class="Module">Algorithmic.Reduction</a>
<a id="2335" class="Keyword">import</a> <a id="2342" href="Algorithmic.Evaluation.html" class="Module">Algorithmic.Evaluation</a>
<a id="2365" class="Keyword">import</a> <a id="2372" href="Algorithmic.Main.html" class="Module">Algorithmic.Main</a>
<a id="2389" class="Keyword">import</a> <a id="2396" href="Algorithmic.Completeness.html" class="Module">Algorithmic.Completeness</a>
<a id="2421" class="Keyword">import</a> <a id="2428" href="Algorithmic.Soundness.html" class="Module">Algorithmic.Soundness</a>
<a id="2450" class="Keyword">import</a> <a id="2457" href="Algorithmic.Erasure.html" class="Module">Algorithmic.Erasure</a>
<a id="2477" class="Keyword">import</a> <a id="2484" href="Algorithmic.Erasure.RenamingSubstitution.html" class="Module">Algorithmic.Erasure.RenamingSubstitution</a>
<a id="2525" class="Comment">--import Algorithmic.Erasure.Reduction</a>
<a id="2564" class="Keyword">import</a> <a id="2571" href="Algorithmic.CK.html" class="Module">Algorithmic.CK</a>
<a id="2586" class="Keyword">import</a> <a id="2593" href="Algorithmic.CEKV.html" class="Module">Algorithmic.CEKV</a>

<a id="2611" class="Keyword">import</a> <a id="2618" href="Algorithmic.Examples.html" class="Module">Algorithmic.Examples</a>
</pre>
## Extrinsically typed syntax a.k.a. Well Scoped Terms

Extrinsically typed terms, reduction and evaluation

<pre class="Agda"><a id="2757" class="Keyword">import</a> <a id="2764" href="Scoped.html" class="Module">Scoped</a>
<a id="2771" class="Keyword">import</a> <a id="2778" href="Scoped.RenamingSubstitution.html" class="Module">Scoped.RenamingSubstitution</a>

<a id="2807" class="Keyword">import</a> <a id="2814" href="Scoped.Reduction.html" class="Module">Scoped.Reduction</a>

<a id="2832" class="Keyword">import</a> <a id="2839" href="Scoped.Extrication.html" class="Module">Scoped.Extrication</a>
<a id="2858" class="Keyword">import</a> <a id="2865" href="Scoped.Extrication.RenamingSubstitution.html" class="Module">Scoped.Extrication.RenamingSubstitution</a>
<a id="2905" class="Comment">--import Scoped.Extrication.Reduction</a>
<a id="2943" class="Keyword">import</a> <a id="2950" href="Scoped.Erasure.html" class="Module">Scoped.Erasure</a>
<a id="2965" class="Comment">--import Scoped.Erasure.RenamingSubstitution</a>
<a id="3010" class="Comment">--import Scoped.Erasure.Reduction</a>
<a id="3044" class="Keyword">import</a> <a id="3051" href="Scoped.CK.html" class="Module">Scoped.CK</a>
</pre>
## Untyped terms

Untyped terms, reduction and evaluation

<pre class="Agda"><a id="3129" class="Keyword">import</a> <a id="3136" href="Untyped.html" class="Module">Untyped</a>
<a id="3144" class="Keyword">import</a> <a id="3151" href="Untyped.RenamingSubstitution.html" class="Module">Untyped.RenamingSubstitution</a>
<a id="3180" class="Keyword">import</a> <a id="3187" href="Untyped.Reduction.html" class="Module">Untyped.Reduction</a>
</pre>
## Type checker

This takes a well-scoped term and produces an intrinsically typed term
as evidence of successful typechecking.

<pre class="Agda"><a id="3343" class="Keyword">import</a> <a id="3350" href="Check.html" class="Module">Check</a>
</pre>
## Executable

This module is is compiled to Haskell and then can be compiled by ghc
to produce an executable.

<pre class="Agda"><a id="3477" class="Keyword">import</a> <a id="3484" href="Main.html" class="Module">Main</a>
</pre>
