(define

    (problem exam_problem)

    (:domain exam_domain)

    (:objects
        A0 A1 T
        P0 P1 P2 P3
    )

    (:init 
        (athlete A0) (athlete A1)
        (trainer T)

        (location P0) (location P1) (location P2) (location P3)
        (not (visited P0)) (not (visited P1)) (not (visited P2)) (not (visited P3))
        (adj P0 P1) (adj P1 P2) (adj P2 P3)
        ; (adj P1 P0) (adj P2 P1) (adj P3 P2)

        (at T P0)
        (at A0 P0)
        (at A1 P0)

        (obstacle P1) (jumpable P1)
        (obstacle P3) (crouchable P3)
    )

    (:goal (and
        (at A0 P3) (at A1 P3)  
    ))

)