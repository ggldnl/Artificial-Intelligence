(define 

    (problem museum_problem)
    
    (:domain museum_domain)

    (:objects
        MARRtino

        Bear    Wolf    Moose   Ostrich
        c00     c01     c02     c03
        c10     c11     c12     c13
        Rhino   Giraffe Cheetah Gorilla

        switch_0

        group_0 group_1 group_2
    )

    (:init

        (cell c00) (cell c01) (cell c02) (cell c03) 
        (cell c10) (cell c11) (cell c12) (cell c13) 

        (adj c00 c01) (adj c00 c10) 
        (adj c01 c00) (adj c01 c02)
        (adj c02 c01) (adj c02 c03) 
        (adj c03 c02) (adj c03 c13) 
        (adj c10 c00) (adj c10 c11) 
        (adj c11 c10) (adj c11 c12) 
        (adj c12 c11) (adj c12 c13) 
        (adj c13 c03) (adj c13 c12) 
        
        (agent MARRtino)
        (at MARRtino c10)

        (animal Bear) (animal Wolf) (animal Moose) (animal Ostrich)
        (animal Rhino) (animal Giraffe) (animal Cheetah) (animal Gorilla)

        (animal_in c00 Bear) (animal_in c01 Wolf) (animal_in c02 Moose) (animal_in c03 Ostrich)
        (animal_in c10 Rhino) (animal_in c11 Giraffe) (animal_in c12 Cheetah) (animal_in c13 Gorilla)

        (people group_0) (people group_1) (people group_2)
        (at group_0 c00) (at group_1 c02) (at group_2 c12)
        (not (served group_0)) (not (served group_1)) (not (served group_2))

        (wet c01)

        (switch switch_0)
        (off switch_0)
        (at switch_0 c11)
    )

    (:goal (and
        (on switch_0)
        (served group_0) (served group_1) (served group_2)
    ))
)