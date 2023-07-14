(define (problem exam_problem)

    (:domain exam_domain)

    (:objects

        ; robot arms
        screwdriver_arm
        manipulator_arm

        ; refrigerator components
        refrigerator
        backplate 
        old_compressor
        new_compressor
    )
    (:init
        
        (is_screwdriver screwdriver_arm)
        (is_manipulator manipulator_arm)

        (is_refrigerator refrigerator)
        (is_backplate backplate)
        (is_compressor old_compressor)
        (is_compressor new_compressor)

        (mounted refrigerator backplate)
        (screwed refrigerator backplate)

        (mounted refrigerator old_compressor)

        (is_on refrigerator)
    )
    (:goal (and
        (is_off refrigerator)
        (repaired refrigerator)
    ))
)