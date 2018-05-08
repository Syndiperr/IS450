Imports CalculatorServiceProxy

Partial Class _Default
    Inherits System.Web.UI.Page

    ' This function tests if the value in the TextBox is a decimal number. 
    ' Please note that the TextBox object is passed to this procedure rather than a value.
    Private Function IsDecimal(ByVal input As HtmlInputText, ByVal controlName As String) As Boolean
        If IsNumeric(input.Value) Then
            Return True
        Else
            input.Focus()
            MsgBox(controlName & " must be numeric.")
            Return False
        End If
    End Function

    Protected Sub btnCalculate_Click(sender As Object, e As EventArgs) Handles btnCalculate.Click
        Dim calcProxy As New CalculatorServiceProxy.CalcServiceClient()

        If IsDecimal(txtOperandA, "Operand A") AndAlso IsDecimal(txtOperandB, "Operand B") Then
            Dim a As Decimal = CDec(txtOperandA.Value)
            Dim b As Decimal = CDec(txtOperandB.Value)

            Select Case drpOperators.SelectedItem.Value
                Case "+"
                    lblValue.Text = calcProxy.Add(a, b)
                Case "-"
                    lblValue.Text = calcProxy.Subtract(a, b)
                Case "*"
                    lblValue.Text = calcProxy.Multiply(a, b)
                Case "/"
                    lblValue.Text = calcProxy.Divide(a, b)
                Case Else
                    MsgBox("There was an error with the " & drpOperators.SelectedItem.Value + " operator. Please reload the page and try again.")
            End Select
        End If
    End Sub
End Class
