
Imports System.Data
Imports System.IO
Imports System.Net
Imports System.Xml
Imports SalesServiceProxy
Imports WCFCalculator

Partial Class protected_Checkout
    Inherits System.Web.UI.Page

    Dim customer As Customer

    Dim salesProxy As New SalesServiceProxy.SaleServiceClient
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        customer = salesProxy.GetCustomer(Page.User.Identity.Name)
        If IsNothing(Session("ShoppingCart")) Then
            Response.Redirect("~/main.aspx")
        Else
            lblCompanyName.Text = customer._CompanyName
            lblContact.Text = customer._ContactName
            lblTelephone.Text = customer._Phone
            lblAddress.Text = customer.GetFullAddress()
            txtShipTo.Text = customer.GetFullAddress()

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
        Dim miles As Decimal = GetDrivingDistance(txtShipFrom.Text.Trim, txtShipTo.Text.Trim)
        Dim subtotal As Decimal = CDec(lblSubtotal.Text.Substring(1, lblSubtotal.Text.Length - 1))

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

    Protected Sub btnGenerateInvoice_Click(sender As Object, e As EventArgs) Handles btnGenerateInvoice.Click
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
            If salesProxy.CreateInvoice(invoice) Then
                Response.Redirect("~/Invoice.aspx")
            Else
                MsgBox("There was an error creating an invoice. Please try again.")
            End If
        Else
            MsgBox("Please calculate shipping cost!")
        End If
    End Sub
End Class
