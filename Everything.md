# Everything file

<pre class="Agda"><a id="24" class="Keyword">module</a> <a id="31" href="Everything.html" class="Module">Everything</a> <a id="42" class="Keyword">where</a>

<a id="49" class="Comment">-- Types</a>

<a id="59" class="Keyword">import</a> <a id="66" href="Type.html" class="Module">Type</a>
<a id="71" class="Keyword">import</a> <a id="78" href="Type.RenamingSubstitution.html" class="Module">Type.RenamingSubstitution</a>
<a id="104" class="Keyword">import</a> <a id="111" href="Type.Reduction.html" class="Module">Type.Reduction</a>
<a id="126" class="Keyword">import</a> <a id="133" href="Type.Equality.html" class="Module">Type.Equality</a>

<a id="148" class="Comment">-- a beta NBE algorithm and accompanying soundness, completeness and</a>
<a id="217" class="Comment">-- stability proofs and necessary equipment for substituting into</a>
<a id="283" class="Comment">-- normal types by embedding back into syntax, substituting and</a>
<a id="347" class="Comment">-- renormalising</a>


<a id="366" class="Keyword">import</a> <a id="373" href="Type.BetaNormal.html" class="Module">Type.BetaNormal</a>
<a id="389" class="Keyword">import</a> <a id="396" href="Type.BetaNBE.html" class="Module">Type.BetaNBE</a>
<a id="409" class="Keyword">import</a> <a id="416" href="Type.BetaNBE.Soundness.html" class="Module">Type.BetaNBE.Soundness</a>
<a id="439" class="Keyword">import</a> <a id="446" href="Type.BetaNBE.Completeness.html" class="Module">Type.BetaNBE.Completeness</a>
<a id="472" class="Keyword">import</a> <a id="479" href="Type.BetaNBE.Stability.html" class="Module">Type.BetaNBE.Stability</a>
<a id="502" class="Keyword">import</a> <a id="509" href="Type.BetaNBE.RenamingSubstitution.html" class="Module">Type.BetaNBE.RenamingSubstitution</a>
<a id="543" class="Comment">-- a complete attempt to index terms by syntactic types where</a>
<a id="605" class="Comment">-- conversion takes an equation as an argument. Evaluation only works</a>
<a id="675" class="Comment">-- in the absense of conversions in terms.</a>

<a id="719" class="Comment">-- Builtins</a>
<a id="731" class="Keyword">import</a> <a id="738" href="Builtin.Signature.html" class="Module">Builtin.Signature</a>
<a id="756" class="Keyword">import</a> <a id="763" href="Builtin.Constant.Type.html" class="Module">Builtin.Constant.Type</a>
<a id="785" class="Keyword">import</a> <a id="792" href="Builtin.Constant.Term.html" class="Module">Builtin.Constant.Term</a>

<a id="815" class="Keyword">import</a> <a id="822" href="Declarative.html" class="Module">Declarative</a>
<a id="834" class="Keyword">import</a> <a id="841" href="Declarative.RenamingSubstitution.html" class="Module">Declarative.RenamingSubstitution</a>
<a id="874" class="Keyword">import</a> <a id="881" href="Declarative.Erasure.html" class="Module">Declarative.Erasure</a>

<a id="902" class="Keyword">import</a> <a id="909" href="Declarative.Examples.html" class="Module">Declarative.Examples</a>
<a id="930" class="Keyword">import</a> <a id="937" href="Declarative.Examples.StdLib.Function.html" class="Module">Declarative.Examples.StdLib.Function</a>
<a id="974" class="Keyword">import</a> <a id="981" href="Declarative.Examples.StdLib.ChurchNat.html" class="Module">Declarative.Examples.StdLib.ChurchNat</a>
<a id="1019" class="Keyword">import</a> <a id="1026" href="Declarative.Examples.StdLib.Nat.html" class="Module">Declarative.Examples.StdLib.Nat</a>

<a id="1059" class="Comment">-- Terms, reduction and evaluation where terms are indexed by normal</a>
<a id="1128" class="Comment">-- types</a>

<a id="1138" class="Keyword">import</a> <a id="1145" href="Algorithmic.html" class="Module">Algorithmic</a>
<a id="1157" class="Keyword">import</a> <a id="1164" href="Algorithmic.RenamingSubstitution.html" class="Module">Algorithmic.RenamingSubstitution</a>
<a id="1197" class="Keyword">import</a> <a id="1204" href="Algorithmic.Reduction.html" class="Module">Algorithmic.Reduction</a>
<a id="1226" class="Keyword">import</a> <a id="1233" href="Algorithmic.Evaluation.html" class="Module">Algorithmic.Evaluation</a>
<a id="1256" class="Keyword">import</a> <a id="1263" href="Algorithmic.Main.html" class="Module">Algorithmic.Main</a>
<a id="1280" class="Keyword">import</a> <a id="1287" href="Algorithmic.Completeness.html" class="Module">Algorithmic.Completeness</a>
<a id="1312" class="Keyword">import</a> <a id="1319" href="Algorithmic.Soundness.html" class="Module">Algorithmic.Soundness</a>
<a id="1341" class="Keyword">import</a> <a id="1348" href="Algorithmic.Erasure.html" class="Module">Algorithmic.Erasure</a>
<a id="1368" class="Keyword">import</a> <a id="1375" href="Algorithmic.Erasure.RenamingSubstitution.html" class="Module">Algorithmic.Erasure.RenamingSubstitution</a>
<a id="1416" class="Comment">--import Algorithmic.Erasure.Reduction</a>
<a id="1455" class="Keyword">import</a> <a id="1462" href="Algorithmic.CK.html" class="Module">Algorithmic.CK</a>
<a id="1477" class="Keyword">import</a> <a id="1484" href="Algorithmic.CEKV.html" class="Module">Algorithmic.CEKV</a>

<a id="1502" class="Keyword">import</a> <a id="1509" href="Algorithmic.Examples.html" class="Module">Algorithmic.Examples</a>

<a id="1531" class="Comment">-- Untyped terms, reduction and evaluation</a>

<a id="1575" class="Keyword">import</a> <a id="1582" href="Untyped.html" class="Module">Untyped</a>
<a id="1590" class="Keyword">import</a> <a id="1597" href="Untyped.RenamingSubstitution.html" class="Module">Untyped.RenamingSubstitution</a>
<a id="1626" class="Keyword">import</a> <a id="1633" href="Untyped.Reduction.html" class="Module">Untyped.Reduction</a>

<a id="1652" class="Comment">-- Extrinsically typed terms, reduction and evaluation</a>
<a id="1707" class="Keyword">import</a> <a id="1714" href="Scoped.html" class="Module">Scoped</a>
<a id="1721" class="Keyword">import</a> <a id="1728" href="Scoped.RenamingSubstitution.html" class="Module">Scoped.RenamingSubstitution</a>

<a id="1757" class="Keyword">import</a> <a id="1764" href="Scoped.Reduction.html" class="Module">Scoped.Reduction</a>

<a id="1782" class="Keyword">import</a> <a id="1789" href="Scoped.Extrication.html" class="Module">Scoped.Extrication</a>
<a id="1808" class="Keyword">import</a> <a id="1815" href="Scoped.Extrication.RenamingSubstitution.html" class="Module">Scoped.Extrication.RenamingSubstitution</a>
<a id="1855" class="Comment">--import Scoped.Extrication.Reduction</a>
<a id="1893" class="Keyword">import</a> <a id="1900" href="Scoped.Erasure.html" class="Module">Scoped.Erasure</a>
<a id="1915" class="Comment">--import Scoped.Erasure.RenamingSubstitution</a>
<a id="1960" class="Comment">--import Scoped.Erasure.Reduction</a>

<a id="1995" class="Keyword">import</a> <a id="2002" href="Scoped.CK.html" class="Module">Scoped.CK</a>

<a id="2013" class="Keyword">import</a> <a id="2020" href="Check.html" class="Module">Check</a>
<a id="2026" class="Keyword">import</a> <a id="2033" href="Main.html" class="Module">Main</a>
</pre>