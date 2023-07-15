(define (domain exam_domain)

    (:requirements :strips :equality :negative-preconditions)

    (:predicates
        (at ?agent ?where)
        (adj ?spot1 ?spot2)
        (can_move ?agent ?where)
        (free ?agent)
        (has ?agent ?what)

        (agent ?agent)
        (spot ?spot)
        (object ?object)
    )

    (:action move
        :parameters (?agent ?from ?to)
        :precondition (and 
            (at ?agent ?from)
            (adj ?from ?to)
            (can_move ?agent ?to)

            (agent ?agent)
            (spot ?from)
            (spot ?to)
        )
        :effect (and 
            (at ?agent ?to)
            (not (at ?agent ?from))
        )
    )
    (:action take
        :parameters(?agent1 ?agent2 ?what ?where)
        :precondition (and 
            (at ?agent1 ?where)
            (at ?what ?where)
            (at ?agent2 ?where)
            (free ?agent1)

            (agent ?agent1)
            (agent ?agent2)
            (object ?what)
            (spot ?where)

            (not (= ?agent1 ?agent2))
        )
        :effect (and 
            (has ?agent1 ?what)
            (not (at ?what ?where))
            (not (free ?agent1))
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