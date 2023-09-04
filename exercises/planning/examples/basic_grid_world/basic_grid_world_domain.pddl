; Consider an environment represented by a NxN grid. An agent can move in
; any of the 8 adjacent cells unless they are occupied by an obstacle. The cost 
; of each move is one. The agent starts from the lower leftmost cell and should 
; reach the upper rightmost cell. 
; Formalize the problem of finding a sequence of agent moves to reach the goal.


(define (domain basic_grid_domain)
	
	(:requirements :strips :negative-preconditions)
	
	(:predicates (at ?x) (adj ?x ?y) (obs ?x))
	
	(:action move
		:parameters (?from ?to)
		:precondition (and 
			(at ?from)
			(adj ?from ?to)
			(not (obs ?to))
		)
		:effect (and 
			(not (at ?from)) (at ?to)
		))
)
