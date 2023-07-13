(define (problem exam_problem)

    (:domain exam_domain)

    (:objects
        R X0 X1
        Re3 Re9
        S8   
    )

    (:init
        (agent R)
        (date X0)
        (date X1)
        
        (cell Re3) (cell Re9) (cell S8)
        (adj Re3 Re9) (adj Re9 S8) (adj S8 Re3)
        (adj Re9 Re3) (adj S8 Re9) (adj Re3 S8)

    )

    (:goal (and
        (dinner R X0) (dinner R X1)
    ))
)