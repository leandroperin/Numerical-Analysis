def function(x)
  return x**3 - 9*x + 3
end

a = 0.to_f
b = 1.to_f
k = 0
accuracy = 10**-6

if b-a < accuracy
  x = (a+b) / 2
elsif function(a).abs < accuracy
  x = a
elsif function(b).abs < accuracy
  x = b
else
  k = 1
  M = function(a)

  while 1
    x = (a*function(b) - b*function(a)) / (function(b) - function(a))

    if function(x).abs < accuracy
      break
    else
      if M*function(x) > 0
        a = x
      else
        b = x
      end

      if b-a < accuracy
        x = (a+b) / 2
        break
      end
    end

    k += 1
  end
end

puts "X = " + x.to_s
puts "K = " + k.to_s + " iterações"
