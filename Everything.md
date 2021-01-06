---
layout: page
title: Everything file
---

<pre class="Agda"><a id="50" class="Keyword">module</a> <a id="57" href="Everything.html" class="Module">Everything</a> <a id="68" class="Keyword">where</a>

<a id="75" class="Comment">-- Types</a>

<a id="85" class="Keyword">import</a> <a id="92" href="Type.html" class="Module">Type</a>
<a id="97" class="Keyword">import</a> <a id="104" href="Type.RenamingSubstitution.html" class="Module">Type.RenamingSubstitution</a>
<a id="130" class="Keyword">import</a> <a id="137" href="Type.Reduction.html" class="Module">Type.Reduction</a>
<a id="152" class="Keyword">import</a> <a id="159" href="Type.Equality.html" class="Module">Type.Equality</a>

<a id="174" class="Comment">-- a beta NBE algorithm and accompanying soundness, completeness and</a>
<a id="243" class="Comment">-- stability proofs and necessary equipment for substituting into</a>
<a id="309" class="Comment">-- normal types by embedding back into syntax, substituting and</a>
<a id="373" class="Comment">-- renormalising</a>


<a id="392" class="Keyword">import</a> <a id="399" href="Type.BetaNormal.html" class="Module">Type.BetaNormal</a>
<a id="415" class="Keyword">import</a> <a id="422" href="Type.BetaNBE.html" class="Module">Type.BetaNBE</a>
<a id="435" class="Keyword">import</a> <a id="442" href="Type.BetaNBE.Soundness.html" class="Module">Type.BetaNBE.Soundness</a>
<a id="465" class="Keyword">import</a> <a id="472" href="Type.BetaNBE.Completeness.html" class="Module">Type.BetaNBE.Completeness</a>
<a id="498" class="Keyword">import</a> <a id="505" href="Type.BetaNBE.Stability.html" class="Module">Type.BetaNBE.Stability</a>
<a id="528" class="Keyword">import</a> <a id="535" href="Type.BetaNBE.RenamingSubstitution.html" class="Module">Type.BetaNBE.RenamingSubstitution</a>
<a id="569" class="Comment">-- a complete attempt to index terms by syntactic types where</a>
<a id="631" class="Comment">-- conversion takes an equation as an argument. Evaluation only works</a>
<a id="701" class="Comment">-- in the absense of conversions in terms.</a>

<a id="745" class="Comment">-- Builtins</a>
<a id="757" class="Keyword">import</a> <a id="764" href="Builtin.Signature.html" class="Module">Builtin.Signature</a>
<a id="782" class="Keyword">import</a> <a id="789" href="Builtin.Constant.Type.html" class="Module">Builtin.Constant.Type</a>
<a id="811" class="Keyword">import</a> <a id="818" href="Builtin.Constant.Term.html" class="Module">Builtin.Constant.Term</a>

<a id="841" class="Keyword">import</a> <a id="848" href="Declarative.html" class="Module">Declarative</a>
<a id="860" class="Keyword">import</a> <a id="867" href="Declarative.RenamingSubstitution.html" class="Module">Declarative.RenamingSubstitution</a>
<a id="900" class="Keyword">import</a> <a id="907" href="Declarative.Erasure.html" class="Module">Declarative.Erasure</a>

<a id="928" class="Keyword">import</a> <a id="935" href="Declarative.Examples.html" class="Module">Declarative.Examples</a>
<a id="956" class="Keyword">import</a> <a id="963" href="Declarative.Examples.StdLib.Function.html" class="Module">Declarative.Examples.StdLib.Function</a>
<a id="1000" class="Keyword">import</a> <a id="1007" href="Declarative.Examples.StdLib.ChurchNat.html" class="Module">Declarative.Examples.StdLib.ChurchNat</a>
<a id="1045" class="Keyword">import</a> <a id="1052" href="Declarative.Examples.StdLib.Nat.html" class="Module">Declarative.Examples.StdLib.Nat</a>

<a id="1085" class="Comment">-- Terms, reduction and evaluation where terms are indexed by normal</a>
<a id="1154" class="Comment">-- types</a>

<a id="1164" class="Keyword">import</a> <a id="1171" href="Algorithmic.html" class="Module">Algorithmic</a>
<a id="1183" class="Keyword">import</a> <a id="1190" href="Algorithmic.RenamingSubstitution.html" class="Module">Algorithmic.RenamingSubstitution</a>
<a id="1223" class="Keyword">import</a> <a id="1230" href="Algorithmic.Reduction.html" class="Module">Algorithmic.Reduction</a>
<a id="1252" class="Keyword">import</a> <a id="1259" href="Algorithmic.Evaluation.html" class="Module">Algorithmic.Evaluation</a>
<a id="1282" class="Keyword">import</a> <a id="1289" href="Algorithmic.Main.html" class="Module">Algorithmic.Main</a>
<a id="1306" class="Keyword">import</a> <a id="1313" href="Algorithmic.Completeness.html" class="Module">Algorithmic.Completeness</a>
<a id="1338" class="Keyword">import</a> <a id="1345" href="Algorithmic.Soundness.html" class="Module">Algorithmic.Soundness</a>
<a id="1367" class="Keyword">import</a> <a id="1374" href="Algorithmic.Erasure.html" class="Module">Algorithmic.Erasure</a>
<a id="1394" class="Keyword">import</a> <a id="1401" href="Algorithmic.Erasure.RenamingSubstitution.html" class="Module">Algorithmic.Erasure.RenamingSubstitution</a>
<a id="1442" class="Comment">--import Algorithmic.Erasure.Reduction</a>
<a id="1481" class="Keyword">import</a> <a id="1488" href="Algorithmic.CK.html" class="Module">Algorithmic.CK</a>
<a id="1503" class="Keyword">import</a> <a id="1510" href="Algorithmic.CEKV.html" class="Module">Algorithmic.CEKV</a>

<a id="1528" class="Keyword">import</a> <a id="1535" href="Algorithmic.Examples.html" class="Module">Algorithmic.Examples</a>

<a id="1557" class="Comment">-- Untyped terms, reduction and evaluation</a>

<a id="1601" class="Keyword">import</a> <a id="1608" href="Untyped.html" class="Module">Untyped</a>
<a id="1616" class="Keyword">import</a> <a id="1623" href="Untyped.RenamingSubstitution.html" class="Module">Untyped.RenamingSubstitution</a>
<a id="1652" class="Keyword">import</a> <a id="1659" href="Untyped.Reduction.html" class="Module">Untyped.Reduction</a>

<a id="1678" class="Comment">-- Extrinsically typed terms, reduction and evaluation</a>
<a id="1733" class="Keyword">import</a> <a id="1740" href="Scoped.html" class="Module">Scoped</a>
<a id="1747" class="Keyword">import</a> <a id="1754" href="Scoped.RenamingSubstitution.html" class="Module">Scoped.RenamingSubstitution</a>

<a id="1783" class="Keyword">import</a> <a id="1790" href="Scoped.Reduction.html" class="Module">Scoped.Reduction</a>

<a id="1808" class="Keyword">import</a> <a id="1815" href="Scoped.Extrication.html" class="Module">Scoped.Extrication</a>
<a id="1834" class="Keyword">import</a> <a id="1841" href="Scoped.Extrication.RenamingSubstitution.html" class="Module">Scoped.Extrication.RenamingSubstitution</a>
<a id="1881" class="Comment">--import Scoped.Extrication.Reduction</a>
<a id="1919" class="Keyword">import</a> <a id="1926" href="Scoped.Erasure.html" class="Module">Scoped.Erasure</a>
<a id="1941" class="Comment">--import Scoped.Erasure.RenamingSubstitution</a>
<a id="1986" class="Comment">--import Scoped.Erasure.Reduction</a>

<a id="2021" class="Keyword">import</a> <a id="2028" href="Scoped.CK.html" class="Module">Scoped.CK</a>

<a id="2039" class="Keyword">import</a> <a id="2046" href="Check.html" class="Module">Check</a>
<a id="2052" class="Keyword">import</a> <a id="2059" href="Main.html" class="Module">Main</a>
</pre>
