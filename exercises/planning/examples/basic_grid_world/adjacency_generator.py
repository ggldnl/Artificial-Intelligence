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

	args = parser.parse_args()

	rows = args.rows
	cols = args.cols
	diagonal_adj = args.generate_diagonals

	for i in range(rows):
		for j in range(cols):
			print(f'(cell sq{i}{j})', end=' ')
		print()

	for i in range(rows):
		for j in range(cols):

			for l in range(i - 1, i + 2):
				for m in range (j - 1, j + 2):

					# if valid cell (not outside the boundaries)
					if l >= 0 and l < rows and m >= 0 and m < cols and not (l == i and m == j):
						if diagonal_adj:
							print(f'(adj sq{i}{j} sq{l}{m})', end=' ')
						# if diagonal_adj is not enabled we need to further exclude some adjacency constraints
						else:
							if (abs(i - l) == 1) ^ (abs(j - m) == 1):
								print(f'(adj sq{i}{j} sq{l}{m})', end=' ')
							
			print()