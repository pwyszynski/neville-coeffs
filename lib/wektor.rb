class Wektor
  attr_reader :coords

  def initialize(length)
    @coords = Array.new(length, 0)
  end

  def setVector(ary)
     	for i in (0...coords.size) do
  		@coords[i] = ary[i]
  		end

  		self
  end

  def DivideBy(number) 
  	for i in (0...coords.size) do
  		@coords[i] /= number
  		end

      self
  end

  def MultiplyBy(number) 
  	for i in (0...coords.size) do
  		@coords[i] *= number
  		end

      self
  end

  def Sub(wektorToSub) 
  	for i in (0...coords.size) do
  		@coords[i] -= wektorToSub.coords[i]
  		end

      self
  end

  def Add(wektorToAdd) 
  	for i in (0...coords.size) do
  		@coords[i] += wektorToAdd.coords[i]
  		end

      self
  end

  def SetFirst(number)
  	@coords[0] = number

    self
  end

  def shift_right!
  	self.coords.pop
  	self.coords.unshift(0)
  	
    self
  end



#Needs reworking for new vector.
  def VectorAsPolynomial
    vector = self.coords	
    result = ""
    result.clear

    a = vector.length-1

    while (a > 0) do

      if(vector[a] == 0)
      	a-=1
        next
      end

      if(a != vector.length-1 && vector[a] > 0)
        result.concat(" +")
      elsif(a != vector.length-1 && vector[a] < 0)
        result.concat(" ")
      end
      
      if(vector[a] == 1)

        if(a > 1)
          result.concat("x^#{a}")
        else
          result.concat("x")
        end
      else
        if(a > 1)
          result.concat("#{vector[a]}x^#{a}")
        else
          result.concat("#{vector[a]}x")
        end
      end

      a -= 1
    end


    if(result.empty?)
      result.concat("#{vector[0]}")
    elsif(vector[0] != 0)
      result.concat(" +#{vector[0]}")
    end
    return result
  end	

end