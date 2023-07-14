(define (problem exam_problem)

    (:domain exam_domain)

    (:objects
        R X0 X1
        Re3 Re9
        S8   
    )

    (:init
        (agent R) (agent R) (at R S8)
        (date X0) (date X0) (at X0 Re3)
        (date X1) (date X1) (at X1 Re9)

        (right_place X0 Re9)
        (right_place X1 Re3)
        
        (cell Re3) (cell Re9) (cell S8)
        (adj Re3 Re9) (adj Re9 S8) (adj S8 Re3)
        (adj Re9 Re3) (adj S8 Re9) (adj Re3 S8)

        (free S8)

        (mall S8)
    )

    (:goal (and
        (had_dinner R X0) (had_dinner R X1)
        ; (at X1 Re3) (at X0 Re9) (waited X0)
    ))
)