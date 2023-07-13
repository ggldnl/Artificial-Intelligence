(define 

    (domain museum_domain)

    (:requirements :strips :equality :negative-preconditions)

    (:predicates
        (at ?object ?loc)
        (agent ?object)
        (switch ?object)
        (cell ?object)
        (adj ?loc1 ?loc2)
        (animal ?obj)
        (animal_in ?loc ?animal)
        (people ?object)
        (served ?people)
        (wet ?loc)
        (on ?switch)
        (off ?switch)
    )

    (:action move
        :parameters (?agent ?from ?to)
        :precondition (and 
            (at ?agent ?from)
            (adj ?from ?to)
            (not (wet ?to))

            (agent ?agent)
            (cell ?from)
            (cell ?to)
        )
        :effect (and 
            (not (at ?agent ?from)) (at ?agent ?to)
        )
    )
    (:action turn_on
        :parameters (?agent ?switch ?loc)
        :precondition (and
            (at ?agent ?loc) 
            (at ?switch ?loc)
            (off ?switch)

            (switch ?switch)
            (agent ?agent)
            (cell ?loc)
        )
        :effect (and 
            (on ?switch)
        )
    )
    (:action turn_off
        :parameters (?agent ?switch ?loc)
        :precondition (and
            (at ?agent ?loc)
            (at ?switch ?loc)
            (on ?switch)

            (switch ?switch)
            (agent ?agent)
            (cell ?loc)
        )
        :effect (and 
            (off ?switch)
        )
    )
    (:action play_sound
        :parameters (?agent ?people ?loc)
        :precondition (and
            (at ?agent ?loc) 
            (at ?people ?loc)
            (not (served ?people))

            (people ?people)
            (agent ?agent)
            (cell ?loc)
        )
        :effect (and 
            (served ?people)
        )
    )
)
