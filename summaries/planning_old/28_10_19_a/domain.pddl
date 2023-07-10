(define (domain IT_domain)

	(:requirements :strips)
	
	(:predicates 
		(at ?what ?where)	; move the entity (agent/object) in the target from ?from to ?where
		(empty ?pos)		; is there already an agent in ?pos ?
		(valid ?agent ?pos)	; is the position ?pos valid for ?agent ?
		(is_object ?what)
	)

	(:action move
		:parameters (?agent ?from ?to) 
		:precondition (and (at ?agent ?from) (empty ?to) (valid ?agent ?to))
		:effect (and (at ?agent ?to) (not (at ?agent ?from)) (not (empty ?to)) (empty ?from))
	)

	(:action carry
		:parameters (?agent ?what ?from ?to)
		:precondition (and (at ?agent ?from) (at ?what ?from) (valid ?agent ?to) (empty ?to) (is_object ?what))
		:effect (and (at ?agent ?to) (at ?what ?to) (not (at ?what ?from)) (not (at ?agent ?from))
			(empty ?from) (not (empty ?to)))
	)
)