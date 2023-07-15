(define (problem exam_problem)

    (:domain exam_domain)

    (:objects
        
        G ; Georgie
        C ; Clown

        Ba ; Baloon
        Bo ; Boat

        ; spots G can move
        P01 P02 P11

        ; spots C can move
        P12 P20 P21 P22
    )

    (:init
        (spot P01) (spot P02) (spot P11)
        (spot P12) (spot P20) (spot P21) (spot P22)

        (adj P01 P02) (adj P02 P01)
        (adj P01 P11) (adj P11 P01)
        (adj P11 P12) (adj P12 P11) 
        (adj P11 P21) (adj P21 P11)
        (adj P21 P20) (adj P20 P21)
        (adj P21 P22) (adj P22 P21)

        (can_move G P01)
        (can_move G P11)
        (can_move G P02)

        (can_move C P11)
        (can_move C P12)
        (can_move C P20)
        (can_move C P21)
        (can_move C P22)

        (at G P01)
        (at C P21)

        (has G Bo)
        (has C Ba)

        (agent G) (agent C)
        (object Ba) (object Bo)
    )

    (:goal (and
        (at G P02) (has G Ba)
        (at C P22) (has C Bo)
    ))

)
