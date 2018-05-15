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
                            <td width="350"><b>Product Name</b></td>
                            <td width="250"><b>Quantity Per Unit</b></td>
                            <td width="150"><b>Unit Price</b></td>
                            <td width="200"><b>Quantity (x1000) </b></td>
                        </tr>
                    </table>
                </headerTemplate>
                <ItemTemplate>
                    <table>
                        <tr>
                            <td width="300"><b><%# Eval("_Name") %></b></td>
                            <td width="250"><%# Eval("_QuantityPerUnit") %></td>
                            <td width="150"><%# Eval("_UnitPrice") %></td>
                            <td width="200">
                                <input id="Text1" name="<%# 1000000000 + Eval("_ID") %>" type="number" value="" />
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:Repeater>
            <div class="clear"></div>
            <asp:Button ID="btnCheckout" runat="server" Text="Check Out" />
        </div>
    </form>
</body>
</html>
