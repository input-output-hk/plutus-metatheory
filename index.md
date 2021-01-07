---
layout: page
title: Table of Contents
---


<pre class="Agda"><a id="53" class="Comment">-- Types</a>

<a id="63" class="Keyword">import</a> <a id="70" href="Type.html" class="Module">Type</a>
<a id="75" class="Keyword">import</a> <a id="82" href="Type.RenamingSubstitution.html" class="Module">Type.RenamingSubstitution</a>
<a id="108" class="Keyword">import</a> <a id="115" href="Type.Reduction.html" class="Module">Type.Reduction</a>
<a id="130" class="Keyword">import</a> <a id="137" href="Type.Equality.html" class="Module">Type.Equality</a>

<a id="152" class="Comment">-- a beta NBE algorithm and accompanying soundness, completeness and</a>
<a id="221" class="Comment">-- stability proofs and necessary equipment for substituting into</a>
<a id="287" class="Comment">-- normal types by embedding back into syntax, substituting and</a>
<a id="351" class="Comment">-- renormalising</a>


<a id="370" class="Keyword">import</a> <a id="377" href="Type.BetaNormal.html" class="Module">Type.BetaNormal</a>
<a id="393" class="Keyword">import</a> <a id="400" href="Type.BetaNBE.html" class="Module">Type.BetaNBE</a>
<a id="413" class="Keyword">import</a> <a id="420" href="Type.BetaNBE.Soundness.html" class="Module">Type.BetaNBE.Soundness</a>
<a id="443" class="Keyword">import</a> <a id="450" href="Type.BetaNBE.Completeness.html" class="Module">Type.BetaNBE.Completeness</a>
<a id="476" class="Keyword">import</a> <a id="483" href="Type.BetaNBE.Stability.html" class="Module">Type.BetaNBE.Stability</a>
<a id="506" class="Keyword">import</a> <a id="513" href="Type.BetaNBE.RenamingSubstitution.html" class="Module">Type.BetaNBE.RenamingSubstitution</a>
<a id="547" class="Comment">-- a complete attempt to index terms by syntactic types where</a>
<a id="609" class="Comment">-- conversion takes an equation as an argument. Evaluation only works</a>
<a id="679" class="Comment">-- in the absense of conversions in terms.</a>

<a id="723" class="Comment">-- Builtins</a>
<a id="735" class="Keyword">import</a> <a id="742" href="Builtin.Signature.html" class="Module">Builtin.Signature</a>
<a id="760" class="Keyword">import</a> <a id="767" href="Builtin.Constant.Type.html" class="Module">Builtin.Constant.Type</a>
<a id="789" class="Keyword">import</a> <a id="796" href="Builtin.Constant.Term.html" class="Module">Builtin.Constant.Term</a>

<a id="819" class="Keyword">import</a> <a id="826" href="Declarative.html" class="Module">Declarative</a>
<a id="838" class="Keyword">import</a> <a id="845" href="Declarative.RenamingSubstitution.html" class="Module">Declarative.RenamingSubstitution</a>
<a id="878" class="Keyword">import</a> <a id="885" href="Declarative.Erasure.html" class="Module">Declarative.Erasure</a>

<a id="906" class="Keyword">import</a> <a id="913" href="Declarative.Examples.html" class="Module">Declarative.Examples</a>
<a id="934" class="Keyword">import</a> <a id="941" href="Declarative.Examples.StdLib.Function.html" class="Module">Declarative.Examples.StdLib.Function</a>
<a id="978" class="Keyword">import</a> <a id="985" href="Declarative.Examples.StdLib.ChurchNat.html" class="Module">Declarative.Examples.StdLib.ChurchNat</a>
<a id="1023" class="Keyword">import</a> <a id="1030" href="Declarative.Examples.StdLib.Nat.html" class="Module">Declarative.Examples.StdLib.Nat</a>

<a id="1063" class="Comment">-- Terms, reduction and evaluation where terms are indexed by normal</a>
<a id="1132" class="Comment">-- types</a>

<a id="1142" class="Keyword">import</a> <a id="1149" href="Algorithmic.html" class="Module">Algorithmic</a>
<a id="1161" class="Keyword">import</a> <a id="1168" href="Algorithmic.RenamingSubstitution.html" class="Module">Algorithmic.RenamingSubstitution</a>
<a id="1201" class="Keyword">import</a> <a id="1208" href="Algorithmic.Reduction.html" class="Module">Algorithmic.Reduction</a>
<a id="1230" class="Keyword">import</a> <a id="1237" href="Algorithmic.Evaluation.html" class="Module">Algorithmic.Evaluation</a>
<a id="1260" class="Keyword">import</a> <a id="1267" href="Algorithmic.Main.html" class="Module">Algorithmic.Main</a>
<a id="1284" class="Keyword">import</a> <a id="1291" href="Algorithmic.Completeness.html" class="Module">Algorithmic.Completeness</a>
<a id="1316" class="Keyword">import</a> <a id="1323" href="Algorithmic.Soundness.html" class="Module">Algorithmic.Soundness</a>
<a id="1345" class="Keyword">import</a> <a id="1352" href="Algorithmic.Erasure.html" class="Module">Algorithmic.Erasure</a>
<a id="1372" class="Keyword">import</a> <a id="1379" href="Algorithmic.Erasure.RenamingSubstitution.html" class="Module">Algorithmic.Erasure.RenamingSubstitution</a>
<a id="1420" class="Comment">--import Algorithmic.Erasure.Reduction</a>
<a id="1459" class="Keyword">import</a> <a id="1466" href="Algorithmic.CK.html" class="Module">Algorithmic.CK</a>
<a id="1481" class="Keyword">import</a> <a id="1488" href="Algorithmic.CEKV.html" class="Module">Algorithmic.CEKV</a>

<a id="1506" class="Keyword">import</a> <a id="1513" href="Algorithmic.Examples.html" class="Module">Algorithmic.Examples</a>

<a id="1535" class="Comment">-- Untyped terms, reduction and evaluation</a>

<a id="1579" class="Keyword">import</a> <a id="1586" href="Untyped.html" class="Module">Untyped</a>
<a id="1594" class="Keyword">import</a> <a id="1601" href="Untyped.RenamingSubstitution.html" class="Module">Untyped.RenamingSubstitution</a>
<a id="1630" class="Keyword">import</a> <a id="1637" href="Untyped.Reduction.html" class="Module">Untyped.Reduction</a>

<a id="1656" class="Comment">-- Extrinsically typed terms, reduction and evaluation</a>
<a id="1711" class="Keyword">import</a> <a id="1718" href="Scoped.html" class="Module">Scoped</a>
<a id="1725" class="Keyword">import</a> <a id="1732" href="Scoped.RenamingSubstitution.html" class="Module">Scoped.RenamingSubstitution</a>

<a id="1761" class="Keyword">import</a> <a id="1768" href="Scoped.Reduction.html" class="Module">Scoped.Reduction</a>

<a id="1786" class="Keyword">import</a> <a id="1793" href="Scoped.Extrication.html" class="Module">Scoped.Extrication</a>
<a id="1812" class="Keyword">import</a> <a id="1819" href="Scoped.Extrication.RenamingSubstitution.html" class="Module">Scoped.Extrication.RenamingSubstitution</a>
<a id="1859" class="Comment">--import Scoped.Extrication.Reduction</a>
<a id="1897" class="Keyword">import</a> <a id="1904" href="Scoped.Erasure.html" class="Module">Scoped.Erasure</a>
<a id="1919" class="Comment">--import Scoped.Erasure.RenamingSubstitution</a>
<a id="1964" class="Comment">--import Scoped.Erasure.Reduction</a>

<a id="1999" class="Keyword">import</a> <a id="2006" href="Scoped.CK.html" class="Module">Scoped.CK</a>

<a id="2017" class="Keyword">import</a> <a id="2024" href="Check.html" class="Module">Check</a>
<a id="2030" class="Keyword">import</a> <a id="2037" href="Main.html" class="Module">Main</a>
</pre>
