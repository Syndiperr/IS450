
Imports SalesServiceProxy
Imports WCFCalculator

Partial Class protected_main
    Inherits System.Web.UI.Page

    Dim salesProxy As New SalesServiceProxy.SaleServiceClient

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        Dim customer As Customer = salesProxy.GetCustomer(Page.User.Identity.Name)
        If Not IsNothing(customer) Then
            repeatProducts.DataSource = salesProxy.ListProducts()
            repeatProducts.DataBind()
            lblCompanyName.Text = customer._CompanyName
            lblContact.Text = customer._ContactName
            lblTelephone.Text = customer._Phone
            lblAddress.Text = customer.GetFullAddress()
        Else
            Session.Abandon()
            Request.Cookies.Clear()
            FormsAuthentication.SignOut()
            FormsAuthentication.RedirectToLoginPage()
        End If

    End Sub

End Class
