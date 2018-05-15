
Imports System.Data
Imports SalesServiceProxy
Imports WCFCalculator
'Authors: Adrian Abundez-Arce, Cody Erickson
Partial Class protected_main
    Inherits System.Web.UI.Page

    Dim salesProxy As New SalesServiceProxy.SaleServiceClient

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        'When page is loaded a customer valriable is declared and assigned the 
        'function GetCustomer located withing the SaleService.vb file
        Dim customer As Customer = salesProxy.GetCustomer(Page.User.Identity.Name)
        If Not IsNothing(customer) Then
            'The datasource for the repeater is the ListProducts function in the SaleService.vb file
            'As the ListProducts function queries the product table and creates a list of the products 
            'pulled from the table
            repeatProducts.DataSource = salesProxy.ListProducts()
            repeatProducts.DataBind()
            'Appropriate labels are assigned to the properties that are set to customer
            lblCompanyName.Text = customer._CompanyName
            lblContact.Text = customer._ContactName
            lblTelephone.Text = customer._Phone
            lblAddress.Text = customer.GetFullAddress()
        Else
            'Otherwise is customer does not exist, the session is terminated
            Session.Abandon()
            Request.Cookies.Clear()
            FormsAuthentication.SignOut()
            FormsAuthentication.RedirectToLoginPage()
        End If

    End Sub

    Protected Sub btnCheckout_Click(sender As Object, e As EventArgs) Handles btnCheckout.Click
        If Page.IsValid Then
            'Hashtable is created to store the products with a valid quantity value
            Dim productHT As New Hashtable
            'For loop cycles through all the items within the repeated
            For index = 0 To repeatProducts.Items.Count - 1
                'Declares product variable to the grab each product in the repeater
                Dim product As Product = CType(repeatProducts.DataSource, Product()).ElementAt(index)
                'Quantity variable is declared to get the value from the HTML input boxes
                Dim quantity As String = Request.Form(CStr(1000000000 + product._ID))
                'If statement is set to verify the quantity is valid and the assigns the property
                'of the quantity purchased to the user's input and adds the appropriate product to the hashtable
                If Not String.IsNullOrEmpty(quantity) AndAlso CInt(quantity) > 0 Then
                    product._QuantityPurchased = CInt(quantity)
                    productHT.Add(product._ID, product)
                End If
            Next
            'Sends a msgbox to user if no products have a quantity, otherwise it stores the hashtable
            'in a session variable to pass it to the checkout page
            If productHT.Count = 0 Then
                MsgBox("Please add quantity.")
            Else
                Session("ShoppingCart") = productHT
                Response.Redirect("./Checkout.aspx")
            End If
        End If
    End Sub

End Class
