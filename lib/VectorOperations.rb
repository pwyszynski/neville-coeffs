
#Coefficients
class WektorOperations

  def Coefficients(i, j, tabX, tabY, pyramid)
    #mnozymy przez Xj
    temp = Wektor.new(pyramid[i,j-1].Coordinates)#TO JEST POJEBANE
    temp.MultiplyBy(tabX[j])
    pyramid[i,j].SetVector(temp.Coordinates)

    #odjęcie Pi,j-1 przesuniętego o 1 w prawo
    temp = Wektor.new(pyramid[i,j-1].Coordinates)
    temp.ShiftRight
    pyramid[i,j].Sub(temp)

    #dodanie Pi+1, j przesuniętego o 1 w prawo
    temp = Wektor.new(pyramid[i+1,j].Coordinates)
    temp.ShiftRight
    pyramid[i,j].Add(temp)

    #odjęcie Pi+1, j pomnożonego przez Xi
    temp = Wektor.new(pyramid[i+1,j].Coordinates)
    temp.MultiplyBy(tabX[i])
    pyramid[i,j].Sub(temp)

    #podzielenie przez (Xj - Xi)
    pyramid[i,j].DivideBy(tabX[j] - tabX[i])
  end

#CalculateResult 