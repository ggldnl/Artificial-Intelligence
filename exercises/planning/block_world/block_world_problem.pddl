(define
    (problem block_world_problem)
    (:domain block_world_domain)
    (:objects
        A B C T
    )
    (:init
        (on A B) (on B T) (on C T)
        (block A) (block B) (block C)
        (table T)
        (clear A) (clear C)
    )
    (:goal
        (and (on A B) (on B C) (on C T))
    )
)