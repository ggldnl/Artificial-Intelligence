(define

    (domain exam_domain)

    (:requirements :strips :equality :negative-preconditions)

    (:predicates
        (at ?agent ?loc)
        (visited ?loc) ; True if T visited ?loc
        (location ?loc)
        (adj ?loc1 ?loc2)
        (obstacle ?loc)
        (crouchable ?loc)
        (jumpable ?loc)
        (trainer ?agent)
        (athlete ?agent)
        ; (previous_turn ?agent) ; this way they can move only one after the other 
    )

    (:action move_agent
        ; arbitrary order guaranteed by the planner
        :parameters (?agent ?from ?to)
        :precondition (and
            (at ?agent ?from)
            ; (not (previous_turn ?agent)) ; this way they can move only one after the other 
            (visited ?to)
            (not (obstacle ?to))
            (adj ?from ?to)

            (athlete ?agent)
            (location ?from)
            (location ?to)
        )
        :effect (and
            (not (at ?agent ?from))
            (at ?agent ?to)
            ; (previous_turn ?agent)
        )
    )
    (:action crouch
        :parameters (?agent ?from ?to)
        :precondition (and
            (at ?agent ?from)
            (visited ?to)
            ; (not (previous_turn ?agent)) ; this way they can move only one after the other 
            (crouchable ?to)
            (adj ?from ?to)

            (athlete ?agent)
            (location ?from)
            (location ?to)
        )
        :effect (and 
            (not (at ?agent ?from))
            (at ?agent ?to)
            ; (previous_turn ?agent)
        )
    )
    (:action jump
        :parameters (?agent ?from ?to)
        :precondition (and
            (at ?agent ?from)
            (visited ?to)
            ; (not (previous_turn ?agent)) ; this way they can move only one after the other 
            (jumpable ?to)
            (adj ?from ?to)

            (athlete ?agent)
            (location ?from)
            (location ?to)
        )
        :effect (and 
            (not (at ?agent ?from))
            (at ?agent ?to)
            ; (previous_turn ?agent)
        )
    )

    (:action move   ; T
        :parameters (?agent ?from ?to)
        :precondition (and
            (at ?agent ?from)
            (not (visited ?to))
            (adj ?from ?to)

            (trainer ?agent)
            (location ?from)
            (location ?to)
        )
        :effect (and
            (at ?agent ?to)
            (not (at ?agent ?from))
            (visited ?to)
        )
    )

)