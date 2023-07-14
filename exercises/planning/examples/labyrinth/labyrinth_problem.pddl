(define (problem labyrinth_problem)

    (:domain labyrinth_doain)

    (:objects
        c00 c01 c02 c03
        c10 c11 c12 c13
        c20 c21 c22 c23
        c30 c31 c32 c33

        A
    )

    (:init
        (cell c00) (cell c01) (cell c02) (cell c03) 
        (cell c10) (cell c11) (cell c12) (cell c13) 
        (cell c20) (cell c21) (cell c22) (cell c23) 
        (cell c30) (cell c31) (cell c32) (cell c33) 
        
        (adj c00 c01) (adj c00 c10) 
        (adj c01 c00) (adj c01 c02) (adj c01 c11) 
        (adj c02 c01) (adj c02 c03) (adj c02 c12) 
        (adj c03 c02) (adj c03 c13) 
        (adj c10 c00) (adj c10 c11) (adj c10 c20) 
        (adj c11 c01) (adj c11 c10) (adj c11 c12) (adj c11 c21) 
        (adj c12 c02) (adj c12 c11) (adj c12 c13) (adj c12 c22) 
        (adj c13 c03) (adj c13 c12) (adj c13 c23) 
        (adj c20 c10) (adj c20 c21) (adj c20 c30) 
        (adj c21 c11) (adj c21 c20) (adj c21 c22) (adj c21 c31) 
        (adj c22 c12) (adj c22 c21) (adj c22 c23) (adj c22 c32) 
        (adj c23 c13) (adj c23 c22) (adj c23 c33) 
        (adj c30 c20) (adj c30 c31) 
        (adj c31 c21) (adj c31 c30) (adj c31 c32) 
        (adj c32 c22) (adj c32 c31) (adj c32 c33) 
        (adj c33 c23) (adj c33 c32) 

        (wall c11) (wall c12) (wall c02) (wall c22)
    
        (at A c20)
        (agent A)
    )

    (:goal (and
        (at A c23)
    ))
)