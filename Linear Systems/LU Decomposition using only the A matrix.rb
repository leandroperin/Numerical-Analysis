require "matrix"
class Matrix
  def []=(i, j, x)
    @rows[i][j] = x
  end
end

A = Matrix[ [1, -1, 1], [2, 3, -1], [-3, 1, 1] ]
n = A.row_count()
b = [1, 4, -1]
y = Matrix.zero(1,n)
x = Matrix.zero(1,n)

for k in 1..n-1
	for i in k..n-1
		sum = 0
		for r in 1..k-1
			sum += A[i,r] * A[r,k]
		end
		A[i,k] = A[i,k] - sum
	end
	
	for j in k+1..n-1
		sum = 0
		for r in 1..k-1
			sum += A[k,r] * A[r,j]
		end
		A[k,j] = (A[k,j] - sum) / A[k,k]
	end
end

y[0,0] = b[0] / A[0,0]
for i in 1..n-1
	sum = 0
	for j in 0..i-1
		sum += A[i,j] * y[0,j]
	end
	y[0,i] = (b[i] - sum) / A[i,i]
end

x[0,n-1] = y[0,n-1]
for i in (n-2).downto(0)
	sum = 0
	for j in i+1..n-1
		sum += A[i,j] * x[0,j]
	end
	x[0,i] = y[0,i] - sum
end

puts x