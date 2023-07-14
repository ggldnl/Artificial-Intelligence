(define (problem exam_problem_old)

    (:domain exam_domain_old)

    (:objects

        ; robot arms
        screwdriver_arm
        manipulator_arm

        ; refrigerator components
        refrigerator
        backplate 
        screw1 screw2
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
        (is_screw screw1)
        (is_screw screw2)

        (mounted refrigerator backplate)
        (mounted refrigerator old_compressor)
        (screwed screw1)
        (screwed screw2)

        (is_on refrigerator)
    )
    (:goal (and
        (is_off refrigerator)
        (mounted refrigerator new_compressor)
        (mounted refrigerator backplate)
        ; (screwed screw1) (screwed screw2)
        
    ))
)