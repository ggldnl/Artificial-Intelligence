; There is a robot that can move between two rooms and pick up 
; or drop balls with either of his two arms. Initially, all 
; balls and the robot are in the first room. We want the 
; balls to be in the second room.

(define 
    (domain two_arms_robot_domain)
    (:requirements :strips)
    (:predicates
        (agent ?object)
        (location ?object)
        (ball ?object)
        (gripper ?object)
        (at ?object ?where)
        (free ?gripper)
        (carry ?gripper ?what)
        (has_gripper ?agent ?gripper)
        
        ; I want to implement a variation of the problem
        ; in which there are multiple rooms and the robot
        ; an only move one room at a time to an adjacent room
        (adj ?loc1 ?loc2)
    )
    (:action move
        :parameters (?agent ?from ?to)
        :precondition (and
            (at ?agent ?from)
            (adj ?from ?to)

            ; objects validation 
            (agent ?agent) (location ?from) (location ?to)
        )
        :effect (and 
            (at ?agent ?to) (not (at ?agent ?from))
        )
    )
    (:action pick
        :parameters (?agent ?what ?gripper ?where)
        :precondition (and 

            ; does the gripper belongs to the agent?
            ; if we go multi-agent we can have multiple grippers 
            ; but it does not make sense that an agent picks
            ; something with a gripper that does not belong to it.
            (has_gripper ?agent ?gripper)
            (at ?agent ?where)
            (at ?what ?where)
            (free ?gripper)

            ; objects validation
            (agent ?agent) (location ?where) (ball ?what)
            (gripper ?gripper)
        )
        :effect (and 
            (not (free ?gripper))
            (not (at ?what ?where))
            (carry ?gripper ?what)
        )
    )
    (:action drop
        :parameters (?agent ?gripper ?what ?where)
        :precondition (and 
            (at ?agent ?where) (not (free ?gripper))
            (carry ?gripper ?what)
            (has_gripper ?agent ?gripper)
        
            ; objects validation
            (agent ?agent) (location ?where) (ball ?what)
            (gripper ?gripper)
        )
        :effect (and 
            (at ?what ?where) (free ?gripper) (not (carry ?gripper ?what))
        )
    )   
)