
Imports System.Data
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

    Protected Sub btnCheckout_Click(sender As Object, e As EventArgs) Handles btnCheckout.Click
        If Page.IsValid Then
            Dim productHT As New Hashtable
            For index = 0 To repeatProducts.Items.Count - 1
                Dim product As Product = CType(repeatProducts.DataSource, Product()).ElementAt(index)
                Dim quantity As String = Request.Form(CStr(1000000000 + product._ID))
                If Not String.IsNullOrEmpty(quantity) AndAlso CInt(quantity) > 0 Then
                    product._QuantityPurchased = CInt(quantity)
                    productHT.Add(product._ID, product)
                End If
            Next

            If productHT.Count = 0 Then
                MsgBox("Please add quantity.")
            Else
                Session("ShoppingCart") = productHT
                Response.Redirect("./Checkout.aspx")
            End If
        End If
    End Sub

End Class
