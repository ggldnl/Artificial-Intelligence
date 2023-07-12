; The Shakey's World Problem is a classic artificial intelligence 
; planning problem formulated in the Planning Domain Definition Language 
; (PDDL). It is based on a hypothetical scenario in which an agent named 
; Shakey operates in a simplified world. Shakey's goal is to move blocks 
; from one location to another. The problem is commonly used as a 
; benchmark for testing automated planning algorithms.
; This is a simplified case in which all the robot should do is to move
; two boxes from a room to another and climb one of them.

(define (domain shakeys_world_domain)

    (:requirements :strips :equality)

    (:predicates
        (on ?agent ?object)
        (at ?agent ?location)
        (adj ?loc1 ?loc2)
        (agent ?agent)
        (location ?loc)
        (box ?object)
        (floor ?object)         ; ?object is on the floor
    )

    (:action move
        :parameters (?agent ?from ?to)
        :precondition (and 
            (at ?agent ?from) (adj ?from ?to) ; (not (at ?agent ?to))
            (floor ?agent)
            (agent ?agent) (location ?from) (location ?to)
        )
        :effect (and 
            (at ?agent ?to) (not (at ?agent ?from))
        )
    )
    (:action push
        :parameters (?agent ?object ?from ?to)
        :precondition (and 
            (agent ?agent) (box ?object) (location ?from) (location ?to)
            (floor ?agent)
            (floor ?object)
            (at ?agent ?from)   ; (not (at ?agent ?to))
            (at ?object ?from)  ; (not (at ?object ?to))
            (adj ?from ?to)
        )
        :effect (and 
            (at ?agent ?to)
            (at ?object ?to)
            (not (at ?agent ?from))
            (not (at ?object ?from))
        )
    )
    (:action climb_up
        :parameters (?agent ?object ?loc)
        :precondition (and 
            (agent ?agent) (box ?object) (location ?loc)
            (floor ?agent) (floor ?object)
            (at ?agent ?loc) (at ?object ?loc)
            ; (not (on ?agent ?object))
        )
        :effect (and 
            (on ?agent ?object)
            (not (floor ?agent))
        )
    )
)