(define (problem IT_problem)

	(:domain IT_domain)

	(:objects C, G, Bo, Ba, C20, C21, C22, C11, C12, C01, C02)

	(:init 
		(at C C21) (at G C01)
		(valid G C01) (valid G C02) (valid G C11)
		(valid C C20) (valid C C21) (valid C C22) (valid C C11) (valid C C12)
		(adj C20 C21) (adj C21 C22) (adj C21 C11) (adj C22 C12)
		(adj C11 C01) (adj C12 C02) (adj C11 C12) (adj C01 C02)
	)

	(:goal 

	)
)