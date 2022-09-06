Clausal Form for Predicate Calculus Formulas
In order to prove a formula in the predicate calculus by resolution, we

	1. Negate the formula.
	2. Put the negated formula into CNF, by doing the following:
		1. Get rid of all <img src="https://rawgit.com/ggldnl/artificial_intelligence/main/svgs/e5d134f35dc4949fab12ec64d186248a.svg?invert_in_darkmode" align=middle width=16.43840384999999pt height=14.15524440000002pt/> operators.
		2. Push the <img src="https://rawgit.com/ggldnl/artificial_intelligence/main/svgs/23bf728170c10d0449b90561f827623a.svg?invert_in_darkmode" align=middle width=10.95894029999999pt height=14.15524440000002pt/> operators in as far as possible.
		3. Rename variables as necessary (see the step below).
		4. Move all of the quantifiers to the left (the outside) of the expression using the following rules (where <img src="https://rawgit.com/ggldnl/artificial_intelligence/main/svgs/5a611f5b46923b44f264d14b5c42d0f1.svg?invert_in_darkmode" align=middle width=12.785434199999989pt height=22.465723500000017pt/> is either <img src="https://rawgit.com/ggldnl/artificial_intelligence/main/svgs/ecea226b5977d1a327732124dccb8969.svg?invert_in_darkmode" align=middle width=9.132448049999992pt height=22.831056599999986pt/> or <img src="https://rawgit.com/ggldnl/artificial_intelligence/main/svgs/42353da95c0a3784bd8339b6e4fb1260.svg?invert_in_darkmode" align=middle width=9.132448049999992pt height=22.831056599999986pt/>, and <img src="https://rawgit.com/ggldnl/artificial_intelligence/main/svgs/5201385589993766eea584cd3aa6fa13.svg?invert_in_darkmode" align=middle width=12.92464304999999pt height=22.465723500000017pt/> is a formula that does not contain <img src="https://rawgit.com/ggldnl/artificial_intelligence/main/svgs/332cc365a4987aacce0ead01b8bdcc0b.svg?invert_in_darkmode" align=middle width=9.39498779999999pt height=14.15524440000002pt/>):

			<ul>
				<l> <img src="https://rawgit.com/ggldnl/artificial_intelligence/main/svgs/ecd086e02f5a2e33812e195b57f8c205.svg?invert_in_darkmode" align=middle width=132.44846339999998pt height=24.65753399999998pt/> becomes <img src="https://rawgit.com/ggldnl/artificial_intelligence/main/svgs/88eaad7ec9a376253c86a4d105fef125.svg?invert_in_darkmode" align=middle width=122.14036229999999pt height=24.65753399999998pt/>. </l>
				<img src="https://rawgit.com/ggldnl/artificial_intelligence/main/svgs/a64e80111d5a8d43bb24ebda49f24038.svg?invert_in_darkmode" align=middle width=132.44846339999998pt height=24.65753399999998pt/> becomes <img src="https://rawgit.com/ggldnl/artificial_intelligence/main/svgs/536ad1e4bfbb240d32bceb4c6b31c1d6.svg?invert_in_darkmode" align=middle width=122.14036229999999pt height=24.65753399999998pt/>.
				<img src="https://rawgit.com/ggldnl/artificial_intelligence/main/svgs/a1fd9c71907ecb3587c67310c861ffc0.svg?invert_in_darkmode" align=middle width=92.72475299999999pt height=24.65753399999998pt/> becomes <img src="https://rawgit.com/ggldnl/artificial_intelligence/main/svgs/7e03203ddf3908c273e65428fe5c309f.svg?invert_in_darkmode" align=middle width=105.51018719999999pt height=24.65753399999998pt/>.
				<img src="https://rawgit.com/ggldnl/artificial_intelligence/main/svgs/99b88df731fef5d1e79504806eca8029.svg?invert_in_darkmode" align=middle width=92.72475299999999pt height=24.65753399999998pt/> becomes <img src="https://rawgit.com/ggldnl/artificial_intelligence/main/svgs/ea75d9b02ebe6b13d92cf25b48b0bb6d.svg?invert_in_darkmode" align=middle width=105.51018719999999pt height=24.65753399999998pt/>.
				<img src="https://rawgit.com/ggldnl/artificial_intelligence/main/svgs/069977c95a313f284de058a717b0cbec.svg?invert_in_darkmode" align=middle width=154.50334184999997pt height=24.65753399999998pt/> becomes <img src="https://rawgit.com/ggldnl/artificial_intelligence/main/svgs/eb32bfe962637a5dadf3dd03577a08ab.svg?invert_in_darkmode" align=middle width=165.79721069999997pt height=24.65753399999998pt/>.
				<img src="https://rawgit.com/ggldnl/artificial_intelligence/main/svgs/e6eee487f7f93efbd3530ffadbbba528.svg?invert_in_darkmode" align=middle width=154.50334184999997pt height=24.65753399999998pt/> becomes <img src="https://rawgit.com/ggldnl/artificial_intelligence/main/svgs/08a03fedf7d935a10b84735500c6ae33.svg?invert_in_darkmode" align=middle width=165.79721069999997pt height=24.65753399999998pt/>.
			</ul>
			
	This leaves the formula in what is called prenex form which consists of a series of quantifiers followed by a quantifier-free formula, called the matrix.

	Remove all quantifiers from the formula. First we remove the existentially quantified variables by using Skolemization. Each existentially quantified variable, say <img src="https://rawgit.com/ggldnl/artificial_intelligence/main/svgs/332cc365a4987aacce0ead01b8bdcc0b.svg?invert_in_darkmode" align=middle width=9.39498779999999pt height=14.15524440000002pt/>, is replaced by a function term which begins with a new, <img src="https://rawgit.com/ggldnl/artificial_intelligence/main/svgs/55a049b8f161ae7cfeb0197d75aff967.svg?invert_in_darkmode" align=middle width=9.86687624999999pt height=14.15524440000002pt/>-ary function symbol, say <img src="https://rawgit.com/ggldnl/artificial_intelligence/main/svgs/190083ef7a1625fbc75f243cffb9c96d.svg?invert_in_darkmode" align=middle width=9.81741584999999pt height=22.831056599999986pt/>, where <img src="https://rawgit.com/ggldnl/artificial_intelligence/main/svgs/55a049b8f161ae7cfeb0197d75aff967.svg?invert_in_darkmode" align=middle width=9.86687624999999pt height=14.15524440000002pt/> is the number of universally quantified variables that occur before <img src="https://rawgit.com/ggldnl/artificial_intelligence/main/svgs/332cc365a4987aacce0ead01b8bdcc0b.svg?invert_in_darkmode" align=middle width=9.39498779999999pt height=14.15524440000002pt/> is quantified in the formula. The arguments to the function term are precisely these variables. For example, if we have the formula


	<p align="center"><img src="https://rawgit.com/ggldnl/artificial_intelligence/main/svgs/5d53a46c173e866a94c73c66fd9a8624.svg?invert_in_darkmode" align=middle width=140.4943122pt height=14.611878599999999pt/></p>

	then <img src="https://rawgit.com/ggldnl/artificial_intelligence/main/svgs/f93ce33e511096ed626b4719d50f17d2.svg?invert_in_darkmode" align=middle width=8.367621899999993pt height=14.15524440000002pt/> would be replaced by a function term <img src="https://rawgit.com/ggldnl/artificial_intelligence/main/svgs/e00e75871b4e789e5c465fdab29fa79a.svg?invert_in_darkmode" align=middle width=47.95292369999999pt height=24.65753399999998pt/>, where <img src="https://rawgit.com/ggldnl/artificial_intelligence/main/svgs/190083ef7a1625fbc75f243cffb9c96d.svg?invert_in_darkmode" align=middle width=9.81741584999999pt height=22.831056599999986pt/> is a new function symbol. The result is:



	<p align="center"><img src="https://rawgit.com/ggldnl/artificial_intelligence/main/svgs/7e313347d5d34a7441ef84a2cc16580f.svg?invert_in_darkmode" align=middle width=158.0134512pt height=16.438356pt/></p>

	This new formula is satisfiable if and only if the original formula is satisfiable.

	The new function symbol is called a Skolem function. If the existentially quantified variable has no preceding universally quantified variables, then the function is a 0-ary function and is often called a Skolem constant.

	After removing all existential quantifiers, we simply drop all the universal quantifiers as we assume that any variable appearing in a formula is universally quantified.

	The remaining formula (the matrix) is put in CNF by moving any <img src="https://rawgit.com/ggldnl/artificial_intelligence/main/svgs/27290dc895d845aaaa0cf6cd9efb862f.svg?invert_in_darkmode" align=middle width=10.95894029999999pt height=18.264896099999987pt/> operators outside of any <img src="https://rawgit.com/ggldnl/artificial_intelligence/main/svgs/fd925eff76f375c2bf103304b13a5b35.svg?invert_in_darkmode" align=middle width=10.95894029999999pt height=18.264896099999987pt/> operations.
	Finally, the CNF formula is written in clausal format by writing each conjunct as a set of literals (a clause), and the whole formula as a set clauses (the clause set).

</ol>

For example, if we begin with the proposition, <img src="https://rawgit.com/ggldnl/artificial_intelligence/main/svgs/112f02471bffcb04dfcfbd69e78d198c.svg?invert_in_darkmode" align=middle width=196.37682404999998pt height=22.831056599999986pt/>, we have:

Negate the theorem: <img src="https://rawgit.com/ggldnl/artificial_intelligence/main/svgs/4ff62d04b0ee53e88cd06000503434c8.svg?invert_in_darkmode" align=middle width=212.8152972pt height=24.65753399999998pt/>.
Push the <img src="https://rawgit.com/ggldnl/artificial_intelligence/main/svgs/23bf728170c10d0449b90561f827623a.svg?invert_in_darkmode" align=middle width=10.95894029999999pt height=14.15524440000002pt/> operators in. No change.
Rename variables if necessary: <img src="https://rawgit.com/ggldnl/artificial_intelligence/main/svgs/1730c27aa325334431df62cac4cb14b3.svg?invert_in_darkmode" align=middle width=212.6631375pt height=24.65753399999998pt/>.
Move the quantifiers to the outside: First, we have <img src="https://rawgit.com/ggldnl/artificial_intelligence/main/svgs/9840e2a3537e14cd88afc22495930d6d.svg?invert_in_darkmode" align=middle width=225.44857004999997pt height=24.65753399999998pt/>. Then we get <img src="https://rawgit.com/ggldnl/artificial_intelligence/main/svgs/129b7aedca2412f75ef3683bca06af92.svg?invert_in_darkmode" align=middle width=225.44857004999997pt height=24.65753399999998pt/>.
Remove the quantifiers, first by Skolemizing the existentially quantified variables. As these have no universally quantified variables to their left, they are replaced by Skolem constants: <img src="https://rawgit.com/ggldnl/artificial_intelligence/main/svgs/22d0d4dcb2d3eec6767f659df143f90a.svg?invert_in_darkmode" align=middle width=176.18490615pt height=24.65753399999998pt/>.
Drop the universal quantifiers: <img src="https://rawgit.com/ggldnl/artificial_intelligence/main/svgs/579946605b86cddd3ac42231e38e2cab.svg?invert_in_darkmode" align=middle width=118.79533214999998pt height=24.65753399999998pt/>.

Put the matrix into CNF. No change.
Write the formula in clausal form: <img src="https://rawgit.com/ggldnl/artificial_intelligence/main/svgs/7be52e7364a8409842b2a1e03ec38400.svg?invert_in_darkmode" align=middle width=157.15177334999998pt height=24.65753399999998pt/>.