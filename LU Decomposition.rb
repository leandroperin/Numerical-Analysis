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

L = Matrix.zero(n)
U = Matrix.zero(n)

for k in 0..n-1
	for i in k..n-1
		sum = 0
		for r in 1..k-1
			sum += L[i,r] * U[r,k]
		end
		L[i,k] = A[i,k] - sum
	end
	
	U[k,k] = 1
	for j in k+1..n-1
		sum = 0
		for r in 1..k-1
			sum += L[k,r] * U[r,j]
		end
		U[k,j] = (A[k,j] - sum) / L[k,k]
	end
end

y[0,0] = b[0] / L[0,0]
for i in 1..n-1
	sum = 0
	for j in 0..i-1
		sum += L[i,j] * y[0,j]
	end
	y[0,i] = (b[i] - sum) / L[i,i]
end

x[0,n-1] = y[0,n-1]
for i in (n-2).downto(0)
	sum = 0
	for j in i+1..n-1
		sum += U[i,j] * x[0,j]
	end
	x[0,i] = y[0,i] - sum
end

puts x