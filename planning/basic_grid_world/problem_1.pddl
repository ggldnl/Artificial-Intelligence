(define (problem basic_grid_problem)
	
	(:domain  basic_grid_domain)
	
	(:objects 
		sq11 sq12 sq13	
		sq21 sq22 sq23
	)

	(:init
		;;row1 adj
		(adj sq11 sq12) (adj sq12 sq13)
		(adj sq12 sq11) (adj sq13 sq12)
		;;diagonals adj
		(adj sq11 sq22) (adj sq22 sq11)
		(adj sq21 sq12) (adj sq12 sq21)
		(adj sq12 sq23) (adj sq23 sq12)
		(adj sq22 sq13) (adj sq13 sq22)
		;;cols adj
		(adj sq11 sq21) (adj sq12 sq22) (adj sq13 sq23)
		(adj sq21 sq11) (adj sq22 sq12) (adj sq23 sq13)
		;;row2 adj
		(adj sq21 sq22) (adj sq22 sq23)
		(adj sq22 sq21) (adj sq23 sq22)
		;;obs and agent
		(obs sq11) (obs sq12)
		(at sq21)
	)

	(:goal (and (at sq13)))
)