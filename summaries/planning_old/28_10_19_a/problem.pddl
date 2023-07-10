(define (problem IT_problem)

	(:domain IT_domain)

	(:objects G C Ba Bo P0 P1 P2 P3 P4 P5 P6)

	(:init 
		(at G P0) (at C P6) (at Bo P0) (at Ba P6)
		(empty P1) (empty P2) (empty P3) (empty P4) (empty P5)
		(valid G P0) (valid G P1) (valid G P3)
		(valid C P1) (valid C P2) (valid C P4) (valid C P5) (valid C P6)
		(is_object Ba) (is_object Bo)
	)

	(:goal (and 
    		(at G P3) (at C P5) (at Bo P5) (at Ba P3)
	    )
	)
)