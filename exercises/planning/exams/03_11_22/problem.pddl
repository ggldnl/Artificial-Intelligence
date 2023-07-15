(define (problem exam_problem)

    (:domain exam_domain)

    (:objects
        t0
        c0
        p0 p1
        base w00 w01 w10
    )

    (:init 

        (location w00) (location w01) 
        (location w10) (location base) 
        (adj w00 w01) (adj w00 w10) (adj w00 base) 
        (adj w01 w00) (adj w01 w10) (adj w01 base) 
        (adj w10 w00) (adj w10 w01) (adj w10 base) 
        (adj base w00) (adj base w01) (adj base w10)

        (truck t0) (at t0 base)
        (crate c0) (at c0 w00)
        (package p0) (at p0 w00)
        (package p1) (at p1 w10)

        (secured t0) ; truck is secured if it is either empty or carrying a crate
    )

    (:goal (and  
        (at t0 w00)
        ;(has c0 p0) (has c0 p1) (at c0 w01)
        (has c0 p0) (has c0 p1) (at c0 w01)
    ))
)