(define (problem one_arm_problem)

	(:domain one_arm_domain)

	(:objects b1 b2 g1 r1 p1 p2 p3 p4 p5 p6)

	(:init
		(is_cup b1) (is_cup b2) (is_cup g1) (is_cup r1)
		(is_pos p1) (is_pos p2) (is_pos p3) (is_pos p4) (is_pos p5) (is_pos p6)

		; e, b2, r1, e (e stands for empy)
		(empty p1)
		(at b2 p2)
		(at r1 p3)
		(empty p4)

		; b1, g1 are in the temporary storage slots
		(at b1 p5)
		(at g1 p6)
	)

	(:goal (and
		; b1, b2, g1, r1, e, e	
		(at b1 p1)
		(at b2 p2)
		(at g1 p3)
		(at r1 p4)
		(empty p5)
		(empty p6)
	))
)