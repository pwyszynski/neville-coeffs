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


	
end