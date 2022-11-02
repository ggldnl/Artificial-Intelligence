(define (domain IT_domain)
	
	(:requirements :strips)
	
	(:predicates 
		(at ?what ?where) ; check if the entity ?what (agent/object) is at ?where
		(valid ?agent ?cell) ; check if the ?agent can stay in ?cell
		(adj ?cell1 ?cell2)	; check if ?cell1 and ?cell2 are adjacent 
		(free ?agent) ; agents can only carry one object at a time
		(carrying ?agent ?object) ; check if the ?agent is carrying ?object 
	)
	
	(:action move
		:parameters (?agent ?from ?to)
		:precondition (at ?agent ?from) (valid ?agent ?to)
		:effect (at ?agent ?to) (not (at ?agent ?from))
	)

	(:action pick
		:parameters (?agent ?object ?from)
		:precondition ( and
			(at ?object ?from) (at ?agent ?from) (free ?agent)
		)
		:effect ( and
			(not (at ?object ?from)) (not (free ?agent)) (carrying ?agent ?object)
		)
	)

	(:action drop
		:parameters (?agent ?object ?where)
		:precondition ( and
			(at ?agent ?where) (carrying ?agent ?object) (not (free ?agent))
		)
		:effect (and
			(at ?object ?where) (free ?agent) (not (carrying ?agent ?object))
		)
	)

)
