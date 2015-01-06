#helper mający nam zwrócić latexa z wielomianem do wydruku
def VectorAsPolynomial(vector) do

result = ""

for i in vector.length-1...0
	if(vector[i] == 0)
		next

	if(a != vector.length-1 && wektor[a] > 0)
		result.concat(" +")
	elsif(a != vector.length-1 && vector[a] < 0)
		result.concat(" ")

	if(vector[a] == 1) do
		if(a>1)
			result.concat("x^{#{a}}")
		else
			result.concat("x")
	end

	else do
		if(a > 1)
			result.concat("{#{vector[a]}}x^{a}")
		else
			result.concat("{#{vector[a]}}x")
	end
end

if(result == "")
	result.concat(vector[0])

else
	result.concat(" +" + vector[0])

	return result

end

#helper mający zwrócić nam całkę latexowa 
def VectorAsIntegral()