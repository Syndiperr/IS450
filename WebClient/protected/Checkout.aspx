

<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Checkout.aspx.vb" Inherits="protected_Checkout" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="./main.css" />

    <script type="text/javascript" src="http://maps.google.com/maps/api/js?key=AIzaSyDebPGz84H6PJOxDyHxspW9WtaUOBQcIVQ&sensor=true"></script>
    <script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
    <style>
        #centerTable > table {
            align-content: center;
        }
    </style>
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

        <div id="centerTable" style="margin-top: 59px; width: 100%; text-align: center;">
            <asp:Repeater ID="repeatSelectedProducts" runat="server">
                <headerTemplate>
                    <table>
                        <tr>
                            <td width="350"><b>Product Name</b></td>
                            <td width="250"><b>Quantity Per Unit</b></td>
                            <td width="150"><b>Unit Price</b></td>
    `                       <td widht="200"><b>Ordered Quantity (x1000)</b></td>
                            <td width="200"><b>Subtotal</b></td>
                        </tr>
                    </table>
                </headerTemplate>
                <ItemTemplate>
                    <table>
                        <tr>
                            <td width="350"><b><%# Eval("_Name") %></b></td>
                            <td width="250"><%# Eval("_QuantityPerUnit") %></td>
                            <td width="150"><%# Eval("_UnitPrice") %></td>
                            <td width="200"><%# Eval("_QuantityPurchased") %></td>
                            <td width="200"><%# Eval("_UnitPrice") * (Eval("_QuantityPurchased") * 1000) %></td>
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
            <asp:TextBox ID="txtShipTo" runat="server" style="z-index: 1; top: 485px; position: absolute; width: 235px; left: 575px;" ReadOnly="True"></asp:TextBox>
            <asp:Label ID="lblShipTo" runat="server" Font-Bold="True" style="z-index: 1; left: 487px; top: 486px; position: absolute" Text="Ship To:"></asp:Label>
            <asp:TextBox ID="txtShipFrom" runat="server" ReadOnly="True" style="z-index: 1; left: 299px; top: 487px; position: absolute; width: 145px">Eau Claire, WI 54701</asp:TextBox>
            <asp:Label ID="lblShipping" runat="server" Font-Bold="True" Font-Underline="True" style="z-index: 1; left: 196px; top: 537px; position: absolute" Text="Shipping Cost:"></asp:Label>
            <asp:Label ID="lblShipFrom" runat="server" Font-Bold="True" style="z-index: 1; top: 485px; position: absolute; right: 1639px;" Text="Ship From:"></asp:Label>
            
        </div>
    </form>
</body>
</html>
