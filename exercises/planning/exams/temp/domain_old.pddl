(define (domain exam_domain_old)

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
        (can_mount_compressor ?refrigerator)

        (is_screw ?object)  ; is ?screw a screw?
        (screwed ?screw) ; is ?screw screwed?
        (unscrewed ?screw)  ; is ?screw unscrewed? 
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
    (:action screw 
        :parameters (?arm ?what)
        :precondition (and
            (unscrewed ?what)

            (is_screwdriver ?arm)
            (is_screw ?what) ; you
        )
        :effect (and 
            (screwed ?what)
        )
    )
    (:action unscrew 
        :parameters (?arm ?what)
        :precondition (and 
            (screwed ?what)

            (is_screwdriver ?arm)
            (is_screw ?what)
        )
        :effect (and 
            (unscrewed ?what)
        )
    )
    (:action unmount_backplate
        :parameters (?arm ?refrigerator ?compressor ?backplate ?screw1 ?screw2)
        :precondition (and 
            (is_off ?refrigerator)
            (unscrewed ?screw1)
            (unscrewed ?screw2)
            (not (= ?screw1 ?screw2))
            (mounted ?refrigerator ?backplate)
            (mounted ?refrigerator ?compressor)

            (is_manipulator ?arm)
            (is_refrigerator ?refrigerator)
            (is_compressor ?compressor)
            (is_backplate ?backplate)
            (is_screw ?screw1)
            (is_screw ?screw2)
        )
        :effect (and 
            (unmounted ?refrigerator ?backplate)
        )
    )
    (:action mount_backplate
        :parameters (?arm ?refrigerator ?compressor ?backplate ?screw1 ?screw2)
        :precondition (and 
            (is_off ?refrigerator)
            (unscrewed ?screw1)
            (unscrewed ?screw2)
            (not (= ?screw1 ?screw2))
            (unmounted ?refrigerator ?backplate)
            (mounted ?refrigerator ?compressor)

            (is_manipulator ?arm)
            (is_refrigerator ?refrigerator)
            (is_compressor ?compressor)
            (is_backplate ?backplate)
            (is_screw ?screw1)
            (is_screw ?screw2)
        )
        :effect (and 
            (mounted ?refrigerator ?backplate)
        )
    )
    (:action mount_compressor
        :parameters (?arm ?refrigerator ?compressor ?backplate)
        :precondition (and 
            (is_off ?refrigerator)
            (unmounted ?refrigerator ?backplate)
            (can_mount_compressor ?refrigerator)

            (is_manipulator ?arm)
            (is_refrigerator ?refrigerator)
            (is_compressor ?compressor)
            (is_backplate ?backplate)
        )
        :effect (and 
            (mounted ?refrigerator ?compressor)
        )
    )
    (:action unmount_compressor
        :parameters (?arm ?refrigerator ?compressor ?backplate)
        :precondition (and 
            (is_off ?refrigerator)
            (unmounted ?refrigerator ?backplate)
            (mounted ?refrigerator ?compressor)

            (is_manipulator ?arm)
            (is_refrigerator ?refrigerator)
            (is_compressor ?compressor)
            (is_backplate ?backplate)
        )
        :effect (and 
            (unmounted ?refrigerator ?compressor)
            (can_mount_compressor ?refrigerator)
        )
    )
)