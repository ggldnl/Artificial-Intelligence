; Monkey and banana problem
; The monkey-and-bananas problem is faced by a monkey in a laboratory with some bananas
; hanging out of reach from the ceiling. A box is available that will enable the monkey
; to reach the bananas if he climbs on it. There are three locations: A, B,C. Initially, 
; the monkey is at A, the bananas at B, and the box at C. The monkey and box have Low 
; height, but if the monkey climbs onto the box he will have High height. The bananas 
; initially have High height. The actions available to the monkey include "go" from one 
; place to another, "push" an object from one place to another, "climb" onto an object, 
; and "grasp" an object. The result of a "grasp" is that the monkey holds the object if 
; the monkey and object are in the same place at the same height. The goal of the monkey 
; is to hold the banana and return to location A.
;
;
;               Banana                                    Banana
;
;                                                         Monkey
;                       _______                           _______ 
;                      |       |                         |       |
;        Monkey        |  Box  |                         |  Box  |
;                      |_______|                         |_______|
;                                                                 
;          A       B       C                         A       B       C
;   (((((((((((((((((((((((((((((((           ((((((((((((((((((((((((((((((  
;   (((((((((((((((((((((((((((((((           ((((((((((((((((((((((((((((((  
;                 INIT                                      GOAL

(define (domain monkey_banana_domain)
    (:requirements :strips)
    (:predicates
        (at ?O ?L)          ; object ?O is at location ?L 
        (location ?O)    ; ?O is a location
        (monkey ?O)      ; ?O is a monkey
        (box ?O)         ; ?O is a box
        (above ?O)    ; ?O is at lvl 1 (above)
        (below ?O)    ; ?O is at lvl 0 (below)
        (having ?O ?W); ?O has ?W
    )
    (:action push
        ; make the monkey M move the box B from F to T
    
        :parameters (?B ?M ?F ?T)
        :precondition (and  
            (at ?M ?F) (at ?B ?F)
        
            ; objects validation
            (box ?B) (location ?F) (location ?T) (monkey ?M)
        )
        :effect (and 
            (at ?B ?T) 
            (at ?M ?T) 
            (not (at ?B ?F)) 
            (not (at ?M ?F))
        )
    )
    (:action move
        ; make the monkey ?M move from ?F to ?T
        
        :parameters (?M ?F ?T)
        :precondition (and 
            (at ?M ?F) (below ?M)

            ; objects validation
            (monkey ?M) (location ?F) (location ?T)
        )
        :effect (and 
            (at ?M ?T) (not (at ?M ?F))
        )
    )
    (:action climb
        ; make the monkey ?M climb the box B in location L

        :parameters (?B ?M ?L)
        :precondition (and 
            (below ?M) (at ?M ?L) (at ?B ?L)

            ; objects validation
            (monkey ?M) (box ?B) (location ?L) 
        )
        :effect (and
            (above ?M) (not (below ?M))
        )
    )
    (:action unclimb 
        ; opposite of climb

        :parameters (?B ?M ?L)
        :precondition (and 
            (above ?M) (at ?M ?L) (at ?B ?L)

            ; objects validation
            (monkey ?M) (box ?B) (location ?L) 
        )
        :effect (and
            (below ?M) (not (above ?M))
        )
    )
    (:action grasp
        :parameters (?M ?B ?L)
        :precondition (and 
            (at ?B ?L) (not (having ?M ?B)) (at ?M ?L)

            ;objects validation
            (monkey ?M) (location ?L) (bananas ?B)
        )
        :effect (and 
            (having ?M ?B)
        )
    )    
)