---
title: Types
layout: page
---

<pre class="Agda"><a id="40" class="Keyword">module</a> <a id="47" href="Type.html" class="Module">Type</a> <a id="52" class="Keyword">where</a>
</pre>
## Fixity declarations

To begin, we get all our infix declarations out of the way.

<pre class="Agda"><a id="152" class="Keyword">infix</a>  <a id="159" class="Number">4</a> <a id="161" href="Type.html#1323" class="Datatype Operator">_∋⋆_</a>
<a id="166" class="Keyword">infix</a>  <a id="173" class="Number">4</a> <a id="175" href="Type.html#2004" class="Datatype Operator">_⊢⋆_</a>
<a id="180" class="Keyword">infixl</a> <a id="187" class="Number">5</a> <a id="189" href="Type.html#981" class="InductiveConstructor Operator">_,⋆_</a>

<a id="195" class="Keyword">infix</a>  <a id="202" class="Number">6</a> <a id="204" href="Type.html#2080" class="InductiveConstructor">Π</a>
<a id="206" class="Keyword">infixr</a> <a id="213" class="Number">7</a> <a id="215" href="Type.html#626" class="InductiveConstructor Operator">_⇒_</a>
<a id="219" class="Keyword">infix</a>  <a id="226" class="Number">5</a> <a id="228" href="Type.html#2191" class="InductiveConstructor">ƛ</a>
<a id="230" class="Keyword">infixl</a> <a id="237" class="Number">7</a> <a id="239" href="Type.html#2246" class="InductiveConstructor Operator">_·_</a>
<a id="243" class="Keyword">infix</a>  <a id="250" class="Number">9</a> <a id="252" href="Type.html#1396" class="InductiveConstructor">S</a>
</pre>
## Imports

<pre class="Agda"><a id="275" class="Keyword">open</a> <a id="280" class="Keyword">import</a> <a id="287" href="Agda.Builtin.Nat.html" class="Module">Agda.Builtin.Nat</a>
<a id="304" class="Keyword">open</a> <a id="309" class="Keyword">import</a> <a id="316" href="Builtin.Constant.Type.html" class="Module">Builtin.Constant.Type</a>
</pre>
## Kinds

The kind of types is `*`. Plutus core core is based on System Fω which
is higher order so we have `⇒` for type level functions. We also have
a kind called `#` which is used for sized integers and bytestrings.

<pre class="Agda"><a id="567" class="Keyword">data</a> <a id="Kind"></a><a id="572" href="Type.html#572" class="Datatype">Kind</a> <a id="577" class="Symbol">:</a> <a id="579" class="PrimitiveType">Set</a> <a id="583" class="Keyword">where</a>
  <a id="Kind.*"></a><a id="591" href="Type.html#591" class="InductiveConstructor">*</a>   <a id="595" class="Symbol">:</a> <a id="597" href="Type.html#572" class="Datatype">Kind</a>               <a id="616" class="Comment">-- type</a>
  <a id="Kind._⇒_"></a><a id="626" href="Type.html#626" class="InductiveConstructor Operator">_⇒_</a> <a id="630" class="Symbol">:</a> <a id="632" href="Type.html#572" class="Datatype">Kind</a> <a id="637" class="Symbol">→</a> <a id="639" href="Type.html#572" class="Datatype">Kind</a> <a id="644" class="Symbol">→</a> <a id="646" href="Type.html#572" class="Datatype">Kind</a> <a id="651" class="Comment">-- function kind</a>

<a id="669" class="Symbol">{-#</a> <a id="673" class="Keyword">FOREIGN</a> <a id="681" class="Pragma">GHC</a> <a id="685" class="Pragma">import</a> <a id="692" class="Pragma">Scoped</a> <a id="699" class="Symbol">#-}</a>
<a id="703" class="Symbol">{-#</a> <a id="707" class="Keyword">COMPILE</a> <a id="715" class="Keyword">GHC</a> <a id="719" href="Type.html#572" class="Datatype">Kind</a> <a id="724" class="Pragma">=</a> <a id="726" class="Pragma">data</a> <a id="731" class="Pragma">ScKind</a> <a id="738" class="Pragma">(ScKiStar</a> <a id="748" class="Pragma">|</a> <a id="750" class="Pragma">ScKiFun)</a> <a id="759" class="Symbol">#-}</a>
</pre>
Let `J`, `K` range over kinds:
<pre class="Agda"><a id="803" class="Keyword">variable</a>
  <a id="814" href="Type.html#814" class="Generalizable">J</a> <a id="816" href="Type.html#816" class="Generalizable">K</a> <a id="818" class="Symbol">:</a> <a id="820" href="Type.html#572" class="Datatype">Kind</a>
</pre>
## Type contexts

A type context is either empty or extends a type
context by a type variable of a given kind.

<pre class="Agda"><a id="946" class="Keyword">data</a> <a id="Ctx⋆"></a><a id="951" href="Type.html#951" class="Datatype">Ctx⋆</a> <a id="956" class="Symbol">:</a> <a id="958" class="PrimitiveType">Set</a> <a id="962" class="Keyword">where</a>
  <a id="Ctx⋆.∅"></a><a id="970" href="Type.html#970" class="InductiveConstructor">∅</a> <a id="972" class="Symbol">:</a> <a id="974" href="Type.html#951" class="Datatype">Ctx⋆</a>
  <a id="Ctx⋆._,⋆_"></a><a id="981" href="Type.html#981" class="InductiveConstructor Operator">_,⋆_</a> <a id="986" class="Symbol">:</a> <a id="988" href="Type.html#951" class="Datatype">Ctx⋆</a> <a id="993" class="Symbol">→</a> <a id="995" href="Type.html#572" class="Datatype">Kind</a> <a id="1000" class="Symbol">→</a> <a id="1002" href="Type.html#951" class="Datatype">Ctx⋆</a>
</pre>
Let `Φ`, `Ψ`, `Θ` range over type contexts:
<pre class="Agda"><a id="1060" class="Keyword">variable</a>
  <a id="1071" href="Type.html#1071" class="Generalizable">Φ</a> <a id="1073" href="Type.html#1073" class="Generalizable">Ψ</a> <a id="1075" href="Type.html#1075" class="Generalizable">Θ</a> <a id="1077" class="Symbol">:</a> <a id="1079" href="Type.html#951" class="Datatype">Ctx⋆</a>
</pre>
## Type variables

Type variables are not named, they are numbered (de Bruijn indices).

A type variable is indexed by its context and kind. For a given
context, it's impossible to construct a variable that is out of
scope.

<pre class="Agda"><a id="1318" class="Keyword">data</a> <a id="_∋⋆_"></a><a id="1323" href="Type.html#1323" class="Datatype Operator">_∋⋆_</a> <a id="1328" class="Symbol">:</a> <a id="1330" href="Type.html#951" class="Datatype">Ctx⋆</a> <a id="1335" class="Symbol">→</a> <a id="1337" href="Type.html#572" class="Datatype">Kind</a> <a id="1342" class="Symbol">→</a> <a id="1344" class="PrimitiveType">Set</a> <a id="1348" class="Keyword">where</a>

  <a id="_∋⋆_.Z"></a><a id="1357" href="Type.html#1357" class="InductiveConstructor">Z</a> <a id="1359" class="Symbol">:</a> <a id="1361" class="Comment">-------------</a>
      <a id="1381" href="Type.html#1071" class="Generalizable">Φ</a> <a id="1383" href="Type.html#981" class="InductiveConstructor Operator">,⋆</a> <a id="1386" href="Type.html#814" class="Generalizable">J</a> <a id="1388" href="Type.html#1323" class="Datatype Operator">∋⋆</a> <a id="1391" href="Type.html#814" class="Generalizable">J</a>

  <a id="_∋⋆_.S"></a><a id="1396" href="Type.html#1396" class="InductiveConstructor">S</a> <a id="1398" class="Symbol">:</a> <a id="1400" href="Type.html#1071" class="Generalizable">Φ</a> <a id="1402" href="Type.html#1323" class="Datatype Operator">∋⋆</a> <a id="1405" href="Type.html#814" class="Generalizable">J</a>
      <a id="1413" class="Comment">-------------</a>
    <a id="1431" class="Symbol">→</a> <a id="1433" href="Type.html#1071" class="Generalizable">Φ</a> <a id="1435" href="Type.html#981" class="InductiveConstructor Operator">,⋆</a> <a id="1438" href="Type.html#816" class="Generalizable">K</a> <a id="1440" href="Type.html#1323" class="Datatype Operator">∋⋆</a> <a id="1443" href="Type.html#814" class="Generalizable">J</a>
</pre>
Let `α`, `β` range over type variables

## Types

A type is indexed by its context and kind. Types are intrinsically
scoped and kinded: it's impossible to construct an ill-kinded
application and it's impossible to refer to a variable that is not in
scope.

A type is either a type variable, a pi type, a function type, a
lambda, an application, an iso-recursive type `μ`, a size, or a type
constant (base type). Note that recursive types range over an
arbitrary kind `k` which goes beyond standard iso-recursive types.

<pre class="Agda"><a id="1974" class="Keyword">open</a> <a id="1979" class="Keyword">import</a> <a id="1986" href="Data.String.html" class="Module">Data.String</a>

<a id="1999" class="Keyword">data</a> <a id="_⊢⋆_"></a><a id="2004" href="Type.html#2004" class="Datatype Operator">_⊢⋆_</a> <a id="2009" class="Symbol">:</a> <a id="2011" href="Type.html#951" class="Datatype">Ctx⋆</a> <a id="2016" class="Symbol">→</a> <a id="2018" href="Type.html#572" class="Datatype">Kind</a> <a id="2023" class="Symbol">→</a> <a id="2025" class="PrimitiveType">Set</a> <a id="2029" class="Keyword">where</a>

  <a id="_⊢⋆_.`"></a><a id="2038" href="Type.html#2038" class="InductiveConstructor">`</a> <a id="2040" class="Symbol">:</a> <a id="2042" href="Type.html#1071" class="Generalizable">Φ</a> <a id="2044" href="Type.html#1323" class="Datatype Operator">∋⋆</a> <a id="2047" href="Type.html#814" class="Generalizable">J</a>
      <a id="2055" class="Comment">--------</a>
    <a id="2068" class="Symbol">→</a> <a id="2070" href="Type.html#1071" class="Generalizable">Φ</a> <a id="2072" href="Type.html#2004" class="Datatype Operator">⊢⋆</a> <a id="2075" href="Type.html#814" class="Generalizable">J</a>

  <a id="_⊢⋆_.Π"></a><a id="2080" href="Type.html#2080" class="InductiveConstructor">Π</a> <a id="2082" class="Symbol">:</a> <a id="2084" href="Type.html#1071" class="Generalizable">Φ</a> <a id="2086" href="Type.html#981" class="InductiveConstructor Operator">,⋆</a> <a id="2089" href="Type.html#816" class="Generalizable">K</a> <a id="2091" href="Type.html#2004" class="Datatype Operator">⊢⋆</a> <a id="2094" href="Type.html#591" class="InductiveConstructor">*</a>
      <a id="2102" class="Comment">-----------</a>
    <a id="2118" class="Symbol">→</a> <a id="2120" href="Type.html#1071" class="Generalizable">Φ</a> <a id="2122" href="Type.html#2004" class="Datatype Operator">⊢⋆</a> <a id="2125" href="Type.html#591" class="InductiveConstructor">*</a>

  <a id="_⊢⋆_._⇒_"></a><a id="2130" href="Type.html#2130" class="InductiveConstructor Operator">_⇒_</a> <a id="2134" class="Symbol">:</a> <a id="2136" href="Type.html#1071" class="Generalizable">Φ</a> <a id="2138" href="Type.html#2004" class="Datatype Operator">⊢⋆</a> <a id="2141" href="Type.html#591" class="InductiveConstructor">*</a>
      <a id="2149" class="Symbol">→</a> <a id="2151" href="Type.html#1071" class="Generalizable">Φ</a> <a id="2153" href="Type.html#2004" class="Datatype Operator">⊢⋆</a> <a id="2156" href="Type.html#591" class="InductiveConstructor">*</a>
        <a id="2166" class="Comment">------</a>
      <a id="2179" class="Symbol">→</a> <a id="2181" href="Type.html#1071" class="Generalizable">Φ</a> <a id="2183" href="Type.html#2004" class="Datatype Operator">⊢⋆</a> <a id="2186" href="Type.html#591" class="InductiveConstructor">*</a>

  <a id="_⊢⋆_.ƛ"></a><a id="2191" href="Type.html#2191" class="InductiveConstructor">ƛ</a> <a id="2193" class="Symbol">:</a> <a id="2195" href="Type.html#1071" class="Generalizable">Φ</a> <a id="2197" href="Type.html#981" class="InductiveConstructor Operator">,⋆</a> <a id="2200" href="Type.html#816" class="Generalizable">K</a> <a id="2202" href="Type.html#2004" class="Datatype Operator">⊢⋆</a> <a id="2205" href="Type.html#814" class="Generalizable">J</a> 
      <a id="2214" class="Comment">-----------</a>
    <a id="2230" class="Symbol">→</a> <a id="2232" href="Type.html#1071" class="Generalizable">Φ</a> <a id="2234" href="Type.html#2004" class="Datatype Operator">⊢⋆</a> <a id="2237" href="Type.html#816" class="Generalizable">K</a> <a id="2239" href="Type.html#626" class="InductiveConstructor Operator">⇒</a> <a id="2241" href="Type.html#814" class="Generalizable">J</a>

  <a id="_⊢⋆_._·_"></a><a id="2246" href="Type.html#2246" class="InductiveConstructor Operator">_·_</a> <a id="2250" class="Symbol">:</a> <a id="2252" href="Type.html#1071" class="Generalizable">Φ</a> <a id="2254" href="Type.html#2004" class="Datatype Operator">⊢⋆</a> <a id="2257" href="Type.html#816" class="Generalizable">K</a> <a id="2259" href="Type.html#626" class="InductiveConstructor Operator">⇒</a> <a id="2261" href="Type.html#814" class="Generalizable">J</a>
      <a id="2269" class="Symbol">→</a> <a id="2271" href="Type.html#1071" class="Generalizable">Φ</a> <a id="2273" href="Type.html#2004" class="Datatype Operator">⊢⋆</a> <a id="2276" href="Type.html#816" class="Generalizable">K</a>
        <a id="2286" class="Comment">------</a>
      <a id="2299" class="Symbol">→</a> <a id="2301" href="Type.html#1071" class="Generalizable">Φ</a> <a id="2303" href="Type.html#2004" class="Datatype Operator">⊢⋆</a> <a id="2306" href="Type.html#814" class="Generalizable">J</a>

  <a id="_⊢⋆_.μ"></a><a id="2311" href="Type.html#2311" class="InductiveConstructor">μ</a> <a id="2313" class="Symbol">:</a> <a id="2315" href="Type.html#1071" class="Generalizable">Φ</a> <a id="2317" href="Type.html#2004" class="Datatype Operator">⊢⋆</a> <a id="2320" class="Symbol">(</a><a id="2321" href="Type.html#816" class="Generalizable">K</a> <a id="2323" href="Type.html#626" class="InductiveConstructor Operator">⇒</a> <a id="2325" href="Type.html#591" class="InductiveConstructor">*</a><a id="2326" class="Symbol">)</a> <a id="2328" href="Type.html#626" class="InductiveConstructor Operator">⇒</a> <a id="2330" href="Type.html#816" class="Generalizable">K</a> <a id="2332" href="Type.html#626" class="InductiveConstructor Operator">⇒</a> <a id="2334" href="Type.html#591" class="InductiveConstructor">*</a>
    <a id="2340" class="Symbol">→</a> <a id="2342" href="Type.html#1071" class="Generalizable">Φ</a> <a id="2344" href="Type.html#2004" class="Datatype Operator">⊢⋆</a> <a id="2347" href="Type.html#816" class="Generalizable">K</a>
      <a id="2355" class="Comment">---------------------</a>
    <a id="2381" class="Symbol">→</a> <a id="2383" href="Type.html#1071" class="Generalizable">Φ</a> <a id="2385" href="Type.html#2004" class="Datatype Operator">⊢⋆</a> <a id="2388" href="Type.html#591" class="InductiveConstructor">*</a>

  <a id="_⊢⋆_.con"></a><a id="2393" href="Type.html#2393" class="InductiveConstructor">con</a> <a id="2397" class="Symbol">:</a> <a id="2399" href="Builtin.Constant.Type.html#2898" class="Datatype">TyCon</a>
        <a id="2413" class="Comment">------</a>
      <a id="2426" class="Symbol">→</a> <a id="2428" href="Type.html#1071" class="Generalizable">Φ</a> <a id="2430" href="Type.html#2004" class="Datatype Operator">⊢⋆</a> <a id="2433" href="Type.html#591" class="InductiveConstructor">*</a>
</pre>
Let `A`, `B`, `C` range over types:
<pre class="Agda"><a id="2480" class="Keyword">variable</a>
  <a id="2491" href="Type.html#2491" class="Generalizable">A</a> <a id="2493" href="Type.html#2493" class="Generalizable">A&#39;</a> <a id="2496" href="Type.html#2496" class="Generalizable">B</a> <a id="2498" href="Type.html#2498" class="Generalizable">B&#39;</a> <a id="2501" href="Type.html#2501" class="Generalizable">C</a> <a id="2503" href="Type.html#2503" class="Generalizable">C&#39;</a>  <a id="2507" class="Symbol">:</a> <a id="2509" href="Type.html#1071" class="Generalizable">Φ</a> <a id="2511" href="Type.html#2004" class="Datatype Operator">⊢⋆</a> <a id="2514" href="Type.html#814" class="Generalizable">J</a>
</pre>