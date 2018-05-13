
Imports System.Collections.Generic
' NOTE: You can use the "Rename" command on the context menu to change the interface name "IService1" in both code and config file together.
<ServiceContract()>
Public Interface ISaleService

    <OperationContract()>
    Function GetProduct(ByVal _productID As Integer) As Product

    <OperationContract()>
    Function ListProducts() As List(Of Product)

    <OperationContract()>
    Function ListInvoices() As List(Of Invoice)

    <OperationContract()>
    Function GetInvoice(ByVal _customerID As String) As Invoice

    <OperationContract()>
    Function CreateInvoice(ByVal _invoice As Invoice) As Boolean

    <OperationContract()>
    Function GetCustomer(ByVal _customerID As String) As Customer

End Interface

<DataContract()>
Public Class Product
    Property _ID As Integer
    Property _Name As String
    Property _QuantityPerUnit As String
    Property _UnitPrice As Decimal
End Class

<DataContract()>
Public Class Customer
    Property _ID As String
    Property _CompanyName As String
    Property _ContactName As String
    Property _Address As String
    Property _City As String
    Property _State As String
    Property _Zip As Integer
    Property _Phone As String
End Class

<DataContract()>
Public Class Invoice
    Property _ID As Integer
    Property _CustomerID As String
    Property _CompanyName As String
    Property _ProductCost As Decimal
    Property _ShippingCost As Decimal
    Property _Tax As Decimal
    Property _Total As Decimal
    Property _CreationDate As Date
End Class