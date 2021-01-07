# Table of Contents

<pre class="Agda"><a id="26" class="Comment">-- Types</a>

<a id="36" class="Keyword">import</a> <a id="43" href="Type.html" class="Module">Type</a>
<a id="48" class="Keyword">import</a> <a id="55" href="Type.RenamingSubstitution.html" class="Module">Type.RenamingSubstitution</a>
<a id="81" class="Keyword">import</a> <a id="88" href="Type.Reduction.html" class="Module">Type.Reduction</a>
<a id="103" class="Keyword">import</a> <a id="110" href="Type.Equality.html" class="Module">Type.Equality</a>

<a id="125" class="Comment">-- a beta NBE algorithm and accompanying soundness, completeness and</a>
<a id="194" class="Comment">-- stability proofs and necessary equipment for substituting into</a>
<a id="260" class="Comment">-- normal types by embedding back into syntax, substituting and</a>
<a id="324" class="Comment">-- renormalising</a>


<a id="343" class="Keyword">import</a> <a id="350" href="Type.BetaNormal.html" class="Module">Type.BetaNormal</a>
<a id="366" class="Keyword">import</a> <a id="373" href="Type.BetaNBE.html" class="Module">Type.BetaNBE</a>
<a id="386" class="Keyword">import</a> <a id="393" href="Type.BetaNBE.Soundness.html" class="Module">Type.BetaNBE.Soundness</a>
<a id="416" class="Keyword">import</a> <a id="423" href="Type.BetaNBE.Completeness.html" class="Module">Type.BetaNBE.Completeness</a>
<a id="449" class="Keyword">import</a> <a id="456" href="Type.BetaNBE.Stability.html" class="Module">Type.BetaNBE.Stability</a>
<a id="479" class="Keyword">import</a> <a id="486" href="Type.BetaNBE.RenamingSubstitution.html" class="Module">Type.BetaNBE.RenamingSubstitution</a>
<a id="520" class="Comment">-- a complete attempt to index terms by syntactic types where</a>
<a id="582" class="Comment">-- conversion takes an equation as an argument. Evaluation only works</a>
<a id="652" class="Comment">-- in the absense of conversions in terms.</a>

<a id="696" class="Comment">-- Builtins</a>
<a id="708" class="Keyword">import</a> <a id="715" href="Builtin.Signature.html" class="Module">Builtin.Signature</a>
<a id="733" class="Keyword">import</a> <a id="740" href="Builtin.Constant.Type.html" class="Module">Builtin.Constant.Type</a>
<a id="762" class="Keyword">import</a> <a id="769" href="Builtin.Constant.Term.html" class="Module">Builtin.Constant.Term</a>

<a id="792" class="Keyword">import</a> <a id="799" href="Declarative.html" class="Module">Declarative</a>
<a id="811" class="Keyword">import</a> <a id="818" href="Declarative.RenamingSubstitution.html" class="Module">Declarative.RenamingSubstitution</a>
<a id="851" class="Keyword">import</a> <a id="858" href="Declarative.Erasure.html" class="Module">Declarative.Erasure</a>

<a id="879" class="Keyword">import</a> <a id="886" href="Declarative.Examples.html" class="Module">Declarative.Examples</a>
<a id="907" class="Keyword">import</a> <a id="914" href="Declarative.Examples.StdLib.Function.html" class="Module">Declarative.Examples.StdLib.Function</a>
<a id="951" class="Keyword">import</a> <a id="958" href="Declarative.Examples.StdLib.ChurchNat.html" class="Module">Declarative.Examples.StdLib.ChurchNat</a>
<a id="996" class="Keyword">import</a> <a id="1003" href="Declarative.Examples.StdLib.Nat.html" class="Module">Declarative.Examples.StdLib.Nat</a>

<a id="1036" class="Comment">-- Terms, reduction and evaluation where terms are indexed by normal</a>
<a id="1105" class="Comment">-- types</a>

<a id="1115" class="Keyword">import</a> <a id="1122" href="Algorithmic.html" class="Module">Algorithmic</a>
<a id="1134" class="Keyword">import</a> <a id="1141" href="Algorithmic.RenamingSubstitution.html" class="Module">Algorithmic.RenamingSubstitution</a>
<a id="1174" class="Keyword">import</a> <a id="1181" href="Algorithmic.Reduction.html" class="Module">Algorithmic.Reduction</a>
<a id="1203" class="Keyword">import</a> <a id="1210" href="Algorithmic.Evaluation.html" class="Module">Algorithmic.Evaluation</a>
<a id="1233" class="Keyword">import</a> <a id="1240" href="Algorithmic.Main.html" class="Module">Algorithmic.Main</a>
<a id="1257" class="Keyword">import</a> <a id="1264" href="Algorithmic.Completeness.html" class="Module">Algorithmic.Completeness</a>
<a id="1289" class="Keyword">import</a> <a id="1296" href="Algorithmic.Soundness.html" class="Module">Algorithmic.Soundness</a>
<a id="1318" class="Keyword">import</a> <a id="1325" href="Algorithmic.Erasure.html" class="Module">Algorithmic.Erasure</a>
<a id="1345" class="Keyword">import</a> <a id="1352" href="Algorithmic.Erasure.RenamingSubstitution.html" class="Module">Algorithmic.Erasure.RenamingSubstitution</a>
<a id="1393" class="Comment">--import Algorithmic.Erasure.Reduction</a>
<a id="1432" class="Keyword">import</a> <a id="1439" href="Algorithmic.CK.html" class="Module">Algorithmic.CK</a>
<a id="1454" class="Keyword">import</a> <a id="1461" href="Algorithmic.CEKV.html" class="Module">Algorithmic.CEKV</a>

<a id="1479" class="Keyword">import</a> <a id="1486" href="Algorithmic.Examples.html" class="Module">Algorithmic.Examples</a>

<a id="1508" class="Comment">-- Untyped terms, reduction and evaluation</a>

<a id="1552" class="Keyword">import</a> <a id="1559" href="Untyped.html" class="Module">Untyped</a>
<a id="1567" class="Keyword">import</a> <a id="1574" href="Untyped.RenamingSubstitution.html" class="Module">Untyped.RenamingSubstitution</a>
<a id="1603" class="Keyword">import</a> <a id="1610" href="Untyped.Reduction.html" class="Module">Untyped.Reduction</a>

<a id="1629" class="Comment">-- Extrinsically typed terms, reduction and evaluation</a>
<a id="1684" class="Keyword">import</a> <a id="1691" href="Scoped.html" class="Module">Scoped</a>
<a id="1698" class="Keyword">import</a> <a id="1705" href="Scoped.RenamingSubstitution.html" class="Module">Scoped.RenamingSubstitution</a>

<a id="1734" class="Keyword">import</a> <a id="1741" href="Scoped.Reduction.html" class="Module">Scoped.Reduction</a>

<a id="1759" class="Keyword">import</a> <a id="1766" href="Scoped.Extrication.html" class="Module">Scoped.Extrication</a>
<a id="1785" class="Keyword">import</a> <a id="1792" href="Scoped.Extrication.RenamingSubstitution.html" class="Module">Scoped.Extrication.RenamingSubstitution</a>
<a id="1832" class="Comment">--import Scoped.Extrication.Reduction</a>
<a id="1870" class="Keyword">import</a> <a id="1877" href="Scoped.Erasure.html" class="Module">Scoped.Erasure</a>
<a id="1892" class="Comment">--import Scoped.Erasure.RenamingSubstitution</a>
<a id="1937" class="Comment">--import Scoped.Erasure.Reduction</a>

<a id="1972" class="Keyword">import</a> <a id="1979" href="Scoped.CK.html" class="Module">Scoped.CK</a>

<a id="1990" class="Keyword">import</a> <a id="1997" href="Check.html" class="Module">Check</a>
<a id="2003" class="Keyword">import</a> <a id="2010" href="Main.html" class="Module">Main</a>
</pre>
