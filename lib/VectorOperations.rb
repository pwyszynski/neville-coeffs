
#Coefficients
class WektorOperations

  def Coefficients(i, j, tabX, tabY, pyramid)
    #mnozymy przez Xj
    temp = pyramid[i][j-1]
    temp.MultiplyBy(tabX[j])
    pyramid[i][j].SetVector(temp)

    #odjęcie Pi,j-1 przesuniętego o 1 w prawo
    temp = pyramid[i][j-1]
    temp.ShiftRight
    pyramid[i][j].Sub(temp)

    #dodanie Pi+1, j przesuniętego o 1 w prawo
    temp = pyramid[i+1][j]
    temp.ShiftRight
    pyramid[i][j].Add(temp)

    #odjęcie Pi+1, j pomnożonego przez Xi
    temp = pyramid[i+1][j]
    temp.MultiplyBy(tabX[i])
    pyramid[i][j].Sub(temp)

    #podzielenie przez (Xj - Xi)
    pyramid[i][j].DivideBy(tabX[j] - tabX[i])
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
            pyramid[j][j] = y[j]
        end
    end

    for i in 0...n do
        for j in 0...n-i do
            if (j == i+1) then
                next
            end

            pyramid[j][i+j] = Wektor.new(n)
            Coefficients(j, i+j, x, y, pyramid)
        end
    end

    return pyramid[0][n-1]

  end
    
end