(define (domain exam_domain)

    (:requirements :strips :equality :negative-preconditions)

    (:predicates
        (at ?agent ?loc)
        (adj ?loc1 ?loc2)
        (cell ?object)
        (agent ?object)
        (date ?object)
        (had_dinner ?agent ?date)
        (free ?cell)
        (waited ?date)
        (mall ?loc)
        (right_place ?date ?loc)
        (has_time ?agent)
    )

    (:action move
        :parameters (?agent ?from ?to)
        :precondition (and 
            (at ?agent ?from)
            (adj ?from ?to)

            (agent ?agent)
            (cell ?from)
            (cell ?to)
        )
        :effect (and 
            (at ?agent ?to)
            (not (at ?agent ?from))
        )
    )
    (:action drive
        :parameters (?agent ?who ?from ?to)
        :precondition (and 
            (at ?agent ?from)
            (at ?who ?from)
            (adj ?from ?to)
            (free ?to) ; no other dates in ?to

            (agent ?agent)
            (date ?who)
            (cell ?from)
            (cell ?to)
        )
        :effect (and 
            (at ?agent ?to)
            (not (at ?agent ?from))
            (at ?who ?to)
            (not (at ?who ?from))
            (free ?from)
        )
    )
    (:action drop_to_shopping
        :parameters (?agent ?date ?where)
        :precondition (and
            (at ?date ?where)

            (cell ?where)
            (date ?date)
            (mall ?where)
        )
        :effect (and 
            ; (waited ?date)
            (has_time ?agent)
        )
    )
    (:action dinner
        :parameters (?agent ?date ?where)
        :precondition (and 
            (at ?agent ?where)
            (at ?date ?where)
            (right_place ?date ?where)
            (has_time ?agent)

            (agent ?agent)
            (date ?date)
            (cell ?where)
        )
        :effect (and 
            (had_dinner ?agent ?date)
            (has_time ?agent)
        )
    )
)
