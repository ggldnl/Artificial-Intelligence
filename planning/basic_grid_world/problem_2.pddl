(define (problem basic_grid_problem)
	
	(:domain  basic_grid_domain)
	
	(:objects 
		sq00 sq01 sq02 sq03 sq04 sq05 sq06 sq07 sq08 sq09
		sq10 sq11 sq12 sq13 sq14 sq15 sq16 sq17 sq18 sq19	
		sq20 sq21 sq22 sq23 sq24 sq25 sq26 sq27 sq28 sq29
		sq30 sq31 sq32 sq33 sq34 sq35 sq36 sq37 sq38 sq39	
		sq40 sq41 sq42 sq43 sq44 sq45 sq46 sq47 sq48 sq49
		sq50 sq51 sq52 sq53 sq54 sq55 sq56 sq57 sq58 sq59	
		sq60 sq61 sq62 sq63 sq64 sq65 sq66 sq67 sq68 sq69
		sq70 sq71 sq72 sq73 sq74 sq75 sq76 sq77 sq78 sq79	
		sq80 sq81 sq82 sq83 sq84 sq85 sq86 sq87 sq88 sq89
		sq90 sq91 sq92 sq93 sq94 sq95 sq96 sq97 sq98 sq99	
	)

	(:init
		; adjacency (diagonal is enabled)
		(adj sq00 sq01) (adj sq00 sq10) (adj sq00 sq11) 
		(adj sq01 sq00) (adj sq01 sq02) (adj sq01 sq10) (adj sq01 sq11) (adj sq01 sq12) 
		(adj sq02 sq01) (adj sq02 sq03) (adj sq02 sq11) (adj sq02 sq12) (adj sq02 sq13) 
		(adj sq03 sq02) (adj sq03 sq12) (adj sq03 sq13) 
		(adj sq10 sq00) (adj sq10 sq01) (adj sq10 sq11) (adj sq10 sq20) (adj sq10 sq21) 
		(adj sq11 sq00) (adj sq11 sq01) (adj sq11 sq02) (adj sq11 sq10) (adj sq11 sq12) (adj sq11 sq20) (adj sq11 sq21) (adj sq11 sq22) 
		(adj sq12 sq01) (adj sq12 sq02) (adj sq12 sq03) (adj sq12 sq11) (adj sq12 sq13) (adj sq12 sq21) (adj sq12 sq22) (adj sq12 sq23) 
		(adj sq13 sq02) (adj sq13 sq03) (adj sq13 sq12) (adj sq13 sq22) (adj sq13 sq23) 
		(adj sq20 sq10) (adj sq20 sq11) (adj sq20 sq21) (adj sq20 sq30) (adj sq20 sq31) 
		(adj sq21 sq10) (adj sq21 sq11) (adj sq21 sq12) (adj sq21 sq20) (adj sq21 sq22) (adj sq21 sq30) (adj sq21 sq31) (adj sq21 sq32) 
		(adj sq22 sq11) (adj sq22 sq12) (adj sq22 sq13) (adj sq22 sq21) (adj sq22 sq23) (adj sq22 sq31) (adj sq22 sq32) (adj sq22 sq33) 
		(adj sq23 sq12) (adj sq23 sq13) (adj sq23 sq22) (adj sq23 sq32) (adj sq23 sq33) 
		(adj sq30 sq20) (adj sq30 sq21) (adj sq30 sq31) 
		(adj sq31 sq20) (adj sq31 sq21) (adj sq31 sq22) (adj sq31 sq30) (adj sq31 sq32) 
		(adj sq32 sq21) (adj sq32 sq22) (adj sq32 sq23) (adj sq32 sq31) (adj sq32 sq33) 
		(adj sq33 sq22) (adj sq33 sq23) (adj sq33 sq32)

		; adjacency (diagonal is not enabled)
		; (adj sq00 sq01) (adj sq00 sq10) 
		; (adj sq01 sq00) (adj sq01 sq02) (adj sq01 sq11) 
		; (adj sq02 sq01) (adj sq02 sq03) (adj sq02 sq12) 
		; (adj sq03 sq02) (adj sq03 sq13) 
		; (adj sq10 sq00) (adj sq10 sq11) (adj sq10 sq20) 
		; (adj sq11 sq01) (adj sq11 sq10) (adj sq11 sq12) (adj sq11 sq21) 
		; (adj sq12 sq02) (adj sq12 sq11) (adj sq12 sq13) (adj sq12 sq22) 
		; (adj sq13 sq03) (adj sq13 sq12) (adj sq13 sq23) 
		; (adj sq20 sq10) (adj sq20 sq21) (adj sq20 sq30) 
		; (adj sq21 sq11) (adj sq21 sq20) (adj sq21 sq22) (adj sq21 sq31) 
		; (adj sq22 sq12) (adj sq22 sq21) (adj sq22 sq23) (adj sq22 sq32) 
		; (adj sq23 sq13) (adj sq23 sq22) (adj sq23 sq33) 
		; (adj sq30 sq20) (adj sq30 sq31) 
		; (adj sq31 sq21) (adj sq31 sq30) (adj sq31 sq32) 
		; (adj sq32 sq22) (adj sq32 sq31) (adj sq32 sq33) 
		; (adj sq33 sq23) (adj sq33 sq32) 

		; obs and agent
		(obs sq23) (obs sq33) (obs sq43) (obs sq53)
		(obs sq65) (obs sq66)
		(obs sq08) (obs sq18) (obs sq28) (obs sq38)
		(at sq31)
	)

	(:goal (and (at sq09)))
)