
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
    
end