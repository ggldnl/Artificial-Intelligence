(define (domain exam_domain)

    (:requirements :equality :strips :negative-preconditions :disjunctive-preconditions)

    (:predicates
        (at ?what ?where)
        (adj ?loc1 ?loc2)
        (secured ?truck)
        (lifted ?item)
        (has ?who ?what)

        (truck ?truck)
        (package ?package)
        (crate ?crate)
        (location ?location)
    )

    (:action drive
        :parameters (?truck ?from ?to)
        :precondition (and 
            (at ?truck ?from)
            (adj ?from ?to)
            (secured ?truck)

            (truck ?truck)
            (location ?from)
            (location ?to)
        )
        :effect (and 
            (at ?truck ?to)
            (not (at ?truck ?from))
        )
    )
    (:action lift
        :parameters (?truck ?item ?location)
        :precondition (and 
            (at ?truck ?location)
            (at ?item ?location)

            ; the truck must be secured before it can lift a package;
            ; if it is lifting a crate it doesn't need to be secured
            ; (or (crate ?item) (and (package ?item) (secured ?truck)))
            (secured ?truck)

            (not (has ?truck ?item))
            (not (lifted ?item))

            (truck ?truck)
            (location ?location)
            (or (crate ?item) (package ?item))
        )
        :effect (and 
            (lifted ?item)
            (not (secured ?truck))
        )
    )
    (:action secure
        :parameters (?truck ?crate ?where)
        :precondition (and 
            (lifted ?crate)
            (not (secured ?truck))
            (at ?crate ?where)

            (truck ?truck)
            (crate ?crate)
            (location ?where)
        )
        :effect (and 
            (not (at ?crate ?where))
            (not (lifted ?crate))
            (has ?truck ?crate)
            (secured ?truck)
        )
    )
    (:action dropCrate
        :parameters (?truck ?crate ?where)
        :precondition (and 
            (at ?truck ?where)
            (secured ?truck)
            (has ?truck ?crate)

            (truck ?truck)
            (crate ?crate)
            (location ?where)
        )
        :effect (and 
            (at ?crate ?where)
            (not (has ?truck ?crate))
            ; (not (secured ?truck))
        )
    )
    (:action fillCrate
        :parameters (?truck ?crate ?package ?where)
        :precondition (and 
            (at ?truck ?where)
            (at ?crate ?where)
            (at ?package ?where)

            (not (has ?truck ?crate)) ; crate cannot be filled if it is in the truck
            (lifted ?package) ; package needs to be lifted by the truck
            (not (secured ?truck))

            (truck ?truck)
            (crate ?crate)
            (package ?package)
            (location ?where)
        )
        :effect (and
            (not (lifted ?package))
            (has ?crate ?package)
            (secured ?truck)
        )
    )
    
    
)