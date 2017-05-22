a = [1, 2]
b = [2, 1]
c = [2, 1]
f = [5, 9]

n = f.size()

v = Array.new(n) {0}
y = Array.new(n) {0}

w = a[0]
y[0] = f[0] / w

for i in 1..n-1
	v[i-1] = c[i-1]/w
	w = a[i] - b[i]*v[i-1]
	y[i] = (f[i]-b[i]*y[i-1])/w
end
for j in (n-2).downto(0)
	y[j] -= v[j]*y[j+1]
end

puts y.to_s