require_relative 'wektor.rb'
#Coefficients

def Coefficients(i, j, tabX, tabY, pyramid)
  #mnozymy przez Xj
  length = pyramid[i][j-1].coords.length

  temp = Wektor.new(length).set!(pyramid[i][j-1])
  temp*(tabX[j])
  pyramid[i][j].set!(temp)

  #odjęcie Pi,j-1 przesuniętego o 1 w prawo
  temp = Wektor.new(length).set!(pyramid[i][j-1])
  temp.shift_right!
  pyramid[i][j]-temp

  #dodanie Pi+1, j przesuniętego o 1 w prawo
  temp = Wektor.new(length).set!(pyramid[i+1][j])
  temp.shift_right!
  pyramid[i][j]+(temp)

  #odjęcie Pi+1, j pomnożonego przez Xi
  temp = Wektor.new(length).set!(pyramid[i+1][j])
  temp*(tabX[i])
  pyramid[i][j]-temp

  #podzielenie przez (Xj - Xi)
  pyramid[i][j]/(tabX[j] - tabX[i])

  return pyramid[i][j]
end

#CalculateResult 
def CalculatePolynomialResult(x,y,n)
  pyramid = Hash.new {|h,k| h[k] = Wektor.new(n)}

  for i in 0...n do
      for j in 0...n-i do
          if (j != i+j) then
              next
          end

          pyramid[j][j] = Wektor.new(n)
          pyramid[j][j].coords.push(y[j])
      end
  end

  for i in 0...n do
      for j in 0...n-i do
          if (j == i+j) then
              next
          end

          pyramid[j][i+j] = Wektor.new(n)
          Coefficients(j, i+j, x, y, pyramid)
      end
  end

  return pyramid[0][n-1].coords

end