(define (problem labyrinth_problem)

	(:domain labyrinth_domain)

	(:objects
		C11 C12 C13 C14
		C21 C22 C23 C24
		C31 C32 C33 C34
		C41 C42 C43 C44
		agent wall exit
	)

	(:init 
		(cell C11) (cell C12) (cell C13) (cell C14)
		(cell C21) (cell C22) (cell C23) (cell C24)
		(cell C31) (cell C32) (cell C33) (cell C34)
		(cell C41) (cell C42) (cell C43) (cell C44)

		(valid C11 C12)
		(valid C21 C12)
		(valid C11 C21)
		(valid C21 C11)
		(valid C21 C31)
		(valid C31 C21)
		(valid C31 C32)
		(valid C31 C42)
		(valid C31 C41)
		(valid C41 C42)
		(valid C41 C31)
		(valid C41 C32)
		(valid C42 C32)
		(valid C42 C43)
		(valid C43 C44)
		(valid C43 C34)
		(valid C44 C34)
		(valid C34 C24)
		(valid C24 C14)
		(valid C14 C24)
		(valid C24 C34)
		(valid C34 C44)

		(wall C13) (wall C23) (wall C33) (wall C22)

		(agent agent)
		(at agent C31)
	)

	(:goal
		(at agent C34) ; exit
	)
)