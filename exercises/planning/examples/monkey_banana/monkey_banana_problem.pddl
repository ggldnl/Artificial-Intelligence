(define 
    (problem monkey_banana_problem)
    (:domain monkey_banana_domain)
    (:objects
        a b c m bo ba
    )
    (:init
        (location a) (location b) (location c) (monkey m) (box bo) (bananas ba)
        (at ba b) (above ba)
        (at m a) (below m)
        (at bo c)
        (not (having m ba))
    )
    (:goal (and 
            (having m ba)
            (at m ba)
        )
    )
)