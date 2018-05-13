' NOTE: You can use the "Rename" command on the context menu to change the class name "Service1" in both code and config file together.

Imports System.Collections.Generic
Imports System.Configuration
Imports System.Data.SqlClient
Imports System

Public Class SaleService
    Implements ISaleService

    Public Function GetProduct(_productID As Integer) As Product Implements ISaleService.GetProduct

        ' Read the connection string from web.config
        Dim conStr As String = ConfigurationManager.ConnectionStrings("connectionString").ConnectionString
        Dim con As New SqlConnection(conStr)
        Dim myProduct As Product = Nothing
        Try
            con.Open()
            Dim selectStatement As String = "select * from Products where ProductID=@ProductID"
            Dim selectCmd As New SqlCommand(selectStatement, con)
            selectCmd.Parameters.AddWithValue("@ProductID", _productID)

            Dim reader As SqlDataReader = selectCmd.ExecuteReader
            If reader.Read Then
                myProduct = New Product With {
                    ._Name = reader("ProductName").ToString,
                    ._QuantityPerUnit = reader("QuantityPerUnit").ToString,
                    ._UnitPrice = CDec(reader("UnitPrice").ToString)
                }
            End If

        Catch ex As SqlException
            MsgBox(ex.Message)
        Finally
            con.Close()
        End Try

        Return myProduct

    End Function

    Public Function ListProducts() As List(Of Product) Implements ISaleService.ListProducts

        ' Read the connection string from web.config
        Dim conStr As String = ConfigurationManager.ConnectionStrings("connectionString").ConnectionString
        Dim con As New SqlConnection(conStr)
        Dim _listProducts As New List(Of Product)
        Try
            con.Open()
            Dim selectStatement As String = "select * from Products"
            Dim selectCmd As New SqlCommand(selectStatement, con)

            Dim reader As SqlDataReader = selectCmd.ExecuteReader
            While reader.Read
                _listProducts.Add(New Product With {
                    ._Name = reader("ProductName").ToString,
                    ._QuantityPerUnit = reader("QuantityPerUnit").ToString,
                    ._UnitPrice = CDec(reader("UnitPrice").ToString)
                })
            End While
        Catch ex As SqlException
            MsgBox(ex.Message)
        Finally
            con.Close()
        End Try

        Return _listProducts

    End Function

    Public Function ListInvoices(ByVal _customerID As String) As List(Of Invoice) Implements ISaleService.ListInvoices

        Dim invoices As New List(Of Invoice)
        Dim connection As New SqlConnection(ConfigurationManager.ConnectionStrings("connectionString").ConnectionString)
        Try
            connection.Open()
            Dim selectCmd As New SqlCommand("SELECT * FROM Invoices WHERE CustomerID=@customerID ORDER BY InvoiceID DESC", connection)
            selectCmd.Parameters.AddWithValue("@customerID", _customerID)

            Dim reader As SqlDataReader = selectCmd.ExecuteReader

            While reader.Read
                invoices.Add(New Invoice With {
                    ._ID = CInt(reader("InvoiceID")),
                    ._CustomerID = CInt(reader("CustomerID")),
                    ._CompanyName = reader("CustomerName"),
                    ._ProductCost = CDec(reader("ProductCost")),
                    ._ShippingCost = CDec(reader("ShippingCost")),
                    ._Tax = CDec(reader("Tax")),
                    ._CreationDate = CDate(reader("InvoiceDate"))
                })
            End While
        Catch ex As Exception
            MsgBox(ex.Message)
        Finally
            connection.Close()
        End Try

        Return invoices

    End Function

    Public Function GetInvoice(_customerID As String) As Invoice Implements ISaleService.GetInvoice

        Dim invoice As Invoice = Nothing
        Dim connection As New SqlConnection(ConfigurationManager.ConnectionStrings("connectionString").ConnectionString)
        Try
            connection.Open()
            Dim selectCmd As New SqlCommand("SELECT * FROM Invoices WHERE CustomerID=@ID", connection)
            selectCmd.Parameters.AddWithValue("@ID", _customerID)

            Dim reader As SqlDataReader = selectCmd.ExecuteReader
            If reader.Read Then
                invoice = New Invoice With {
                    ._ID = CInt(reader("InvoiceID")),
                    ._CustomerID = CInt(reader("CustomerID")),
                    ._CompanyName = reader("CustomerName"),
                    ._ProductCost = CDec(reader("ProductCost")),
                    ._ShippingCost = CDec(reader("ShippingCost")),
                    ._Tax = CDec(reader("Tax")),
                    ._CreationDate = CDate(reader("InvoiceDate"))
                }
            End If
        Catch ex As Exception
            MsgBox(ex.Message)
        Finally
            connection.Close()
        End Try

        Return invoice

    End Function

    Public Function CreateInvoice(_invoice As Invoice) As Boolean Implements ISaleService.CreateInvoice
        Dim connection As New SqlConnection(ConfigurationManager.ConnectionStrings("connectionString").ConnectionString)
        Dim insertInvoice As Boolean = False
        Try
            Dim insertCols As String = "(OrderID, ProductCost, ShippingCost, Tax, CustomerID, CustomerName, InvoiceDate)"
            Dim insertCmd As New SqlCommand("INSERT INTO Invoices " & insertCols & " VALUES (0, @product, @shipping, @tax, @customer, @name, @date)", connection)

            insertCmd.Parameters.AddWithValue("@product", _invoice._ProductCost)
            insertCmd.Parameters.AddWithValue("@shipping", _invoice._ShippingCost)
            insertCmd.Parameters.AddWithValue("@tax", _invoice._Tax)
            insertCmd.Parameters.AddWithValue("@customer", _invoice._CustomerID)
            insertCmd.Parameters.AddWithValue("@name", _invoice._CompanyName)
            insertCmd.Parameters.AddWithValue("@Date", _invoice._CreationDate)

            insertInvoice = If(insertCmd.ExecuteNonQuery() = 1, True, False)
        Catch ex As Exception
        Finally
            connection.Close()
        End Try

        Return insertInvoice

    End Function

    Public Function GetCustomer(_customerID As String) As Customer Implements ISaleService.GetCustomer

        ' Read the connection string from web.config
        Dim conStr As String = ConfigurationManager.ConnectionStrings("connectionString").ConnectionString
        Dim con As New SqlConnection(conStr)
        Dim myCustomer As Customer = Nothing
        Try
            con.Open()
            Dim selectStatement As String = "select * from Customers where CustomerID=@CustomerID"
            Dim selectCmd As New SqlCommand(selectStatement, con)
            selectCmd.Parameters.AddWithValue("@CustomerID", _customerID)
            Dim reader As SqlDataReader = selectCmd.ExecuteReader

            If reader.Read Then
                myCustomer = New Customer With {
                    ._ID = reader("CustomerID").ToString,
                    ._CompanyName = reader("CompanyName").ToString,
                    ._ContactName = reader("ContactName").ToString,
                    ._Address = reader("Address").ToString,
                    ._City = reader("City").ToString,
                    ._State = reader("State").ToString,
                    ._Zip = CInt(reader("Zip").ToString),
                    ._Phone = reader("Phone").ToString
                }
            End If
        Catch ex As SqlException
            MsgBox(ex.Message)
        Finally
            con.Close()
        End Try

        Return myCustomer

    End Function
End Class
