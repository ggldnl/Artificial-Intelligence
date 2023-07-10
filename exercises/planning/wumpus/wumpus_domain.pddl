; An agent can move between squares and collect gold if any in the same
; square. Some of the squares are not walkable as either there is a pit 
; or the wumpus is hiding inside them. The agent can shoot at the wumpus
; with an arrow if they are in adjacent squares. The agent cannot move
; in the same square as the wumpus otherwise he will die. 
; Objective is to collect the gold.
; This is not my implementation.

(define (domain wumpus_domain)
    (:requirements :disjunctive-preconditions)

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
			(or (is_gold ?what) (is_arrow ?what))
			; nobody told us how many objects can the agent hold:
			; if the agent could have carried only one arrow then we 
			; would have had to specify (not (have ?who ?what)).
			; The "at" action can also be used with gold. 
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