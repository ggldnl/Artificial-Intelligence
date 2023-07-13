(define (problem exam_problem)

    (:domain exam_domain)

    (:objects
        R
        c00 c01 c02
        c10 c11 c12
        c20 c21 c22
        M
        P
    )

    (:init
        (cell c00) (cell c01) (cell c02) 
        (cell c10) (cell c11) (cell c12) 
        (cell c20) (cell c21) (cell c22) 
        (adj c00 c01) (adj c00 c10) 
        (adj c01 c00) (adj c01 c02) (adj c01 c11) 
        (adj c02 c01) (adj c02 c12) 
        (adj c10 c00) (adj c10 c11) (adj c10 c20) 
        (adj c11 c01) (adj c11 c10) (adj c11 c12) (adj c11 c21) 
        (adj c12 c02) (adj c12 c11) (adj c12 c22) 
        (adj c20 c10) (adj c20 c21) 
        (adj c21 c11) (adj c21 c20) (adj c21 c22) 
        (adj c22 c12) (adj c22 c21)     

        (agent R) (at R c00) (free R)

        (mineral M) (at M c20)

        (wood c01 c02) (wood c02 c01)
        (wood c11 c12) (wood c12 c11)
        (wood c11 c21) (wood c21 c11)
        (wood c20 c21) (wood c21 c20)

        (pickaxe P) (at P c11)

        (exit c02)
    )
    (:goal (and
        ;(at R c02) (has R M)
        (exited R)
    ))
)