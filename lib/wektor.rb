class Wektor
  attr_reader :coords

  def initialize(length)
    @coords = Array.new(length, 0)
  end

  def setVector(ary)
     	for i in (0...coords.size) do
  		@coords[i] = ary[i]
  		end
  end

  def DivideBy(number) 
  	for i in (0...coords.size) do
  		@coords[i] /= number
  		end
  end

  def MultiplyBy(number) 
  	for i in (0...coords.size) do
  		@coords[i] *= number
  		end
  end

  def Sub(wektorToSub) 
  	for i in (0...coords.size) do
  		@coords[i] -= wektorToSub.coords[i]
  		end
  end

  def Add(wektorToAdd) 
  	for i in (0...coords.size) do
  		@coords[i] += wektorToAdd.coords[i]
  		end
  end

  def SetFirst(number)
  	@coords[0] = number
  end

  def shift_right
      	for i in (coords.size-1...0) do
  		@coords[i] += wektorToAdd.coords[i]
  		end
  		@coords[0] = 0
  end

#Needs reworking for new vector.
# def VectorAsPolynomial
#   vector = self	
#   result = ""

#   #COUNTER LOOP FOR TESTING: FIX ME
#   a = 2

#   while (a > 0) do

#     if(vector[a] == 0)
#       next
#     end

#     if(a != vector.length-1 && vector[a] > 0)
#       result.concat(" +")
#     elsif(a != vector.length-1 && vector[a] < 0)
#       result.concat(" ")
#     end
    
#     if(vector[a] == 1)

#       if(a > 1)
#         result.concat("x^#{a}")
#       else
#         result.concat("x")
#       end
#     else
#       if(a > 1)
#         result.concat("#{vector[a]}x^#{a}")
#       else
#         result.concat("#{vector[a]}x")
#       end
#     end

#     a -= 1
#   end


#   if(result == "")
#     result.concat(vector[0])
#   else
#     result.concat(" +#{vector[0]}")
#   end
#   return result
# end	

end