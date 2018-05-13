

<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Checkout.aspx.vb" Inherits="protected_Checkout" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="./main.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div id="header">
            <div class="left" style="color: blue;"><h1>Company Logo</h1></div>
            <div class="right"><h1><asp:LoginStatus ID="LoginStatus1" runat="server" /></h1></div>
            <div class="center" style="color: green;"><h1>Great Lakes Food Market</h1></div>
            <div class="clear"></div>
            <div class="left">Contact: </div>
            <div class="right">Tel: </div>
            <div class="center">Address: </div>
            <div class="clear"></div>
            <div id="greenbar"></div>
        </div>
        <div class="clear"></div>
        <br />
        <br />
        <br />
        <div id="content">
            <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="Large" style="z-index: 1; left: 565px; top: 267px; position: absolute" Text="The Order Summary"></asp:Label>
            <br />
            <br />

        <div style="margin-top: 59px">
            
            <asp:Repeater ID="repeatSelectedProducts" runat="server" DataSourceID="WCFSaleService.ListProducts()">
               
                <headerTemplate>
                    <table>
                            <tr>
                                <td>
                                    <b>Product Name</b>
                                </td>
                                <td>
                                    <b>Quantity Per Unit</b>
                                </td>
                                <td>
                                    <b>Unit Price</b>
                                </td>
                                <td>
                                    <b>Ordered Quantity(x1000)</b>
                                </td>
                                <td>
                                    <b>Subtotal</b>
                                </td>
                            </tr>
                        </table>
                        </headerTemplate>

                <ItemTemplate>
                    <table>
                        <tr>
                            <td>
                                <b><%# Eval("ProductName") %></b>
                            </td>
                            <td>
                                <%# Eval("QuantityPerUnit") %>
                            </td>
                            <td>
                                <%# Eval("UnitPrice") %>
                            </td>
                            <td>
                                
                            </td>
                            <td>
                                
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>

            </asp:Repeater>
            </div>
            
            <div>

            <asp:TextBox ID="txtGrandTotal" runat="server" Font-Bold="True" ReadOnly="True" style="z-index: 1; left: 523px; top: 570px; position: absolute"></asp:TextBox>
            <asp:Button ID="btnGenerateInvoice" runat="server" Font-Bold="True" style="z-index: 1; left: 584px; top: 608px; position: absolute" Text="Generate Invoice" />
            <asp:Button ID="btnCalculateShippingCost" runat="server" Font-Bold="True" style="z-index: 1; left: 892px; top: 482px; position: absolute; margin-top: 0px" Text="Calculate Shipping Cost" />
            <asp:TextBox ID="TextBox2" runat="server" style="z-index: 1; left: 575px; top: 484px; position: absolute; width: 235px" ReadOnly="True"></asp:TextBox>
            <asp:Label ID="Label3" runat="server" Font-Bold="True" style="z-index: 1; left: 487px; top: 486px; position: absolute" Text="Ship From:"></asp:Label>
            <asp:TextBox ID="TextBox1" runat="server" ReadOnly="True" style="z-index: 1; left: 296px; top: 486px; position: absolute; width: 145px">Eau Claire, WI 54701</asp:TextBox>
            <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Underline="True" style="z-index: 1; left: 196px; top: 537px; position: absolute" Text="Shipping Cost:"></asp:Label>
            <asp:Label ID="lblGrandTotal" runat="server" Font-Bold="True" Font-Underline="True" style="z-index: 1; left: 199px; top: 571px; position: absolute" Text="Grand Total (Product Cost + Shipping Cost)  =  "></asp:Label>
            <asp:Label ID="Label5" runat="server" Font-Bold="True" style="z-index: 1; left: 210px; top: 486px; position: absolute" Text="Ship From:"></asp:Label>
            <asp:Label ID="Label6" runat="server" style="z-index: 1; left: 321px; top: 539px; position: absolute" Text="Shipping Cost Goes Here"></asp:Label>
</div>
        
        </div>
    </form>
</body>
</html>
