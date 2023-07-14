(define (domain exam_domain)

    (:requirements :strips :equality :negative-preconditions)

    (:predicates
        (at ?agent ?loc)
        (adj ?loc1 ?loc2)
        (can_navigate ?agent ?loc)
        (alien_in ?loc)
        (aliens_left ?agent)
        (has ?agent ?obj)
        (agent ?obj)
        (location ?obj)
        (alien ?obj)
        (relic ?obj)
    )

    (:action move
        :parameters (?agent ?from ?to)
        :precondition (and 
            (at ?agent ?from)
            (adj ?from ?to)
            (can_navigate ?agent ?to)
            (not (alien_in ?to))
            (not (alien_in ?from))

            (agent ?agent)
            (location ?from)
            (location ?to)
        )
        :effect (and 
            (at ?agent ?to)
            (not (at ?agent ?from))
        )
    )

    (:action shoot
        :parameters (?agent ?alien ?where)
        :precondition (and 
            (at ?agent ?where)
            (at ?alien ?where)
            (alien_in ?where)

            (agent ?agent)
            (alien ?alien)
            (location ?where)
        )
        :effect (and 
            (not (at ?alien ?where))
            (not (alien_in ?where))
        )
    )
    

    (:action enter_and_shoot
        :parameters (?agent ?alien ?from ?to)
        :precondition (and 
            (at ?agent ?from)
            (at ?alien ?to)
            (adj ?from ?to)
            (can_navigate ?agent ?to)
            (not (alien_in ?from))
            (alien_in ?to)

            (agent ?agent)
            (alien ?alien)
            (location ?from)
            (location ?to)
        )
        :effect (and 
            (not (at ?agent ?from))
            (at ?agent ?to)
            (not (alien_in ?to))
        )
    )
    
    (:action collect_relics
        :parameters (?agent1 ?agent2 ?relic1 ?relic2 ?where1 ?where2)
        :precondition (and 
            (at ?agent1 ?where1)
            (at ?relic1 ?where1)
            (at ?agent2 ?where2)
            (at ?relic2 ?where2)
            (not (= ?agent1 ?agent2))
            (not (= ?relic1 ?relic2))
            (not (= ?where1 ?where2))

            (agent ?agent1)
            (relic ?relic1)
            (location ?where1)
            
            (agent ?agent2)
            (relic ?relic2)
            (location ?where2)
        )
        :effect (and
            (has ?agent1 ?relic1)
            (has ?agent2 ?relic2)
        )
    )

)