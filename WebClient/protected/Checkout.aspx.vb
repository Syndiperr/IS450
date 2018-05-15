
Imports System.Data
Imports SalesServiceProxy
Imports WCFCalculator

Partial Class protected_Checkout
    Inherits System.Web.UI.Page

    Dim salesProxy As New SalesServiceProxy.SaleServiceClient
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Dim customer As Customer = salesProxy.GetCustomer(Page.User.Identity.Name)
        If IsNothing(Session("ShoppingCart")) Then
            Response.Redirect("~/main.aspx")
        Else
            lblCompanyName.Text = customer._CompanyName
            lblContact.Text = customer._ContactName
            lblTelephone.Text = customer._Phone
            lblAddress.Text = customer.GetFullAddress()
            txtShipTo.Text = customer.GetFullAddress()

            txtGrandTotal.Visible = False
            lblGrandTotal.Visible = False
            lblShippingCost.Visible = False

            repeatSelectedProducts.DataSource = GetSelectedItems()
            repeatSelectedProducts.DataBind()
        End If
    End Sub

    Private Function GetSelectedItems() As List(Of Product)
        Dim results As New List(Of Product)
        Dim grandSubTotal As Decimal = 0.0

        Dim selectedItems As Hashtable = CType(Session("shoppingCart"), Hashtable)
        For Each key In selectedItems.Keys
            results.Add(CType(selectedItems.Item(key), Product))
            grandSubTotal += CType(results.Last, Product).GetSubtotal()
        Next

        lblSubtotal.Text = FormatCurrency(grandSubTotal)
        Return results
    End Function

    Protected Sub btnCalculateShippingCost_Click(sender As Object, e As EventArgs) Handles btnCalculateShippingCost.Click
        txtGrandTotal.Visible = True
        lblGrandTotal.Visible = True
        lblShippingCost.Visible = True
    End Sub

End Class
