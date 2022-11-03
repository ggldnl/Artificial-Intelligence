(define (domain labyrinth_domain)

	(:requirements :strips)

	(:predicates
		
		(agent ?who)
		(at ?agent ?where)

		(cell ?what)
		(valid ?from ?to)
		(wall ?cell)
	)

	(:action move
		:parameters (?agent ?from ?to)
		:precondition (and 
			(agent ?agent) (cell ?from) (cell ?to)
			(at ?agent ?from) (valid ?from ?to)
			(not (wall ?to))
		)
		:effect (and 
			(at ?agent ?to) (not (at ?agent ?from))
		)
	)
)