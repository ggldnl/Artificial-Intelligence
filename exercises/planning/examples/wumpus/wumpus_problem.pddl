(define (problem wumpus_problem)

	(:domain wumpus_domain)

	(:objects s11 s12 s13 s21 s22 s23 gold1 arrow1 agent wumpus)

	(:init 
		(adj s11 s12) (adj s12 s11) (adj s12 s13) (adj s13 s12) 
		(adj s21 s22) (adj s22 s21) (adj s22 s23) (adj s23 s22) 
		(adj s11 s21) (adj s21 s11) (adj s12 s22) (adj s22 s12) 
		(adj s13 s23) (adj s23 s13) (pit s12) (is_gold gold1) 
		(at gold1 s13) (is_agent agent) (at agent s11) (is_arrow arrow1) 
		(have agent arrow1) (is_wumpus wumpus) (at wumpus s23) (wumpus_in s23)
	)

	(:goal (and 
		(have agent gold1) 
		(at agent s11))
	)
)