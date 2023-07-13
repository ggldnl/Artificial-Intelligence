(define (domain exam_domain)

    (:requirements :strips :equality :negative-preconditions)

    (:predicates
        (at ?agent ?loc)
        (adj ?loc1 ?loc2)
        (cell ?object)
        (agent ?object)
        (date ?object)
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
        )
    )
    (:action wait
        :parameters (?date ?where)
        :precondition (and 
            
        )
        :effect (and 
        
        )
    )
    
)