def f(x)
	return Math::E**x - x - 1
end

def fd(x)
	return Math::E**x - 1
end

accuracy = 10**-6
x = 1.0
k = 0

while f(x).abs > accuracy
	x = x - f(x) / fd(x)
	
	k += 1
end

puts "X = " + x.to_s
puts "K = " + k.to_s + " iteractions"