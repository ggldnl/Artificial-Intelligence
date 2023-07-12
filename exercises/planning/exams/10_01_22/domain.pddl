(define
    (domain exam_domain)

    (:requirements :strips :equality :negative-preconditions)

    (:predicates
        (agent ?object)
        (cell ?object)
        (adj ?loc1 ?loc2)
        (has_key ?agent)
        (door ?loc)    ; does ?loc have a door?
        (pit ?loc)  ; is there a pit?
        (rope ?loc) ; is there a rope?
        (key ?loc)  ; does ?loc have a key?  
        (at ?agent ?where)
    )

    (:action move
        :parameters (?agent ?from ?to)
        :precondition (and 
            (at ?agent ?from) (adj ?from ?to)
            (not (pit ?to))

            (agent ?agent)
            (cell ?from)
            (cell ?to)
        )
        :effect (and 
            (at ?agent ?to)
            (not (at ?agent ?from))
        )
    )
    (:action jump
        :parameters (?agent ?from ?passing_by ?to)
        :precondition (and 
            (at ?agent ?from)
            (pit ?passing_by)
            (rope ?passing_by)
            (not (pit ?to))
            (adj ?from ?passing_by)
            (adj ?passing_by ?to)

            (agent ?agent)
            (cell ?from)
            (cell ?passing_by)
            (cell ?to)
        )
        :effect (and 
            (at ?agent ?to) (not (at ?agent ?from))
        )
    )
    (:action take_key
        :parameters (?agent ?loc)
        :precondition (and 
            (at ?agent ?loc)
            (key ?loc)

            (agent ?agent)
            (cell ?loc)
        )
        :effect (and 
            (has_key ?agent)
        )
    )
    ;(:action open_door
    ;    :parameters (?agent ?loc)
    ;    :precondition (and 
    ;        (at ?agent ?loc)
    ;        (door ?loc)
    ;        (has_key ?agent)
    ;
    ;        (cell ?loc)
    ;        (agent ?agent)
    ;    )
    ;    :effect (and 
    ;        ()
    ;    )
    ;)
)