' NOTE: You can use the "Rename" command on the context menu to change the class name "Service1" in both code and config file together.
Public Class CalculatorService
    Implements ICalcService

    Public Function Add(ByVal a As Decimal, ByVal b As Decimal) As Decimal Implements ICalcService.Add
        Return a + b
    End Function

    Public Function Subtract(ByVal a As Decimal, ByVal b As Decimal) As Decimal Implements ICalcService.Subtract
        Return a - b
    End Function

    Public Function Multiply(ByVal a As Decimal, ByVal b As Decimal) As Decimal Implements ICalcService.Multiply
        Return a * b
    End Function

    Public Function Divide(ByVal a As Decimal, ByVal b As Decimal) As Decimal Implements ICalcService.Divide
        Return a / b
    End Function

End Class
