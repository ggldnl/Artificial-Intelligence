
rows = 4
cols = 4
diagonal_adj = False

if __name__ == '__main__':

	for i in range(rows):
		for j in range(cols):

			for l in range(i - 1, i + 2):
				for m in range (j - 1, j + 2):

					# if valid cell (not outside the boundaries)
					if l >= 0 and l < rows and m >= 0 and m < cols and not (l == i and m == j):
						if diagonal_adj:
							print('(adj C%d%d C%d%d)' % (i + 1, j + 1, l + 1, m + 1), end=' ')
						# if diagonal_adj is not enabled we need to further exclude some adjacency constraints
						else:
							if not (abs(i - l) == 1 and abs(j - m) == 1):
								print('(adj C%d%d C%d%d)' % (i + 1, j + 1, l + 1, m + 1), end=' ')
							
			print()