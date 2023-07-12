(define 

	(problem device_placement_problem)
	
	(:domain device_placement_domain)
	
	(:objects 
		DEVA DEVB q1 q2 q3 q4
	)
	
	(:init
		(adj q1 q2) (adj q1 q3) (adj q2 q1) (adj q3 q1) 
		(adj q3 q4) (adj q4 q3) (adj q4 q2) (adj q2 q4)
	)
	
	(:goal (and 
		(full q1) (full q2) (full q3) (full q4))
	)
)