---
layout: page
title: Table of Contents
---

The Formalisation is split into several sections:

1. Types
2. Normalisation of types
3. Builtin machinery
4. Declarative terms
5. Algorithmic terms
6. Well-scoped types and terms
7. A typechecker
8. Untyped terms
9. An executable


## Types

Type syntax, renaming and substitution, a reduction algorithm (not
used) and a definition of type equality.

<pre class="Agda"><a id="404" class="Keyword">import</a> <a id="411" href="Type.html" class="Module">Type</a>
<a id="416" class="Keyword">import</a> <a id="423" href="Type.RenamingSubstitution.html" class="Module">Type.RenamingSubstitution</a>
<a id="449" class="Keyword">import</a> <a id="456" href="Type.Reduction.html" class="Module">Type.Reduction</a>
<a id="471" class="Keyword">import</a> <a id="478" href="Type.Equality.html" class="Module">Type.Equality</a>
</pre>
## Normal Types

Beta normal forms, a beta NBE algorithm and accompanying soundness,
completeness and stability proofs and necessary equipment for
substituting into normal types by embedding back into syntax,
substituting and renormalising.

<pre class="Agda"><a id="743" class="Keyword">import</a> <a id="750" href="Type.BetaNormal.html" class="Module">Type.BetaNormal</a>
<a id="766" class="Keyword">import</a> <a id="773" href="Type.BetaNBE.html" class="Module">Type.BetaNBE</a>
<a id="786" class="Keyword">import</a> <a id="793" href="Type.BetaNBE.Soundness.html" class="Module">Type.BetaNBE.Soundness</a>
<a id="816" class="Keyword">import</a> <a id="823" href="Type.BetaNBE.Completeness.html" class="Module">Type.BetaNBE.Completeness</a>
<a id="849" class="Keyword">import</a> <a id="856" href="Type.BetaNBE.Stability.html" class="Module">Type.BetaNBE.Stability</a>
<a id="879" class="Keyword">import</a> <a id="886" href="Type.BetaNBE.RenamingSubstitution.html" class="Module">Type.BetaNBE.RenamingSubstitution</a>
</pre>


## Builtins

Builtins extend the core System F-omega-mu calculus with primitive
types such as integers and bytestrings and operations on them.

<pre class="Agda"><a id="1075" class="Keyword">import</a> <a id="1082" href="Builtin.Signature.html" class="Module">Builtin.Signature</a>
<a id="1100" class="Keyword">import</a> <a id="1107" href="Builtin.Constant.Type.html" class="Module">Builtin.Constant.Type</a>
<a id="1129" class="Keyword">import</a> <a id="1136" href="Builtin.Constant.Term.html" class="Module">Builtin.Constant.Term</a>
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

<pre class="Agda"><a id="1710" class="Keyword">import</a> <a id="1717" href="Declarative.html" class="Module">Declarative</a>
<a id="1729" class="Keyword">import</a> <a id="1736" href="Declarative.RenamingSubstitution.html" class="Module">Declarative.RenamingSubstitution</a>
<a id="1769" class="Keyword">import</a> <a id="1776" href="Declarative.Erasure.html" class="Module">Declarative.Erasure</a>

<a id="1797" class="Keyword">import</a> <a id="1804" href="Declarative.Examples.html" class="Module">Declarative.Examples</a>
<a id="1825" class="Keyword">import</a> <a id="1832" href="Declarative.Examples.StdLib.Function.html" class="Module">Declarative.Examples.StdLib.Function</a>
<a id="1869" class="Keyword">import</a> <a id="1876" href="Declarative.Examples.StdLib.ChurchNat.html" class="Module">Declarative.Examples.StdLib.ChurchNat</a>
<a id="1914" class="Keyword">import</a> <a id="1921" href="Declarative.Examples.StdLib.Nat.html" class="Module">Declarative.Examples.StdLib.Nat</a>
</pre>
## Algorithmic syntax

Terms, reduction and evaluation where terms are indexed by normal
types

<pre class="Agda"><a id="2058" class="Keyword">import</a> <a id="2065" href="Algorithmic.html" class="Module">Algorithmic</a>
<a id="2077" class="Keyword">import</a> <a id="2084" href="Algorithmic.RenamingSubstitution.html" class="Module">Algorithmic.RenamingSubstitution</a>
<a id="2117" class="Keyword">import</a> <a id="2124" href="Algorithmic.Reduction.html" class="Module">Algorithmic.Reduction</a>
<a id="2146" class="Keyword">import</a> <a id="2153" href="Algorithmic.Evaluation.html" class="Module">Algorithmic.Evaluation</a>
<a id="2176" class="Keyword">import</a> <a id="2183" href="Algorithmic.Main.html" class="Module">Algorithmic.Main</a>
<a id="2200" class="Keyword">import</a> <a id="2207" href="Algorithmic.Completeness.html" class="Module">Algorithmic.Completeness</a>
<a id="2232" class="Keyword">import</a> <a id="2239" href="Algorithmic.Soundness.html" class="Module">Algorithmic.Soundness</a>
<a id="2261" class="Keyword">import</a> <a id="2268" href="Algorithmic.Erasure.html" class="Module">Algorithmic.Erasure</a>
<a id="2288" class="Keyword">import</a> <a id="2295" href="Algorithmic.Erasure.RenamingSubstitution.html" class="Module">Algorithmic.Erasure.RenamingSubstitution</a>
<a id="2336" class="Comment">--import Algorithmic.Erasure.Reduction</a>
<a id="2375" class="Keyword">import</a> <a id="2382" href="Algorithmic.CK.html" class="Module">Algorithmic.CK</a>
<a id="2397" class="Keyword">import</a> <a id="2404" href="Algorithmic.CEKV.html" class="Module">Algorithmic.CEKV</a>

<a id="2422" class="Keyword">import</a> <a id="2429" href="Algorithmic.Examples.html" class="Module">Algorithmic.Examples</a>
</pre>
## Extrinsically typed syntax a.k.a. Well Scoped Terms

Extrinsically typed terms, reduction and evaluation

<pre class="Agda"><a id="2568" class="Keyword">import</a> <a id="2575" href="Scoped.html" class="Module">Scoped</a>
<a id="2582" class="Keyword">import</a> <a id="2589" href="Scoped.RenamingSubstitution.html" class="Module">Scoped.RenamingSubstitution</a>

<a id="2618" class="Keyword">import</a> <a id="2625" href="Scoped.Reduction.html" class="Module">Scoped.Reduction</a>

<a id="2643" class="Keyword">import</a> <a id="2650" href="Scoped.Extrication.html" class="Module">Scoped.Extrication</a>
<a id="2669" class="Keyword">import</a> <a id="2676" href="Scoped.Extrication.RenamingSubstitution.html" class="Module">Scoped.Extrication.RenamingSubstitution</a>
<a id="2716" class="Comment">--import Scoped.Extrication.Reduction</a>
<a id="2754" class="Keyword">import</a> <a id="2761" href="Scoped.Erasure.html" class="Module">Scoped.Erasure</a>
<a id="2776" class="Comment">--import Scoped.Erasure.RenamingSubstitution</a>
<a id="2821" class="Comment">--import Scoped.Erasure.Reduction</a>
<a id="2855" class="Keyword">import</a> <a id="2862" href="Scoped.CK.html" class="Module">Scoped.CK</a>
</pre>
## Untyped terms

Untyped terms, reduction and evaluation

<pre class="Agda"><a id="2940" class="Keyword">import</a> <a id="2947" href="Untyped.html" class="Module">Untyped</a>
<a id="2955" class="Keyword">import</a> <a id="2962" href="Untyped.RenamingSubstitution.html" class="Module">Untyped.RenamingSubstitution</a>
<a id="2991" class="Keyword">import</a> <a id="2998" href="Untyped.Reduction.html" class="Module">Untyped.Reduction</a>
</pre>
## Type checker

This takes a well-scoped term and produces an intrinsically typed term
as evidence of successful typechecking.

<pre class="Agda"><a id="3154" class="Keyword">import</a> <a id="3161" href="Check.html" class="Module">Check</a>
</pre>
## Executable

This module is is compiled to Haskell and then can be compiled by ghc
to produce an executable.

<pre class="Agda"><a id="3288" class="Keyword">import</a> <a id="3295" href="Main.html" class="Module">Main</a>
</pre>
