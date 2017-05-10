require_relative "DiagonallyDominant"

A = Matrix[ [3.0, -1.0, -1.0], [1.0, 3.0, 1.0], [2.0, -2.0, 4.0] ]
b = [1, 5, 4]

xi = [0, 0, 0]
x = [0, 0, 0]

diff = 1
accuracy = 10**-5

n = b.size()
counter = 0

relaxation = 0.88

if isDiagonallyDominant(A)
	while diff > accuracy
		x_aux = x.map do |e| e end
		for i in 0..n-1
			sum = 0
			for j in 0..n-1
				if j != i
					sum += A[i,j] * xi[j]
				end
			end
			x[i] = relaxation*(b[i] - sum)/A[i,i] + xi[i]*(1-relaxation).abs
			xi[i] = x[i]
		end
		diff = x.zip(x_aux).map { |x, y| (y - x).abs }.max
		x_aux = x.map do |e| e end
		counter += 1
	end
end

puts "Counter: " + counter.to_s
puts "X: " + x.to_s