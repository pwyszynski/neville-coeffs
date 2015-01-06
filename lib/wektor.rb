
class Wektor < Array
	attr_accessor :coordinatesAmount

	def initialize(length)
		super(length, 0)
		@coordinatesAmount = length
	end

	def SetVector(w)
			for i in (0...coordinatesAmount) do
				self[i] = w[i]
			end
			return self
	end

	def MultiplyBy(n)
		for i in (0...coordinatesAmount) do
			self[i] *= n			
		end
		return self
	end

	def DivideBy(n)
		for i in (0...coordinatesAmount) do
			self[i] /= n
		end
		return self
	end

	def Sub(w)
		for i in (0...coordinatesAmount) do
			self[i] -= w[i]
		end
		return self
	end

	def Add(w)
		for i in (0...coordinatesAmount) do
			self[i] += w[i]
		end
		return self
	end

	def ShiftRight
		coordinatesAmount.downto(1) { |i|
			self[i-1] = self[i-2]
		}
		self[0] = 0
		return self
	end

def VectorAsPolynomial
  vector = self	
  result = ""
  for a in vector.length-1..0 do

    if(vector[a] == 0)
      next
    end

    if(a != vector.length-1 && vector[a] > 0)
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
        result.concat("{#{vector[a]}}x^{}")
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
  return result
end	
end