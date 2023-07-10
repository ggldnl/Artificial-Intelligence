(define (domain device_placement_domain)
	
	(:requirements :strips)
	(:requirements :equality) ; needed in order to use =
	
	(:predicates 
		(at ?x ?y) 
		(full ?x) 
		(adj ?x ?y)
	)
	
	; Type A devices can be placed in the grid only if the chosen cell 
	; is not occupied by another type A device. If there is already a type B 
	; device the type A device can be placed on top of the type B device.
	; It is forbidden to have two devices of the same type on a row and on a column
	; q = cell
	(:action place_a
		:parameters (?q ?col ?row)
		:precondition (and 
			(not (= ?col ?row)) ; = -> compare ?col and ?row -> not diagonal (row = col)
			(adj ?q ?row) (adj ?q ?col) ; cell at (row, col) is on same row/col as q
			(not (at DEVA ?q)) 
			(not (at DEVA ?row)) 
			(not (at DEVA ?col))
		)
		:effect (and 
			(at DEVA ?q) (full ?q)
		)
	)
	
	; A type B device can only be placed in a free cell
	; It is forbidden to have two devices of the same type on a row and on a column
	(:action place_b
		:parameters (?q ?col ?row)
		:precondition (and 
			(not (= ?col ?row)) 
			(adj ?q ?row) 
			(adj ?q ?col) 
			(not (at DEVA ?q)) 
			(not (at DEVB ?q)) 
			(not (at DEVB ?row)) 
			(not (at DEVB ?col))
		)
		:effect (and 
			(at DEVB ?q) (full ?q)
		)
	)
)