(define (domain wumpus_domain)

	(:predicates
		(at ?what ?cell)
		(adj ?cell1 ?cell2) 
		(pit ?cell) 
		(wumpus_in ?cell) 
		(have ?who ?what)
		(is_agent ?who)
		(is_wumpus ?who)
		(is_gold ?what)
		(is_arrow ?what)
		(dead ?who)
	)

	(:action move
		:parameters (?who ?from ?to)
		:precondition (and 
			(is_agent ?who) (at ?who ?from) (adj ?from ?to)
			(not (pit ?to)) (not (wumpus_in ?to))
		)
		:effect (and 
			(not (at ?who ?from)) (at ?who ?to)
		)
	)

	(:action take
		:parameters (?who ?what ?where)
		:precondition (and 
			(is_agent ?who) (at ?who ?where) (at ?what ?where)
			; nobody told us how many objects can the agent hold:
			; if the agent could have carried only one arrow then we 
			; would have had to specify (not (have ?who ?what))
		)
		:effect (and 
			(have ?who ?what) (not (at ?what ?where))
		)
	)

	(:action shoot
		:parameters (?who ?from ?with_what ?victim ?to)
		:precondition (and 
			(is_agent ?who) (have ?who ?with_what) (is_arrow ?with_what)
			(at ?who ?from) (is_wumpus ?victim) (at ?victim ?to) (adj ?from ?to)
		)
		:effect ( and
			(dead ?victim) (not (wumpus_in ?to)) (not (have ?who ?with_what))
		)
	)
)