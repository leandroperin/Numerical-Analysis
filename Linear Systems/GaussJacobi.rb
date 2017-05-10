require "matrix"

A = Matrix[ [3.0, -1.0, -1.0], [1.0, 3.0, 1.0], [2.0, -2.0, 4.0] ]
b = [1, 5, 4]

xi = [0, 0, 0]
x = [0, 0, 0]

diff = 1
accuracy = 10**-5

n = b.size()
counter = 0

while diff > accuracy
	for i in 0..n-1
		sum = 0
		for j in 0..n-1
			if j != i
				sum += A[i,j] * xi[j]
			end
		end
		x[i] = (b[i] - sum) / A[i,i]
	end
	diff = x.zip(xi).map { |x, y| (y - x).abs }.max
	xi = x.map do |e| e end
	counter += 1
end

puts "Counter: " + counter.to_s
puts "X: " + x.to_s