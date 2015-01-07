class Wektor
  attr_accessor :coords

  def initialize(length)
    @coords = Array.new(length, 0)
  end

  def set!(w)
    @coords = w.dup

    self
  end

  def DivideBy(number) 
  	for i in (0...@coords.length) do
  		@coords[i] /= number
  		end
  end

  def MultiplyBy(number) 
  	for i in (0...@coords.length) do
  		@coords[i] *= number
  		end
  end

  def Sub(wektorToSub) 
  	for i in (0...@coords.length) do
  		@coords[i] -= wektorToSub.coords[i]
  		end
  end

  def Add(wektorToAdd) 
  	for i in (0...@coords.length) do
  		@coords[i] += wektorToAdd.coords[i]
  		end
  end

  def shift_right!
    coords.rotate!
    coords[0] = 0

    self
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