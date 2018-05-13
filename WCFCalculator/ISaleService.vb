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

End Class

<DataContract()>
Public Class Customer

End Class

<DataContract()>
Public Class Invoice

End Class