require_relative 'wektor.rb'
require 'narray'

#Coefficients

def Coefficients(i, j, tabX, tabY, pyramid)

  length = pyramid[i,j-1].coords.length
  
  #mnozymy przez Xj
  temp = Wektor.new(length) 
  temp.setVector(pyramid[i,j-1].coords) 
  #
  temp.MultiplyBy(tabX[j])
  pyramid[i,j].setVector(temp.coords)

  #odjęcie Pi,j-1 przesuniętego o 1 w prawo
  temp = Wektor.new(length) 
  temp.setVector(pyramid[i,j-1].coords) 
  #
  temp.shift_right!
  pyramid[i,j].Sub(temp)

  #dodanie Pi+1, j przesuniętego o 1 w prawo
  temp = Wektor.new(length) 
  temp.setVector(pyramid[i+1,j].coords) 
  #
  temp.shift_right!
  pyramid[i,j].Add(temp)

  #odjęcie Pi+1, j pomnożonego przez Xi
  temp = Wektor.new(length) 
  temp.setVector(pyramid[i+1,j].coords) 
  #
  temp.MultiplyBy(tabX[i])
  pyramid[i,j].Sub(temp)

  #podzielenie przez (Xj - Xi)
  pyramid[i,j].DivideBy(tabX[j] - tabX[i])

  return pyramid[i,j]
end

#CalculateResult 
def CalculatePolynomialResult(x,y,n)
  pyramid = NArray.object(n,n)

  for i in 0...n do
      for j in 0...n-i do
          if (j != i+j) then
              next
          end

          pyramid[j,j] = Wektor.new(n)
          pyramid[j,j].SetFirst(y[j])
      end
  end

  for i in 0...n do
      for j in 0...n-i do
          if (j == i+j) then
              next
          end

          pyramid[j,i+j] = Wektor.new(n)
          pyramid[j,i+j].setVector(Coefficients(j, i+j, x, y, pyramid).coords)
      end
  end

  return pyramid[0,n-1].coords

end