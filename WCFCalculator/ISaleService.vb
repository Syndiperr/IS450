
Imports System.Collections.Generic
' NOTE: You can use the "Rename" command on the context menu to change the interface name "IService1" in both code and config file together.
<ServiceContract()>
Public Interface ISaleService

    <OperationContract()>
    Function GetProduct(ByVal _productID As Integer) As Product

    <OperationContract()>
    Function ListProducts() As List(Of Product)

    <OperationContract()>
    Function ListInvoices(ByVal _customerID As String) As List(Of Invoice)

    <OperationContract()>
    Function GetInvoice(ByVal _customerID As String) As Invoice

    <OperationContract()>
    Function CreateInvoice(ByVal _invoice As Invoice) As Boolean

    <OperationContract()>
    Function GetCustomer(ByVal _customerID As String) As Customer

End Interface

<DataContract()>
Public Class Product
    <DataMember()>
    Property _ID As Integer
    <DataMember()>
    Property _Name As String
    <DataMember()>
    Property _QuantityPerUnit As String
    <DataMember()>
    Property _UnitPrice As Decimal
End Class

<DataContract()>
Public Class Customer
    <DataMember()>
    Property _ID As String
    <DataMember()>
    Property _CompanyName As String
    <DataMember()>
    Property _ContactName As String
    <DataMember()>
    Property _Address As String
    <DataMember()>
    Property _City As String
    <DataMember()>
    Property _State As String
    <DataMember()>
    Property _Zip As Integer
    <DataMember()>
    Property _Phone As String

    Public Function GetFullAddress() As String
        Return _Address & ", " & _City & ", " & _State & ", " & _Zip
    End Function
End Class

<DataContract()>
Public Class Invoice
    <DataMember()>
    Property _ID As Integer
    Property _CustomerID As String
    <DataMember()>
    Property _CompanyName As String
    <DataMember()>
    Property _ProductCost As Decimal
    <DataMember()>
    Property _ShippingCost As Decimal
    <DataMember()>
    Property _Tax As Decimal
    <DataMember()>
    Property _CreationDate As Date

    Public Function GetTotalCost() As Decimal
        Return _ProductCost + _ShippingCost + _Tax
    End Function
End Class