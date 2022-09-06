# Clausal Form for Predicate Calculus Formulas

In order to prove a formula in the predicate calculus by resolution, we

1. Negate the formula;

2. Put the negated formula into CNF, by doing the following:

	1. Get rid of all $\rightarrow$ operators 
<p align="center">
$A \rightarrow B \eq \neg (A \or B)$
</p>
	($A \rightarrow B \equals \neg (A \or B)$)

	2. Push the $\neg$ operators in as far as possible.
	3. Rename variables as necessary (see the step below).
	4. Move all of the quantifiers to the left (the outside) of the expression using the following rules (where ${\rm Q}$ is either $\forall$ or $\exists$, and $G$ is a formula that does not contain $x$):

		<ul>
			<l> $\forall x \; R(x) \wedge \forall x \; S(x)$ becomes $\forall x \; (R(x)
			\wedge S(x))$. </l>
			$\exists x \; R(x) \vee \exists x \; S(x)$ becomes $\exists x \; (R(x)
			\vee S(x))$.
			${\rm Q} x \; R(x) \wedge G$ becomes ${\rm Q} x \; (R(x) \wedge G)$.
			${\rm Q} x \; R(x) \vee G$ becomes ${\rm Q} x \; (R(x) \vee G)$.
			${\rm Q_1} x \; R(x) \wedge {\rm Q_2} x \; S(x)$ becomes ${\rm Q_1} x \; {\rm Q_2} y \; (R(x) \wedge S(y))$.
			${\rm Q_1} x \; R(x) \vee {\rm Q_2} x \; S(x)$ becomes ${\rm Q_1} x \; {\rm Q_2} y \; (R(x) \vee S(y))$.
		</ul>
		
This leaves the formula in what is called prenex form which consists of a series of quantifiers followed by a quantifier-free formula, called the matrix.

Remove all quantifiers from the formula. First we remove the existentially quantified variables by using Skolemization. Each existentially quantified variable, say $x$, is replaced by a function term which begins with a new, $n$-ary function symbol, say $f$, where $n$ is the number of universally quantified variables that occur before $x$ is quantified in the formula. The arguments to the function term are precisely these variables. For example, if we have the formula


\begin{displaymath}\forall x \; \forall y \; \exists z \; x+y < z,\end{displaymath}

then $z$ would be replaced by a function term $f(x,y)$, where $f$ is a new function symbol. The result is:



\begin{displaymath}\forall x \; \forall y \; x+y<f(x,y).\end{displaymath}

This new formula is satisfiable if and only if the original formula is satisfiable.

The new function symbol is called a Skolem function. If the existentially quantified variable has no preceding universally quantified variables, then the function is a 0-ary function and is often called a Skolem constant.

After removing all existential quantifiers, we simply drop all the universal quantifiers as we assume that any variable appearing in a formula is universally quantified.

The remaining formula (the matrix) is put in CNF by moving any $\wedge$ operators outside of any $\vee$ operations.
Finally, the CNF formula is written in clausal format by writing each conjunct as a set of literals (a clause), and the whole formula as a set clauses (the clause set).

For example, if we begin with the proposition, $\exists x \; \forall y \; y
< x \rightarrow \forall y \; \exists x \; y < x$, we have:

Negate the theorem: $\exists x \; \forall y \; y
< x \wedge \exists y \; \forall x \; \neg(y < x)$.
Push the $\neg$ operators in. No change.
Rename variables if necessary: $\exists x \; \forall y \; y
< x \wedge \exists u \; \forall v \; \neg(u < v)$.
Move the quantifiers to the outside: First, we have $\exists x \;
\exists u \; (\forall y \; y < x \wedge \forall v \; \neg(u < v))$. Then we get $\exists x \; \exists u \; \forall y \; \forall v \; (y < x \wedge \neg(u < v))$.
Remove the quantifiers, first by Skolemizing the existentially quantified variables. As these have no universally quantified variables to their left, they are replaced by Skolem constants: $\forall y \; \forall v \; (y < a \wedge \neg (b < v))$.
Drop the universal quantifiers: $y < a \wedge \neg (b < v)$.

Put the matrix into CNF. No change.
Write the formula in clausal form: $\{\{y < a\}, \{\neg(b <
v)\}\}$.