; Hanoi
; in order to model the problem we consider pegs smaller than disks
; (we don't have the or operator so we can't say something like
; "move there the disk if the peg is empty or if the last disk is larger")
; This way we will always put a disk on an empty peg.
; Pegs are smaller than anything.
; D3 < D2 < D1

(define (domain hanoi_domain)
	
	(:requirements :strips)
	
	(:predicates
		(clear ?x)
		(on ?x ?y)
		(smaller ?x ?y)
	)
	
	(:action move
		:parameters (?disk ?from ?to)
		:precondition (and
			(smaller ?to ?disk)
			(on ?disk ?from)
			(clear ?disk)
			(clear ?to)
		)
		:effect (and
			(clear ?from)
			(on ?disk ?to)
			(not (on ?disk ?from))
			(not (clear ?to))
		)
	)
)