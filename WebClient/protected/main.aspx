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
        <div id="content">
            <asp:Repeater ID="repeatProducts" runat="server">
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
                                <b><%# Eval("_Name") %></b>
                            </td>
                            <td>
                                <%# Eval("_QuantityPerUnit") %>
                            </td>
                            <td>
                                <%# Eval("_UnitPrice") %>
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
