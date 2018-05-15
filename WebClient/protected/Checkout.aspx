

<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Checkout.aspx.vb" Inherits="protected_Checkout" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="./main.css" />

    <script type="text/javascript" src="http://maps.google.com/maps/api/js?key=AIzaSyDebPGz84H6PJOxDyHxspW9WtaUOBQcIVQ&sensor=true"></script>
              
    <script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
    
    <script type="text/javascript">
        var fromlatLng;
        var tolatLng;

        $(document).ready(function () {
            getCurrentLocation();
            GetDestination();
            ShippingCostValue(getDistance(fromlatLng, tolatLng));
            $("#txtGrandTotal").html($("#lblShippingCost").html() + $("#lblSubtotal").html());
        });

        function ShippingCostValue(miles) {
            var subtotal = $("#lblSubtotal").val();

            if (subtotal < 10000) {
                $("#lblShippingCost").html(4.0 * miles);
            } else if (subtotal < 30000) {
                $("#lblShippingCost").html(5.0 * miles);
            } else if (subtotal < 60000) {
                $("#lblShippingCost").html(6.0 * miles);
            } else if (subtotal >= 60000) {
                $("#lblShippingCost").html(10.0 * miles);
            }
        }

        function getCurrentLocation() {
            // Get current position using HTML5 Geolocation. See http://www.w3schools.com/html/html5_geolocation.asp
            navigator.geolocation.getCurrentPosition(onSuccess, onError);
        }

        // Display error message if getCurrentPosition fails.
        function onError(message) {
            navigator.notification.alert(message, "", "Error");
        }

        // Display the location in Google Map if getCurrentPosition scucceeds.
        function onSuccess(position) {
            // See http://www.w3schools.com/googleapi/google_maps_basic.asp for the following codes.
            // Create a Google Map LatLng object to store latitude and longitude
            fromlatLng = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
        }

        function GetDestination() {
            var address = $('#lblAddress').val();

            // see the Google Map GeoCoder object at https://developers.google.com/maps/documentation/javascript/geocoding
            geocoder = new google.maps.Geocoder();
            geocoder.geocode({ 'address': address }, function (results, status) {
                if (status == google.maps.GeocoderStatus.OK) {
                         tolatLng = results[0].geometry.location;
                } else {
                         alert("Geocode was not successful for the following reason: " + status);
                }
                });
            }

        // get distance between two points in (latitude, longitude)
        function getDistance(latLng1, latLng2) {
            var rad = 3.1415926 / 180;                          // convert to radians
            var R = 3961;                                       // radius of the earth (in miles)
            var dLng = latLng2.lng() - latLng1.lng();
            var dLat = latLng2.lat() - latLng1.lat();

            // The following lines calculate the flight distance between latLng1 and latLng2.
            var a = (Math.sin(dLat / 2 * rad)) * (Math.sin(dLat / 2 * rad)) + Math.cos(latLng1.lat() * rad) * Math.cos(latLng2.lat() * rad) * (Math.sin(dLng / 2 * rad)) * (Math.sin(dLng / 2 * rad));
            var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
            var d = R * c;

            return d;
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div id="header">
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <div class="left" style="color: blue;"><h1>Company Logo</h1></div>
            <div class="right"><h1><asp:LoginStatus ID="LoginStatus1" runat="server" /></h1></div>
            <div class="center" style="color: green;">
                <h1><asp:Label ID="lblCompanyName" runat="server" Text="[CompanyName]"></asp:Label></h1>
            </div>
            <div class="clear"></div>
            <div class="left">
                Contact: <asp:Label ID="lblContact" runat="server" Text="[Contact]"></asp:Label>
            </div>
            <div class="right">
                Tel: <asp:Label ID="lblTelephone" runat="server" Text="[Telephone #]"></asp:Label>
            </div>
            <div class="center">
                Address: <asp:Label ID="lblAddress" runat="server" Text="[Address]"></asp:Label>
            </div>
            <div class="clear"></div>
            <div id="greenbar"></div>
        </div>
        <div class="clear"></div>
        <br />
        <br />
        <br />

        <div style="margin-top: 59px">
            <asp:Repeater ID="repeatSelectedProducts" runat="server">
              <headerTemplate>
                    <table>
                        <tr>
                            <td><b>Product Name</b></td>
                            <td><b>Quantity Per Unit</b></td>
                            <td><b>Unit Price</b></td>
                            <td><b>Ordered Quantity (x1000)</b></td>
                            <td><b>Subtotal</b></td>
                        </tr>
                    </table>
                </headerTemplate>
                <ItemTemplate>
                    <table>
                        <tr>
                            <td><b><%# Eval("_Name") %></b></td>
                            <td><%# Eval("_QuantityPerUnit") %></td>
                            <td><%# Eval("_UnitPrice") %></td>
                            <td><%# Eval("_QuantityPurchased") %></td>
                            <td><%# Eval("_UnitPrice") * (Eval("_QuantityPurchased") * 1000) %></td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:Repeater>
            <asp:Label ID="lblTotalCost" runat="server" Text="Label"><b><em>Total Cost</em></b></asp:Label>
            <asp:Label ID="lblSubtotal" runat="server" Text="Label"></asp:Label>
        </div>
        <div>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:TextBox ID="txtGrandTotal" runat="server" Font-Bold="True" ReadOnly="True" style="z-index: 1; left: 523px; top: 570px; position: absolute" Visible="False"></asp:TextBox>
                    <asp:Label ID="lblShippingCost" runat="server" style="z-index: 1; left: 321px; top: 539px; position: absolute" Text="Shipping Cost Goes Here" Visible="False"></asp:Label>
                    <asp:Label ID="lblGrandTotal" runat="server" Font-Bold="True" Font-Underline="True" style="z-index: 1; left: 199px; top: 571px; position: absolute" Text="Grand Total (Product Cost + Shipping Cost)  =  " Visible="False"></asp:Label>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btnCalculateShippingCost" EventName="Click" />
                </Triggers>
            </asp:UpdatePanel>
            
            <asp:Button ID="btnGenerateInvoice" runat="server" Font-Bold="True" style="z-index: 1; left: 584px; top: 608px; position: absolute" Text="Generate Invoice" />
            <asp:Button ID="btnCalculateShippingCost" runat="server" Font-Bold="True" style="z-index: 1; left: 892px; top: 482px; position: absolute; margin-top: 0px" Text="Calculate Shipping Cost" />
            <asp:TextBox ID="txtShipTo" runat="server" style="z-index: 1; left: 575px; top: 484px; position: absolute; width: 235px" ReadOnly="True"></asp:TextBox>
            <asp:Label ID="lblShipFrom" runat="server" Font-Bold="True" style="z-index: 1; left: 487px; top: 486px; position: absolute" Text="Ship From:"></asp:Label>
            <asp:TextBox ID="txtShipFrom" runat="server" ReadOnly="True" style="z-index: 1; left: 296px; top: 486px; position: absolute; width: 145px">Eau Claire, WI 54701</asp:TextBox>
            <asp:Label ID="lblShipping" runat="server" Font-Bold="True" Font-Underline="True" style="z-index: 1; left: 196px; top: 537px; position: absolute" Text="Shipping Cost:" Visible="True"></asp:Label>
            <asp:Label ID="lblShipTo" runat="server" Font-Bold="True" style="z-index: 1; left: 210px; top: 486px; position: absolute" Text="Ship To:"></asp:Label>
            
        </div>
    </form>
</body>
</html>
