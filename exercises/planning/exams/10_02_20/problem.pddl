(define (problem exam_problem)

    (:domain exam_domain)

    (:objects
        R B
        R0 R1
        I0 I1 I2
        cX cY cZ c1 c2 c3
    )

    (:init

        (location cX) (location cY) (location cZ)
        (location c1) (location c2) (location c3)
        
        (adj cZ cY) (adj cY cX)
        ;(adj cX cY) (adj cY cZ) 
        ;(adj cY cX) (adj cZ cY)
        
        (adj c1 c2) (adj c2 c3)
        ;(adj c1 c2) (adj c2 c3)
        ;(adj c2 c1) (adj c3 c2)

        (agent R) (at R cZ) 
        (can_navigate R cX) (can_navigate R cY) (can_navigate R cZ)
        (agent B) (at B c1)
        (can_navigate B c1) (can_navigate B c2) (can_navigate B c3)

        (relic R0) (at R0 cX)
        (relic R1) (at R1 c3)

        (alien I0) (at I0 c2) (alien_in c2)
        (alien I1) (at I1 cY) (alien_in cY)
        (alien I2) (at I2 c1) (alien_in c1)
    )

    (:goal (and
        (has R R0) (has B R1)
        ;(at R cX) (at B c3)
    ))
)