(define (domain labyrinth_doain)

    (:requirements :strips :equality :negative-preconditions)

    (:predicates
        (at ?agent ?cell)
        (wall ?cell)
        (adj ?cell1 ?cell2)

        (agent ?agent)
        (cell ?cell)
    )

    (:action move
        :parameters (?agent ?from ?to)
        :precondition (and 
            (at ?agent ?from)
            (adj ?from ?to)
            (not (wall ?to))

            (agent ?agent)
            (cell ?from)
            (cell ?to)
        )
        :effect (and 
            (at ?agent ?to)
            (not (at ?agent ?from))
        )
    )
)