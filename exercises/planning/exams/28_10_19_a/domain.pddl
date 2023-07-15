(define (domain exam_domain)

    (:requirements :strips :equality :negative-preconditions)

    (:predicates
        (at ?what ?where)
        (has ?who ?what)
        (adj ?spot1 ?spot2)
        (free ?agent)
        (can_move ?agent ?where)
        (someone_in ?where)

        (agent ?agent)
        (object ?object)
        (spot ?spot)
    )

    (:action move
        :parameters (?agent ?from ?to)
        :precondition (and 
            (at ?agent ?from)
            (adj ?from ?to)
            (can_move ?agent ?to)
            (not (someone_in ?to))

            (agent ?agent)
            (spot ?from)
            (spot ?to)
        )
        :effect (and 
            (at ?agent ?to)
            (not (at ?agent ?from))
            (someone_in ?to)
            (not (someone_in ?from))
        )
    )
    (:action take
        :parameters (?agent ?what ?where)
        :precondition (and 
            (at ?agent ?where)
            (at ?what ?where)
            (free ?agent)

            (agent ?agent)
            (object ?what)
            (spot ?where)
        )
        :effect (and 
            (has ?agent ?what)
            (not (free ?agent))
            (not (at ?what ?where))
        )
    )
    (:action drop
        :parameters (?agent ?what ?where)
        :precondition (and 
            (at ?agent ?where)
            (has ?agent ?what)

            (agent ?agent)
            (object ?what)
            (spot ?where)
        )
        :effect (and 
            (free ?agent)
            (at ?what ?where)
            (not (has ?agent ?what))
        )
    )
)