require 'wektor.rb'





puts "Podaj ilość węzłów:"
n = gets.chomp

X = Array.new(n)
Y = Array.new(n)
P = Hash.new {|h,k| h[k] = Wektor.new(n)}

for i in (0...n) do
	puts "Podaj x[#{i}]:"
	X[i] = gets.chomp.to_i

	puts "Podaj y[#{i}]:"
	Y[i] = gets.chomp.to_i
end

