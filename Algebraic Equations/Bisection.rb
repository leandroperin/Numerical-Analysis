def function(x)
	return (Math::E**x)*(Math.sin(x)) - 1
end

accuracy = 10**-6
a = 0.0
b = 0.5
k = 0

while function(a) * function(b) > 0
	a = b;
	b += 0.5;
end

while (b-a).abs > accuracy
	x = (a+b) / 2
	
	if function(x) == 0
		break
	end
	
	if function(a) * function(x) < 0
		b = x
	else
		a = x
	end
	
	k += 1
end

puts "X = " + x.to_s
puts "K = " + k.to_s
