' Authors: AJ Abundez-Arce & Cody Erickson
' Invoice where it displays the products purchased from the customer
' and allows you to print the webpage or go back to buy more products

Imports System.Data
Imports SalesServiceProxy
Imports WCFCalculator

Partial Class protected_Invoice
    Inherits System.Web.UI.Page

    ' The connection in order to get all our Data Members
    Dim salesProxy As New SalesServiceProxy.SaleServiceClient

    ' Validates if the customer exists. If they do, then send them back to the login page.
    ' Otherwise, bind the list of invoices made by the customer into a GridView
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        Dim customer As Customer = salesProxy.GetCustomer(Page.User.Identity.Name)
        If Not IsNothing(customer) Then
            lblCompanyName.Text = customer._CompanyName
            lblContact.Text = customer._ContactName
            lblTelephone.Text = customer._Phone
            lblAddress.Text = customer.GetFullAddress()

            GridView1.DataSource = salesProxy.ListInvoices(customer._ID)
            GridView1.DataBind()
        Else
            Session.Abandon()
            Request.Cookies.Clear()
            FormsAuthentication.SignOut()
            FormsAuthentication.RedirectToLoginPage()
        End If

    End Sub
End Class
