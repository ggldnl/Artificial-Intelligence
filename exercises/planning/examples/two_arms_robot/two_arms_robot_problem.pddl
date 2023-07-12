(define (problem two_arms_robot_problem) 
    (:domain two_arms_robot_domain)
    (:objects 
        agent1
        room1 room2 room3 room4 ; suppose they are one after the other
        b1 b2 b3 b4 b5 b6 b7
        gripper_left_1 gripper_right_1


        ; add another agent
        agent2
        gripper_left_2 gripper_right_2

    )

    (:init
        (location room1) (location room2) (location room3) (location room4)
        (ball b1) (ball b2) (ball b3) (ball b4) (ball b5) (ball b6) (ball b7)
        (at b1 room1) (at b2 room1) (at b3 room1) (at b4 room1)
        (at b5 room1) (at b6 room1) (at b7 room1)
        (adj room1 room2) (adj room2 room3) (adj room3 room4)
        (adj room2 room1) (adj room3 room2) (adj room4 room3)

        (agent agent1)
        (gripper gripper_left_1) (gripper gripper_right_1)
        (has_gripper agent1 gripper_left_1) (has_gripper agent1 gripper_right_1)
        (free gripper_left_1) (free gripper_right_1)
        (at agent1 room1)

        ; second agent
        (agent agent2)
        (gripper gripper_left_2) (gripper gripper_right_2)
        (has_gripper agent2 gripper_left_2) (has_gripper agent2 gripper_right_2)
        (free gripper_left_2) (free gripper_right_2)
        (at agent2 room1)
    )

    (:goal (and
        
        (at b1 room4) (at b2 room4) (at b3 room4) (at b4 room4)
        (at b5 room4) (at b6 room4) (at b7 room4)
    ))
)
