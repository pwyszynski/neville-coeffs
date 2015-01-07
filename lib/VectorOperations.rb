require_relative 'wektor.rb'
#Coefficients

def Coefficients(i, j, tabX, tabY, pyramid)
  #mnozymy przez Xj
  length = pyramid[i][j-1].coords.length

  temp = pyramid[i][j-1]
  temp*(tabX[j])
  pyramid[i][j].set!(temp)

  #odjęcie Pi,j-1 przesuniętego o 1 w prawo
  temp = pyramid[i][j-1]
  temp.shift_right!
  pyramid[i][j].Sub(temp)

  #dodanie Pi+1, j przesuniętego o 1 w prawo
  temp = pyramid[i+1][j]
  temp.shift_right!
  pyramid[i][j].Add(temp)

  #odjęcie Pi+1, j pomnożonego przez Xi
  temp = pyramid[i+1][j]
  temp.MultiplyBy(tabX[i])
  pyramid[i][j].Sub(temp)

  #podzielenie przez (Xj - Xi)
  pyramid[i][j].DivideBy(tabX[j] - tabX[i])

  return pyramid[i][j]
end

#CalculateResult 
def CalculatePolynomialResult(x,y,n)
  pyramid = Hash.new {|h,k| h[k] = Array.new(n)}

  for m in 0...n do
      for k in 0...n-m do
          if (k != m+k) then
              next
          end

          pyramid[k][k] = Wektor.new(n-1)
          pyramid[k][k].coords.push(y[k])
      end
  end

  for m in 0...n do
      for k in 0...n-m do
          if (k == m+k) then
              next
          end

          pyramid[k][m+k] = Wektor.new(n-1)
          Coefficients(k, m+k, x, y, pyramid)
      end
  end

  return pyramid[0][n-1].coords

end