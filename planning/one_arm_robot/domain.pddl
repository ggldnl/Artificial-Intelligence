; One arm robot:
; a one-armed robot must position some cups on a grid to achieve
; a particular configuration. There are 4 cups (b1, b2, g1, r1).
; There are two free positions next to the grid in which to temporarily
; place cups and 4 positions on the grid. The goal is to have all 4
; cups on the grid in the sequence b1, b2, g1, r1, starting from
; the initial state e, b2, r1, e (e stands for empy) and with the
; cups b1 and g1 not on the grid
; for convenience, we consider grid and free spots next to it as if
; they were simply 6 positions of an array <p1, p2, p3, p4, p5, p6>
; where positions p1 to p4 represent those of the grid and p5 and p6
; represent the free places next to it

(define (domain one_arm_domain)
	
	(:requirements :strips)
	
	(:predicates
		(is_cup ?entity)
		(is_pos ?entity)
		(at ?cup ?pos)
		(empty ?pos)
	)

	(:action move
		:parameters (?cup ?from ?to)
		:precondition (and
			; object checking
			(is_cup ?cup)
			(is_pos ?from)
			(is_pos ?to)
			(at ?cup ?from)
			(empty ?to)
		)
		:effect (and
			(at ?cup ?to) (not (empty ?to))
			(not (at ?cup ?from)) (empty ?from)
		)
	)
)