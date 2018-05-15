' Authors: AJ Abundez-Arce & Cody Erickson
' Checkout page where the customer can see the total cost of their items being purchased
' and later bringing them to an Invoice page

Imports System.Data
Imports System.IO
Imports System.Net
Imports System.Xml
Imports SalesServiceProxy
Imports WCFCalculator

Partial Class protected_Checkout
    Inherits System.Web.UI.Page

    ' The connection in order to get all our Data Members
    Dim salesProxy As New SalesServiceProxy.SaleServiceClient

    ' Loads the page & if the customer has a shopping cart <they had to be logged in for them to 
    ' create a Shopping Cart>, then it changes the header to their account. Otherwise, it sends
    ' you back into the main page
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Dim customer As Customer = salesProxy.GetCustomer(Page.User.Identity.Name)
        ' Checks if there's a shopping cart existing in the session
        If IsNothing(Session("ShoppingCart")) Then
            Response.Redirect("~/main.aspx")
        Else
            lblCompanyName.Text = customer._CompanyName
            lblContact.Text = customer._ContactName
            lblTelephone.Text = customer._Phone
            lblAddress.Text = customer.GetFullAddress()
            txtShipTo.Text = customer.GetFullAddress()

            ' Binds the shopping cart to the list of products purchased in order to display the items purchased
            repeatSelectedProducts.DataSource = GetSelectedItems()
            repeatSelectedProducts.DataBind()
        End If
    End Sub

    ' Gets the products inside the hash table & displays the subtotal
    ' Returns the list of products purchased
    Private Function GetSelectedItems() As List(Of Product)
        Dim results As New List(Of Product)
        Dim grandSubTotal As Decimal = 0.0

        ' Loop through all of the products in the shopping cart & store them inside a list
        Dim selectedItems As Hashtable = CType(Session("shoppingCart"), Hashtable)
        For Each key In selectedItems.Keys
            results.Add(CType(selectedItems.Item(key), Product))
            grandSubTotal += CType(results.Last, Product).GetSubtotal()
        Next

        ' Formats it as currency
        lblSubtotal.Text = FormatCurrency(grandSubTotal)
        Return results
    End Function

    ' Uses AJAX in order to calculate the shipping & grand total cost and displays the output in the controls
    Protected Sub btnCalculateShippingCost_Click(sender As Object, e As EventArgs) Handles btnCalculateShippingCost.Click
        ' Gets the distance from Eau Claire to the customers address
        Dim miles As Decimal = GetDrivingDistance(txtShipFrom.Text.Trim, txtShipTo.Text.Trim)
        Dim subtotal As Decimal = CDec(lblSubtotal.Text.Substring(1, lblSubtotal.Text.Length - 1))

        ' Conditions in order to calculate the shipping rate
        Dim shippingRate As Decimal
        If subtotal < 10000 Then
            shippingRate = 4.0
        ElseIf subtotal < 30000 Then
            shippingRate = 5.0
        ElseIf subtotal < 60000 Then
            shippingRate = 6.0
        ElseIf subtotal >= 60000 Then
            shippingRate = 10.0
        End If

        Dim shipCost As Decimal = shippingRate * miles
        lblShippingCost.Text = FormatCurrency(shipCost)
        txtGrandTotal.Text = FormatCurrency(subtotal + shipCost)

        txtGrandTotal.Visible = True
        lblGrandTotal.Visible = True
        lblShippingCost.Visible = True
    End Sub

    ' Uses the Google API DistanceMatrix in order to get the location based on the addresses of the origin
    '  and destination
    Private Function GetDrivingDistance(ByVal origin As String, ByVal destination As String) As Decimal
        Try
            ' The RESTful servcie endpoint. Since this is HTTP service, the calling program simply sends the request to the service/website url.
            Dim googleMapUrl As String = "http://maps.googleapis.com/maps/api/distancematrix/xml?origins=" & origin & "&destinations=" & destination & "&mode=driving&language=en-EN&units=imperial"

            ' Create request and response objects. The response object must be created from the request object!
            Dim request As HttpWebRequest = WebRequest.Create(googleMapUrl)
            Dim response As HttpWebResponse = request.GetResponse

            ' Open data stream (this is the same way as we did when we read data from a sequential in IS314. The response is a data source like a sequential file) to the response object.
            Dim dataStream As Stream = response.GetResponseStream
            Dim sr As StreamReader = New StreamReader(dataStream)

            Dim responseReader As String = sr.ReadToEnd()
            response.Close()

            ' Prepare for XML data parsing. Here we load XML data - responseReader into a XML parsing object - XmlDocument.
            Dim xmldoc As New XmlDocument
            xmldoc.LoadXml(responseReader)

            ' Display the XML dataset returned from the REST service. 
            ' You can see all google distance values in the XML dataset.


            'MsgBox(responseReader)

            ' Now use methods in XMLDocument to do data parsing
            If xmldoc.GetElementsByTagName("status")(0).ChildNodes(0).InnerText = "OK" Then
                Dim distance As XmlNodeList = xmldoc.GetElementsByTagName("distance")

                ' Before returning the distance in miles, remove " mi" in the distance value.
                Return Convert.ToDecimal(distance(0).ChildNodes(1).InnerText.Replace(" mi", ""))
            End If

        Catch ex As Exception
            MsgBox(ex.Message)
        End Try

        Return 0
    End Function

    ' Validates if the grand total was calculated (by checking if that specific control is visible) & creates a new
    ' invoice in the database and displays the products bought in the Invoice.aspx page
    Protected Sub btnGenerateInvoice_Click(sender As Object, e As EventArgs) Handles btnGenerateInvoice.Click
        ' Checks the customer from the database
        Dim customer As Customer = salesProxy.GetCustomer(Page.User.Identity.Name)
        If lblGrandTotal.Visible Then
            Dim totalCost As Decimal = CDec(txtGrandTotal.Text.Substring(1, txtGrandTotal.Text.Length - 1).ToString)
            Dim shippingCost As Decimal = CDec(lblShippingCost.Text.Substring(1, lblShippingCost.Text.Length - 1).ToString)

            Dim invoice As Invoice = New Invoice With {
                ._ProductCost = totalCost,
                ._ShippingCost = shippingCost,
                ._Tax = 0.06 * totalCost,
                ._CustomerID = customer._ID,
                ._CompanyName = customer._CompanyName,
                ._CreationDate = DateTime.Now
            }

            ' Checks to see if creating the invoice was successful, otherwise, displays a message
            ' notifying you of the failure
            If salesProxy.CreateInvoice(invoice) Then
                Response.Redirect("Invoice.aspx")
            Else
                MsgBox("There was an error creating an invoice. Please try again.")
            End If
        Else
            MsgBox("Please calculate shipping cost!")
        End If
    End Sub
End Class
