(define (domain exam_domain)

    (:requirements :strips :equality :negative-preconditions)

    (:predicates
        ; every predicate started with "is_" is used for
        ; object consistency check

        (is_screwdriver ?arm)
        (is_manipulator ?arm)

        (is_refrigerator ?obj)
        (is_backplate ?obj)
        (is_compressor ?obj)

        ; check if the fridge is on or off
        (is_on ?refrigerator)
        (is_off ?refrigerator)
    
        ; check if the component ?what is mounted or not 
        ; to/from the component ?from
        (mounted ?from ?what)
        (unmounted ?from ?what)

        (can_reassemble ?refrigerator)
        (repaired ?refrigerator)

        (screwed ?refrigerator ?backplate) ; is ?what screwed ?
        (unscrewed ?refrigerator ?backplate)  ; is ?screw unscrewed? 
    )

    (:action turn_off
        :parameters (?arm ?refrigerator)
        :precondition (and 
            (is_on ?refrigerator)

            (is_manipulator ?arm)
            (is_refrigerator ?refrigerator)
        )
        :effect (and 
            (is_off ?refrigerator)
        )
    )
    (:action turn_on
        :parameters (?arm ?refrigerator)
        :precondition (and 
            (is_off ?refrigerator)

            (is_manipulator ?arm)
            (is_refrigerator ?refrigerator)
        )
        :effect (and 
            (is_on ?refrigerator)
        )
    )
    (:action unscrew_backplate
        :parameters (?arm ?refrigerator ?backplate)
        :precondition (and
            (screwed ?refrigerator ?backplate)
        
            (is_screwdriver ?arm)
            (is_backplate ?backplate)
        )
        :effect (and
            (unscrewed ?refrigerator ?backplate)
        )
    )
    (:action unmount_backplate
        :parameters (?arm ?refrigerator ?backplate)
        :precondition (and
            (mounted ?refrigerator ?backplate)
            (unscrewed ?refrigerator ?backplate)

            (is_manipulator ?arm)
            (is_refrigerator ?refrigerator)
            (is_backplate ?backplate)
        )
        :effect (and
            (unmounted ?refrigerator ?backplate)
        )
    )
    (:action unmount_compressor
        :parameters (?arm ?refrigerator ?backplate ?compressor)
        :precondition (and
            (mounted ?refrigerator ?compressor)
            (unmounted ?refrigerator ?backplate)
            (is_off ?refrigerator)

            (is_manipulator ?arm)
            (is_refrigerator ?refrigerator)
            (is_compressor ?compressor)
            (is_backplate ?backplate)
        )
        :effect (and 
            (unmounted ?refrigerator ?compressor)
        )
    )
    (:action replace_compressor
        :parameters (?arm ?refrigerator ?backplate ?old_compressor ?new_compressor)
        :precondition (and 
            (unmounted ?refrigerator ?old_compressor)
            (unmounted ?refrigerator ?backplate)
            (is_off ?refrigerator)
            (not (= ?old_compressor ?new_compressor))
            
            (is_manipulator ?arm)
            (is_refrigerator ?refrigerator)
            (is_compressor ?old_compressor)
            (is_compressor ?new_compressor)
            (is_backplate ?backplate)
        )
        :effect (and
            (can_reassemble ?refrigerator)
            (mounted ?refrigerator ?new_compressor)
        )
    )
    (:action mount_backplate
        :parameters (?arm ?refrigerator ?backplate)
        :precondition (and
            (can_reassemble ?refrigerator)
            (unmounted ?refrigerator ?backplate)
            
            (is_manipulator ?arm)
            (is_refrigerator ?refrigerator)
            (is_backplate ?backplate)
        )
        :effect (and
            (mounted ?refrigerator ?backplate)
        )
    )
    (:action screw_backplate
        :parameters (?arm ?refrigerator ?backplate)
        :precondition (and
            (can_reassemble ?refrigerator)
            (mounted ?refrigerator ?backplate)
            (unscrewed ?refrigerator ?backplate)
        
            (is_screwdriver ?arm)
        )
        :effect (and
            (repaired ?refrigerator)
            (screwed ?refrigerator ?backplate)
        )
    )
)