(define (domain basic_grid_domain)
	
	(:requirements :strips)
	
	(:predicates (at ?x) (adj ?x ?y) (obs ?x))
	
	(:action move-agent
		:parameters (?from ?to)
		:precondition (and (at ?from)
			(adj ?from ?to)
			(not (obs ?to))
		)
		:effect (and 
			(not (at ?from)) (at ?to)
		))
)
