(define 
    (problem shakeys_world_problem) 
    (:domain shakeys_world_domain)
    (:objects 
        shakey corridor room1 room2 box1 box2
    )

    (:init
        (location room1) (location room2) (location corridor)
        (box box1) (box box2)
        (agent shakey)
        (floor shakey) (floor box1) (floor box2)
        (at shakey room1) (at box1 room2) (at box2 room2)
        (adj room1 corridor) (adj corridor room2)
        (adj corridor room1) (adj room2 corridor)
    )

    (:goal (and
        (at box1 room1)
        (on shakey box1)
        (at box2 room1)
    ))
)
