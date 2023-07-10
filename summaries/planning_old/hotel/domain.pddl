(define (domain hotel_domain)

	(:requirements :strips)

	(:predicates 
		(at ?x ?y)
		(adj ?x ?y) 
		(wall ?y)
		(ro ?x) ; is ?x the robot?
		(busy ?x) ; is the room crowded?
		(d ?x) ; is the room ?x dirty?
		(door ?x ?y)
	)

	(:action move
		:parameters (?a ?from ?to)
		:precondition (and 
			(at ?a ?from)
			(adj ?from ?to)
			(ro ?a)
			(not (door ?from ?to))
			(not (busy ?to))) ; apparently people can even stand in the corridor
		:effect (and 
			(not (at ?a ?from)) (at ?a ?to)
		)
	)

	(:action clean
		:parameters (?a ?loc)
		:precondition (and 
			(at ?a ?loc)
			(ro ?a)
			(d ?loc))
		:effect (and 
			(not (d ?loc))
		)
	)
	
	(:action traverse
		:parameters (?a ?from ?to)
		:precondition (and 
			(at ?a ?from)
			(adj ?from ?to)
			(ro ?a)
			(door ?from ?to)
			(not (busy ?to)))
		:effect (and 
			(not (at ?a ?from)) (at ?a ?to)
		)
	)
)