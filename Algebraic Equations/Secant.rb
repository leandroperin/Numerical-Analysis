def f(x)
	return x**2 - 5
end

accuracy = 10**-6
x = 2.0
x0 = 0.0
k = 0

while f(x).abs > accuracy
	xk = x
	x = x - ((x - x0) * f(x)) / (f(x) - f(x0))
	x0 = xk
	
	k += 1
end

puts "X = " + x.to_s
puts "K = " + k.to_s + " iteractions"