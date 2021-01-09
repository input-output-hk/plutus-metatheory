---
title: Types
layout: page
---

<pre class="Agda"><a id="40" class="Keyword">module</a> <a id="47" href="Type.html" class="Module">Type</a> <a id="52" class="Keyword">where</a>
</pre>
## Fixity declarations

To begin, we get all our infix declarations out of the way.

<pre class="Agda"><a id="152" class="Keyword">infix</a>  <a id="159" class="Number">4</a> <a id="161" href="Type.html#1330" class="Datatype Operator">_∋⋆_</a>
<a id="166" class="Keyword">infix</a>  <a id="173" class="Number">4</a> <a id="175" href="Type.html#2011" class="Datatype Operator">_⊢⋆_</a>
<a id="180" class="Keyword">infixl</a> <a id="187" class="Number">5</a> <a id="189" href="Type.html#988" class="InductiveConstructor Operator">_,⋆_</a>

<a id="195" class="Keyword">infix</a>  <a id="202" class="Number">6</a> <a id="204" href="Type.html#2087" class="InductiveConstructor">Π</a>
<a id="206" class="Keyword">infixr</a> <a id="213" class="Number">7</a> <a id="215" href="Type.html#626" class="InductiveConstructor Operator">_⇒_</a>
<a id="219" class="Keyword">infix</a>  <a id="226" class="Number">5</a> <a id="228" href="Type.html#2198" class="InductiveConstructor">ƛ</a>
<a id="230" class="Keyword">infixl</a> <a id="237" class="Number">7</a> <a id="239" href="Type.html#2253" class="InductiveConstructor Operator">_·_</a>
<a id="243" class="Keyword">infix</a>  <a id="250" class="Number">9</a> <a id="252" href="Type.html#1403" class="InductiveConstructor">S</a>
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
Let `I`, `J`, `K` range over kinds:
<pre class="Agda"><a id="808" class="Keyword">variable</a>
  <a id="819" href="Type.html#819" class="Generalizable">I</a> <a id="821" href="Type.html#821" class="Generalizable">J</a> <a id="823" href="Type.html#823" class="Generalizable">K</a> <a id="825" class="Symbol">:</a> <a id="827" href="Type.html#572" class="Datatype">Kind</a>
</pre>
## Type contexts

A type context is either empty or extends a type
context by a type variable of a given kind.

<pre class="Agda"><a id="953" class="Keyword">data</a> <a id="Ctx⋆"></a><a id="958" href="Type.html#958" class="Datatype">Ctx⋆</a> <a id="963" class="Symbol">:</a> <a id="965" class="PrimitiveType">Set</a> <a id="969" class="Keyword">where</a>
  <a id="Ctx⋆.∅"></a><a id="977" href="Type.html#977" class="InductiveConstructor">∅</a> <a id="979" class="Symbol">:</a> <a id="981" href="Type.html#958" class="Datatype">Ctx⋆</a>
  <a id="Ctx⋆._,⋆_"></a><a id="988" href="Type.html#988" class="InductiveConstructor Operator">_,⋆_</a> <a id="993" class="Symbol">:</a> <a id="995" href="Type.html#958" class="Datatype">Ctx⋆</a> <a id="1000" class="Symbol">→</a> <a id="1002" href="Type.html#572" class="Datatype">Kind</a> <a id="1007" class="Symbol">→</a> <a id="1009" href="Type.html#958" class="Datatype">Ctx⋆</a>
</pre>
Let `Φ`, `Ψ`, `Θ` range over type contexts:
<pre class="Agda"><a id="1067" class="Keyword">variable</a>
  <a id="1078" href="Type.html#1078" class="Generalizable">Φ</a> <a id="1080" href="Type.html#1080" class="Generalizable">Ψ</a> <a id="1082" href="Type.html#1082" class="Generalizable">Θ</a> <a id="1084" class="Symbol">:</a> <a id="1086" href="Type.html#958" class="Datatype">Ctx⋆</a>
</pre>
## Type variables

Type variables are not named, they are numbered (de Bruijn indices).

A type variable is indexed by its context and kind. For a given
context, it's impossible to construct a variable that is out of
scope.

<pre class="Agda"><a id="1325" class="Keyword">data</a> <a id="_∋⋆_"></a><a id="1330" href="Type.html#1330" class="Datatype Operator">_∋⋆_</a> <a id="1335" class="Symbol">:</a> <a id="1337" href="Type.html#958" class="Datatype">Ctx⋆</a> <a id="1342" class="Symbol">→</a> <a id="1344" href="Type.html#572" class="Datatype">Kind</a> <a id="1349" class="Symbol">→</a> <a id="1351" class="PrimitiveType">Set</a> <a id="1355" class="Keyword">where</a>

  <a id="_∋⋆_.Z"></a><a id="1364" href="Type.html#1364" class="InductiveConstructor">Z</a> <a id="1366" class="Symbol">:</a> <a id="1368" class="Comment">-------------</a>
      <a id="1388" href="Type.html#1078" class="Generalizable">Φ</a> <a id="1390" href="Type.html#988" class="InductiveConstructor Operator">,⋆</a> <a id="1393" href="Type.html#821" class="Generalizable">J</a> <a id="1395" href="Type.html#1330" class="Datatype Operator">∋⋆</a> <a id="1398" href="Type.html#821" class="Generalizable">J</a>

  <a id="_∋⋆_.S"></a><a id="1403" href="Type.html#1403" class="InductiveConstructor">S</a> <a id="1405" class="Symbol">:</a> <a id="1407" href="Type.html#1078" class="Generalizable">Φ</a> <a id="1409" href="Type.html#1330" class="Datatype Operator">∋⋆</a> <a id="1412" href="Type.html#821" class="Generalizable">J</a>
      <a id="1420" class="Comment">-------------</a>
    <a id="1438" class="Symbol">→</a> <a id="1440" href="Type.html#1078" class="Generalizable">Φ</a> <a id="1442" href="Type.html#988" class="InductiveConstructor Operator">,⋆</a> <a id="1445" href="Type.html#823" class="Generalizable">K</a> <a id="1447" href="Type.html#1330" class="Datatype Operator">∋⋆</a> <a id="1450" href="Type.html#821" class="Generalizable">J</a>
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

<pre class="Agda"><a id="1981" class="Keyword">open</a> <a id="1986" class="Keyword">import</a> <a id="1993" href="Data.String.html" class="Module">Data.String</a>

<a id="2006" class="Keyword">data</a> <a id="_⊢⋆_"></a><a id="2011" href="Type.html#2011" class="Datatype Operator">_⊢⋆_</a> <a id="2016" class="Symbol">:</a> <a id="2018" href="Type.html#958" class="Datatype">Ctx⋆</a> <a id="2023" class="Symbol">→</a> <a id="2025" href="Type.html#572" class="Datatype">Kind</a> <a id="2030" class="Symbol">→</a> <a id="2032" class="PrimitiveType">Set</a> <a id="2036" class="Keyword">where</a>

  <a id="_⊢⋆_.`"></a><a id="2045" href="Type.html#2045" class="InductiveConstructor">`</a> <a id="2047" class="Symbol">:</a> <a id="2049" href="Type.html#1078" class="Generalizable">Φ</a> <a id="2051" href="Type.html#1330" class="Datatype Operator">∋⋆</a> <a id="2054" href="Type.html#821" class="Generalizable">J</a>
      <a id="2062" class="Comment">--------</a>
    <a id="2075" class="Symbol">→</a> <a id="2077" href="Type.html#1078" class="Generalizable">Φ</a> <a id="2079" href="Type.html#2011" class="Datatype Operator">⊢⋆</a> <a id="2082" href="Type.html#821" class="Generalizable">J</a>

  <a id="_⊢⋆_.Π"></a><a id="2087" href="Type.html#2087" class="InductiveConstructor">Π</a> <a id="2089" class="Symbol">:</a> <a id="2091" href="Type.html#1078" class="Generalizable">Φ</a> <a id="2093" href="Type.html#988" class="InductiveConstructor Operator">,⋆</a> <a id="2096" href="Type.html#823" class="Generalizable">K</a> <a id="2098" href="Type.html#2011" class="Datatype Operator">⊢⋆</a> <a id="2101" href="Type.html#591" class="InductiveConstructor">*</a>
      <a id="2109" class="Comment">-----------</a>
    <a id="2125" class="Symbol">→</a> <a id="2127" href="Type.html#1078" class="Generalizable">Φ</a> <a id="2129" href="Type.html#2011" class="Datatype Operator">⊢⋆</a> <a id="2132" href="Type.html#591" class="InductiveConstructor">*</a>

  <a id="_⊢⋆_._⇒_"></a><a id="2137" href="Type.html#2137" class="InductiveConstructor Operator">_⇒_</a> <a id="2141" class="Symbol">:</a> <a id="2143" href="Type.html#1078" class="Generalizable">Φ</a> <a id="2145" href="Type.html#2011" class="Datatype Operator">⊢⋆</a> <a id="2148" href="Type.html#591" class="InductiveConstructor">*</a>
      <a id="2156" class="Symbol">→</a> <a id="2158" href="Type.html#1078" class="Generalizable">Φ</a> <a id="2160" href="Type.html#2011" class="Datatype Operator">⊢⋆</a> <a id="2163" href="Type.html#591" class="InductiveConstructor">*</a>
        <a id="2173" class="Comment">------</a>
      <a id="2186" class="Symbol">→</a> <a id="2188" href="Type.html#1078" class="Generalizable">Φ</a> <a id="2190" href="Type.html#2011" class="Datatype Operator">⊢⋆</a> <a id="2193" href="Type.html#591" class="InductiveConstructor">*</a>

  <a id="_⊢⋆_.ƛ"></a><a id="2198" href="Type.html#2198" class="InductiveConstructor">ƛ</a> <a id="2200" class="Symbol">:</a> <a id="2202" href="Type.html#1078" class="Generalizable">Φ</a> <a id="2204" href="Type.html#988" class="InductiveConstructor Operator">,⋆</a> <a id="2207" href="Type.html#823" class="Generalizable">K</a> <a id="2209" href="Type.html#2011" class="Datatype Operator">⊢⋆</a> <a id="2212" href="Type.html#821" class="Generalizable">J</a> 
      <a id="2221" class="Comment">-----------</a>
    <a id="2237" class="Symbol">→</a> <a id="2239" href="Type.html#1078" class="Generalizable">Φ</a> <a id="2241" href="Type.html#2011" class="Datatype Operator">⊢⋆</a> <a id="2244" href="Type.html#823" class="Generalizable">K</a> <a id="2246" href="Type.html#626" class="InductiveConstructor Operator">⇒</a> <a id="2248" href="Type.html#821" class="Generalizable">J</a>

  <a id="_⊢⋆_._·_"></a><a id="2253" href="Type.html#2253" class="InductiveConstructor Operator">_·_</a> <a id="2257" class="Symbol">:</a> <a id="2259" href="Type.html#1078" class="Generalizable">Φ</a> <a id="2261" href="Type.html#2011" class="Datatype Operator">⊢⋆</a> <a id="2264" href="Type.html#823" class="Generalizable">K</a> <a id="2266" href="Type.html#626" class="InductiveConstructor Operator">⇒</a> <a id="2268" href="Type.html#821" class="Generalizable">J</a>
      <a id="2276" class="Symbol">→</a> <a id="2278" href="Type.html#1078" class="Generalizable">Φ</a> <a id="2280" href="Type.html#2011" class="Datatype Operator">⊢⋆</a> <a id="2283" href="Type.html#823" class="Generalizable">K</a>
        <a id="2293" class="Comment">------</a>
      <a id="2306" class="Symbol">→</a> <a id="2308" href="Type.html#1078" class="Generalizable">Φ</a> <a id="2310" href="Type.html#2011" class="Datatype Operator">⊢⋆</a> <a id="2313" href="Type.html#821" class="Generalizable">J</a>

  <a id="_⊢⋆_.μ"></a><a id="2318" href="Type.html#2318" class="InductiveConstructor">μ</a> <a id="2320" class="Symbol">:</a> <a id="2322" href="Type.html#1078" class="Generalizable">Φ</a> <a id="2324" href="Type.html#2011" class="Datatype Operator">⊢⋆</a> <a id="2327" class="Symbol">(</a><a id="2328" href="Type.html#823" class="Generalizable">K</a> <a id="2330" href="Type.html#626" class="InductiveConstructor Operator">⇒</a> <a id="2332" href="Type.html#591" class="InductiveConstructor">*</a><a id="2333" class="Symbol">)</a> <a id="2335" href="Type.html#626" class="InductiveConstructor Operator">⇒</a> <a id="2337" href="Type.html#823" class="Generalizable">K</a> <a id="2339" href="Type.html#626" class="InductiveConstructor Operator">⇒</a> <a id="2341" href="Type.html#591" class="InductiveConstructor">*</a>
    <a id="2347" class="Symbol">→</a> <a id="2349" href="Type.html#1078" class="Generalizable">Φ</a> <a id="2351" href="Type.html#2011" class="Datatype Operator">⊢⋆</a> <a id="2354" href="Type.html#823" class="Generalizable">K</a>
      <a id="2362" class="Comment">---------------------</a>
    <a id="2388" class="Symbol">→</a> <a id="2390" href="Type.html#1078" class="Generalizable">Φ</a> <a id="2392" href="Type.html#2011" class="Datatype Operator">⊢⋆</a> <a id="2395" href="Type.html#591" class="InductiveConstructor">*</a>

  <a id="_⊢⋆_.con"></a><a id="2400" href="Type.html#2400" class="InductiveConstructor">con</a> <a id="2404" class="Symbol">:</a> <a id="2406" href="Builtin.Constant.Type.html#2898" class="Datatype">TyCon</a>
        <a id="2420" class="Comment">------</a>
      <a id="2433" class="Symbol">→</a> <a id="2435" href="Type.html#1078" class="Generalizable">Φ</a> <a id="2437" href="Type.html#2011" class="Datatype Operator">⊢⋆</a> <a id="2440" href="Type.html#591" class="InductiveConstructor">*</a>
</pre>
Let `A`, `B`, `C` range over types:
<pre class="Agda"><a id="2487" class="Keyword">variable</a>
  <a id="2498" href="Type.html#2498" class="Generalizable">A</a> <a id="2500" href="Type.html#2500" class="Generalizable">A&#39;</a> <a id="2503" href="Type.html#2503" class="Generalizable">B</a> <a id="2505" href="Type.html#2505" class="Generalizable">B&#39;</a> <a id="2508" href="Type.html#2508" class="Generalizable">C</a> <a id="2510" href="Type.html#2510" class="Generalizable">C&#39;</a>  <a id="2514" class="Symbol">:</a> <a id="2516" href="Type.html#1078" class="Generalizable">Φ</a> <a id="2518" href="Type.html#2011" class="Datatype Operator">⊢⋆</a> <a id="2521" href="Type.html#821" class="Generalizable">J</a>
</pre>