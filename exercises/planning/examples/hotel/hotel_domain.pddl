(define (domain hotel_domain)

	(:requirements :strips :negative-preconditions)

	(:predicates 
		(at ?x ?y)
		(adj ?x ?y) 
		(agent ?x)
		(location ?x)		; is ?x a cell?
		(busy ?x)			; is the room crowded?
		(dirty ?loc)		 ; is the room ?x dirty?
		(door ?A ?B)		; is there a door between location ?A and ?B?
	)

	(:action move
		:parameters (?agent ?from ?to)
		:precondition (and 
			(at ?agent ?from)
			(adj ?from ?to)
			(not (door ?from ?to))	; is there a closed door between ?from and ?to?
			(not (busy ?to))		; are there guests in the room?

			; objects validation
			(agent ?agent)
			(location ?from)		; locations are grid cells
			(location ?to)
		)
		:effect (and 
			(not (at ?agent ?from)) (at ?agent ?to)
		)
	)
	(:action clean
		:parameters (?agent ?loc)
		:precondition (and 
			(at ?agent ?loc)
			; (dirty ?loc)
			
			; objects validation
			(agent ?agent)
			(location ?loc))
		:effect (and 
			(not (dirty ?loc))
		)
	)
	
	(:action traverse
		; enter rooms by traversing the door
		:parameters (?agent ?from ?to)
		:precondition (and 

			(at ?agent ?from)
			(adj ?from ?to)
			(door ?from ?to)
			(not (busy ?to))

			; objects validation
			(agent ?agent)
			(location ?from)
			(location ?to)
		)
		:effect (and 
			(not (at ?agent ?from)) (at ?agent ?to)
		)
	)
)