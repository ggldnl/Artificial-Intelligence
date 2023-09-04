; Sussman anomaly problem
;
;                                                                 _______
;                                                                |       |
;                                                                |   A   |   
;               _______                                          |_______|
;              |       |                                         |       |
;              |   A   |                                         |   B   |
;       _______|_______|                                         |_______|
;      |       |       |                                         |       |
;      |   C   |   B   |                                         |   C   |
;      |       |       |                                         |       |
;   (((((((((((((((((((((((((((((((           ((((((((((((((((((((((((((((((  
;   (((((((((((((((((((((((((((((((           ((((((((((((((((((((((((((((((  
;                 INIT                                      GOAL

(define (domain block_world_domain)
    (:requirements :equality :negative-preconditions)
    (:predicates (on ?B ?O) (clear ?O) (table ?O) (block ?O))
    (:action putOn
        
        ; puts ?B1 on ?B2 from pos ?0
        :parameters (?B1 ?B2 ?O)
        :precondition (and 
            (clear ?B1) (clear ?B2) (on ?B1 ?O)
            
            ; objects predicates
            (block ?B1) (block ?B2)
            (not (= ?B1 ?O)) (not (= ?B1 ?O)) (not (= ?B1 ?B2))
        )
        :effect (and 
            (not (on ?B1 ?O))   ; ?B1 is no more on ?O
            (on ?B1 ?B2)        ; ?B1 is now on ?B2
            (not (clear ?B2))   ; ?B2 has ?B1 on top 
            (clear ?O)          ; ?O has nothing on top
        )
    )
    (:action putTable
        
        ; puts ?B1 onto the table ?T from ?B2
        :parameters (?B1 ?T ?B2)
        :precondition (and 
            (on ?B1 ?B2) (clear ?B1) (not (clear ?B2))

            ; objects predicates
            (block ?B1) (block ?B2) (table ?T)
            (not (= ?B1 ?B2)) ; (not (= ?B1 ?T)) (not (= ?B2 ?T))  since ?T is a table and ?B1/?B2 are blocks
        )
        :effect (and 
            (not (on ?B1 ?B2))  ; ?B1 is no more on ?B2
            (on ?B1 ?T)         ; ?B1 is on ?T
            (clear ?B2)         ; ?B2 is clear
        )
    )
)
