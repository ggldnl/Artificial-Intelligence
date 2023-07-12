(define (problem exam_problem)

    (:domain exam_domain)

    (:objects
        agent
        sq00 sq01 sq02 sq03
        sq10 sq11 sq12 sq13
        sq20 sq21 sq22 sq23
    )

    (:init
        (agent agent)

        (cell sq00) (cell sq01) (cell sq02) (cell sq03) 
        (cell sq10) (cell sq11) (cell sq12) (cell sq13) 
        (cell sq20) (cell sq21) (cell sq22) (cell sq23) 
        
                    (pit sq01)              (door sq03)
                    (pit sq11)
                    (pit sq21)  (pit sq22)  (key sq23)
        
                    (rope sq01)
                    (rope sq11)
                    (rope sq21)

        (at agent sq20)

        (adj sq00 sq01) (adj sq00 sq10) 
        (adj sq01 sq00) (adj sq01 sq02) (adj sq01 sq11) 
        (adj sq02 sq01) (adj sq02 sq03) (adj sq02 sq12) 
        (adj sq03 sq02) (adj sq03 sq13) 
        (adj sq10 sq00) (adj sq10 sq11) (adj sq10 sq20) 
        (adj sq11 sq01) (adj sq11 sq10) (adj sq11 sq12) (adj sq11 sq21) 
        (adj sq12 sq02) (adj sq12 sq11) (adj sq12 sq13) (adj sq12 sq22) 
        (adj sq13 sq03) (adj sq13 sq12) (adj sq13 sq23) 
        (adj sq20 sq10) (adj sq20 sq21) 
        (adj sq21 sq11) (adj sq21 sq20) (adj sq21 sq22) 
        (adj sq22 sq12) (adj sq22 sq21) (adj sq22 sq23) 
        (adj sq23 sq13) (adj sq23 sq22)
    )

    (:goal (and
        (at agent sq03) (has_key agent)
    ))
)