if __name__ == '__main__':

	import argparse
	parser = argparse.ArgumentParser(
		prog='ProgramName',
		#description='What the program does',
		#epilog='Text at the bottom of help'
	)

	parser.add_argument('-r', '--rows', required=False, type=int, default=10)
	parser.add_argument('-c', '--cols', required=False, type=int, default=10)
	parser.add_argument('-d', '--generate_diagonals', required=False, action='store_true')
	parser.add_argument('-n', '--name', required=False, type=str, default='sq') # e.g. 'sq', 'c', ...

	# predicate for adjacency e.g. 'adj', 'adjacent', ... 
	parser.add_argument('-p', '--predicate', required=False, type=str, default='adj')

	# cell predicate e.g. 'cell', 'location', ...
	parser.add_argument('-cp', '--cell_predicate', required=False, type=str, default='cell')

	args = parser.parse_args()

	rows = args.rows
	cols = args.cols
	diagonal_adj = args.generate_diagonals
	name = args.name
	predicate = args.predicate
	cell_predicate = args.cell_predicate

	for i in range(rows):
		for j in range(cols):
			print(f'({cell_predicate} {name}{i}{j})', end=' ')
		print()

	for i in range(rows):
		for j in range(cols):

			for l in range(i - 1, i + 2):
				for m in range (j - 1, j + 2):

					# if valid cell (not outside the boundaries)
					if l >= 0 and l < rows and m >= 0 and m < cols and not (l == i and m == j):
						if diagonal_adj:
							print(f'({predicate} {name}{i}{j} {name}{l}{m})', end=' ')
						# if diagonal_adj is not enabled we need to further exclude some adjacency constraints
						else:
							if (abs(i - l) == 1) ^ (abs(j - m) == 1):
								print(f'({predicate} {name}{i}{j} {name}{l}{m})', end=' ')
							
			print()