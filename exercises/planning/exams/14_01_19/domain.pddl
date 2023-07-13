(define (domain exam_domain)

    (:requirements :strips :equality :negative-preconditions)

    (:predicates
        (agent ?object)
        (cell ?object)
        (at ?agent ?cell)
        (adj ?cell1 ?cell2)
        (has ?agent ?object)
        (wood ?cell1 ?cell2)
        (pickaxe ?object)
        (mineral ?object)
        (exit ?loc)
        (exited ?agent)
        (free ?agent)
    )

    (:action move
        :parameters (?agent ?from ?to)
        :precondition (and 
            (at ?agent ?from)
            (adj ?from ?to)
            (not (wood ?from ?to))

            (agent ?agent)
            (cell ?from)
            (cell ?to)
        )
        :effect (and 
            (not (at ?agent ?from))
            (at ?agent ?to)
        )
    )

    (:action take
        :parameters (?agent ?object ?loc)
        :precondition (and 
            (at ?agent ?loc)
            (at ?object ?loc)
            (free ?agent)

            (agent ?agent)
            (cell ?loc)
        )
        :effect (and 
            (has ?agent ?object)
            (not (at ?object ?loc))
            (not (free ?agent))
        )
    )
    (:action drop
        :parameters (?agent ?object ?loc)
        :precondition (and 
            (at ?agent ?loc)
            (has ?agent ?object)
            (not (free ?agent))

            (agent ?agent)
            (cell ?loc)
        )
        :effect (and 
            (not (has ?agent ?object))
            (at ?object ?loc)
            (free ?agent)
        )
    )
    (:action strike
        :parameters (?agent ?from ?to ?pickaxe)
        :precondition (and 
            (at ?agent ?from)
            (wood ?from ?to)
            (has ?agent ?pickaxe)
            (not (free ?agent))
            
            (agent ?agent)
            (cell ?from)
            (cell ?to)
            (pickaxe ?pickaxe)
        )
        :effect (and 
            (not (wood ?from ?to))
            (not (has ?agent ?pickaxe))
            (free ?agent)
        )
    )
    (:action exit
        :parameters (?agent ?mineral ?loc)
        :precondition (and 
            (at ?agent ?loc)
            (exit ?loc)
            (has ?agent ?mineral)
            
            (mineral ?mineral)
            (agent ?agent)
            (cell ?loc)
        )
        :effect (and 
            (exited ?agent)
        )
    )
)