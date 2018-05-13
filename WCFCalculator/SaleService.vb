' NOTE: You can use the "Rename" command on the context menu to change the class name "Service1" in both code and config file together.
Public Class SaleService
    Implements ISaleService

    Public Function GetProduct(_productID As Integer) As Product Implements ISaleService.GetProduct
        Throw New NotImplementedException()
    End Function

    Public Function ListProducts() As List(Of Product) Implements ISaleService.ListProducts
        Throw New NotImplementedException()
    End Function

    Public Function ListInvoices() As List(Of Invoice) Implements ISaleService.ListInvoices
        Throw New NotImplementedException()
    End Function

    Public Function GetInvoice(_customerID As String) As Invoice Implements ISaleService.GetInvoice
        Throw New NotImplementedException()
    End Function

    Public Function CreateInvoice(_invoice As Invoice) As Boolean Implements ISaleService.CreateInvoice
        Throw New NotImplementedException()
    End Function

    Public Function GetCustomer(_customerID As String) As Customer Implements ISaleService.GetCustomer
        Throw New NotImplementedException()
    End Function
End Class
