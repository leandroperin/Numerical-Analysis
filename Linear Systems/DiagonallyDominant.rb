require "matrix"

def isDiagonallyDominant(matrix)
	n = matrix.row_size()
	isDominant = false
	for i in 0..n-1
		sum = 0
		for j in 0..n-1
			if j != i
				sum += matrix[i,j]
			end
		end
		if sum > A[i,i].abs
			return false
		end
		if sum < A[i,i].abs
			isDominant = true
		end
	end
	return isDominant
end