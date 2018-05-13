<%@ Page Language="VB" AutoEventWireup="false" CodeFile="main.aspx.vb" Inherits="protected_main" %>

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
            <asp:LoginName ID="LoginName1" runat="server" />
            <br />
            <br />
            Welcome &quot;<asp:Label ID="lblUsername" runat="server" Text=""></asp:Label>&quot;!<br />
            <br />

            <asp:Repeater ID="repeatProducts" runat="server" DataSourceID="WCFSaleService.ListProducts()">
               
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
                                    <b>Quantity (x1000) </b>
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
                               <asp:TextBox ID="TextBox1" runat="server" style="z-index: 1; left: 138px; top: 466px; position: absolute"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>

            </asp:Repeater>
            
        </div>
    </form>
</body>
</html>
