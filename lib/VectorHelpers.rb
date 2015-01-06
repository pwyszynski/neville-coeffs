require 'wektor.rb'
#helper mający nam zwrócić latexa z wielomianem do wydruku
def VectorAsPolynomial(vector)
  result = ""
  for i in vector.length-1...0 do

    if(vector[i] == 0)
      next
    end

    if(a != vector.length-1 && wektor[a] > 0)
      result.concat(" +")
    elsif(a != vector.length-1 && vector[a] < 0)
      result.concat(" ")
    end
    
    if(vector[a] == 1)

      if(a > 1)
        result.concat("x^{#{a}}")
      else
        result.concat("x")
      end
    else
      if(a > 1)
        result.concat("{#{vector[a]}}x^{a}")
      else
        result.concat("{#{vector[a]}}x")
      end
    end
  end


  if(result == "")
    result.concat(vector[0])
  else
    result.concat(" +" + vector[0])
  end
end