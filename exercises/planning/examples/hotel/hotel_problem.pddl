(define  (problem  hotel_problem)

	(:domain hotel_domain)

	(:objects  
		sq11 sq12 sq13
		sq21 sq22 sq23
		sq31 sq32 sq33
		sq41 sq42 sq43 
		robot
	)
	
	(:init 
		(adj sq11 sq21)  (adj sq21 sq11)
		(adj sq12 sq22)  (adj sq22 sq12)
		(adj sq21 sq22)  (adj sq22 sq21)
		(adj sq13 sq23)  (adj sq23 sq13)
		(adj sq21 sq22)  (adj sq22 sq21)
		(adj sq21 sq32)  (adj sq32 sq21)
		(adj sq21 sq31)  (adj sq31 sq21)
		(adj sq22 sq23)  (adj sq23 sq22)
		(adj sq22 sq33)  (adj sq33 sq22)
		(adj sq22 sq32)  (adj sq32 sq22)
		(adj sq22 sq31)  (adj sq31 sq22)
		(adj sq23 sq33)  (adj sq33 sq23)
		(adj sq23 sq32)  (adj sq32 sq23)
		(adj sq31 sq32)  (adj sq32 sq31)
		(adj sq31 sq41)  (adj sq41 sq31)
		(adj sq32 sq33)  (adj sq33 sq32)
		(adj sq32 sq42)  (adj sq42 sq32)
		(adj sq33 sq43)  (adj sq43 sq33)

		(location sq11) (location sq12) (location sq13)
		(location sq21) (location sq22) (location sq23)
		(location sq31) (location sq32) (location sq33)
		(location sq41) (location sq42) (location sq43)
		
		(door  sq11 sq21) (door  sq21 sq11)
		(door sq12 sq22)  (door sq22 sq12)
		(door sq13 sq23)  (door sq23 sq13)
		(door sq31 sq41)  (door sq41 sq31)
		(door sq32 sq42)  (door sq42 sq32)
		(door sq33 sq43)  (door sq43 sq33)
		
		(busy sq11) (busy sq13)
		(busy sq41) (busy sq42)
		
		(dirty sq12)  (dirty sq41)  (dirty sq43)

		(at robot sq21)
		(agent robot)
	)
	
	(:goal (and 
		(not (dirty sq12))
		(not (dirty sq43))
	))
)
