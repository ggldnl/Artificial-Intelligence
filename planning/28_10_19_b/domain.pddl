(define (domain IT_domain)

	(:requirements :strips)

	(:predicates
		(agent ?who)
		(object ?what)
		(cell ?what)

		; agents
		(at ?who ?where)
		(free_hands ?agent)

		; cells
		(valid ?agent ?cell)
		(adj ?cell1 ?cell2)
		(empty ?cell)
	)

	(:action move
		:parameters (?agent ?from ?to)
		:precondition (and 
			(agent ?agent) (cell ?from) (cell ?to)
			(at ?agent ?from) (valid ?agent ?to) (adj ?from ?to)
		)
		:effect (and 
			(at ?agent ?to) (not (at ?agent ?from))
			(not (empty ?to))
		)
	)

	(:action move_grab
		:parameters (?agent ?what ?from ?to)
		:precondition (and 
			(agent ?agent) (cell ?from) (cell ?to)
			(at ?agent ?from) (valid ?agent ?to) (adj ?from ?to)
			(free_hands ?agent) (not (empty ?to)) 
		)
		:effect (and 
			(not (at ?agent ?from)) (at ?agent ?to) 
			(not (free_hands ?agent))
		)
	)

	(:action move_drop
		:parameters (?agent ?what ?from ?to)
		:precondition (and 
			(agent ?agent) (object ?what) (cell ?where)
		)
		:effect (and )
	)
)