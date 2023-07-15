(define (problem exam_problem)

    (:domain exam_domain)

    (:objects
        
        G ; Georgie
        C ; Clown

        Ba ; Baloon
        Bo ; Boat

        ; spots G can move
        P0 P1 P3

        ; spots C can move
        P2 P4 P5 P6
    )

    (:init
        
        (spot P0) (spot P1) (spot P3)
        (spot P2) (spot P4) (spot P5) (spot P6)

        (adj P0 P1) (adj P1 P0)
        (adj P1 P3) (adj P3 P1)
        (adj P0 P3) (adj P3 P0)

        (adj P1 P5) (adj P5 P1)
        (adj P5 P6) (adj P6 P5)
        (adj P6 P2) (adj P2 P6)
        (adj P2 P4) (adj P4 P2)
        (adj P4 P1) (adj P1 P4)

        (can_move G P0)
        (can_move G P1)
        (can_move G P3)

        (can_move C P1)
        (can_move C P5)
        (can_move C P6)
        (can_move C P2)
        (can_move C P4)

        (at G P0) (someone_in P0)
        (at C P6) (someone_in P6)

        (has G Bo)
        (has C Ba)
    
        (agent G) (agent C)
        (object Ba) (object Bo)
    )

    (:goal (and
        (has G Ba) (at G P3)
        (has C Bo) (at C P5)
    ))

)
