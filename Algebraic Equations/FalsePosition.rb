def f(x)
	return (Math::E**x) * (Math.sin(x)) - 1
end

accuracy = 10**-6
a = 0.0
b = 0.5
k = 0
x = 0.0

while f(a) * f(b) > 0
	a = b
	b += 0.5
end

while f(x).abs > accuracy
	x = a - (f(a) * (b - a)) / (f(b) - f(a))
	
	if f(x) == 0
		break
	end
	
	if f(a) * f(x) < 0
		b = x
	else
		a = x
	end
	
	k += 1
end

puts "X = " + x.to_s
puts "K = " + k.to_s