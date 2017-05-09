def function(x)
	return (Math::E**x)*(Math.sin(x)) - 1
end

accuracy = 10**-6
a = 0.to_f
b = 1.to_f
k = 0

x = (a+b) / 2

if b-a >= accuracy	
	M = function(a)
	
	while (b-a) >= accuracy		
		if M*function(x) > 0
			a = x
		else
			b = x
		end
		
		x = (a+b) / 2

		k += 1
	end
end

puts "X = " + x.to_s
puts "K = " + k.to_s
