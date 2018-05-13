' NOTE: You can use the "Rename" command on the context menu to change the class name "Service1" in both code and config file together.

Imports System.Collections.Generic
Imports System.Configuration
Imports System.Data.SqlClient

Public Class SaleService
    Implements ISaleService

    Public Function GetProduct(_productID As Integer) As Product Implements ISaleService.GetProduct

        ' Read the connection string from web.config
        Dim conStr As String = ConfigurationManager.ConnectionStrings("connectionString").ConnectionString
        Dim con As New SqlConnection(conStr)
        Try
            con.Open()
            Dim selectStatement As String = "select ProductName, QuantityPerUnit, UnitPrice from Products where ProductID=@ProductID"
            Dim selectCmd As New SqlCommand(selectStatement, con)
            selectCmd.Parameters.AddWithValue("@ProductID", _productID)
            Dim reader As SqlDataReader = selectCmd.ExecuteReader

            If reader.Read Then
                Dim myProduct As New Product

                myProduct._Name = reader("ProductName").ToString
                myProduct._QuantityPerUnit = reader("QuantityPerUnit").ToString
                myProduct._UnitPrice = CDec(reader("UnitPrice").ToString)


                Return myProduct
            End If

        Catch ex As SqlException

        Finally
            con.Close()
        End Try

        Return Nothing


    End Function

    Public Function ListProducts() As List(Of Product) Implements ISaleService.ListProducts

        ' Read the connection string from web.config
        Dim conStr As String = ConfigurationManager.ConnectionStrings("connectionString").ConnectionString
        Dim con As New SqlConnection(conStr)
        Dim _listProducts As New List(Of Product)
        Try
            con.Open()
            Dim selectStatement As String = "select ProductName, QuantityPerUnit, UnitPrice from Products"
            Dim selectCmd As New SqlCommand(selectStatement, con)

            Dim reader As SqlDataReader = selectCmd.ExecuteReader

            While reader.Read
                Dim myProduct As New Product

                myProduct._Name = reader("ProductName").ToString
                myProduct._QuantityPerUnit = reader("QuantityPerUnit").ToString
                myProduct._UnitPrice = CDec(reader("UnitPrice").ToString)



            End While

            Return _listProducts


        Catch ex As SqlException

        Finally
            con.Close()
        End Try

        Return Nothing
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
