<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Invoice.aspx.vb" Inherits="protected_Invoice" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
    <link rel="stylesheet" href="./main.css" />
    <style type="text/css">
        .auto-style1 {
            z-index: 1;
            left: 150px;
            top: 340px;
            position: absolute;
            height: 133px;
            width: 187px;
        }
    </style>
    <script>
        $(document).ready(function () {
            $("#btnPrintInvoice").click(function () {
                window.print();
            });
        });
    </script>
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
            <asp:Button ID="btnPrintInvoice" runat="server" Font-Bold="True" style="z-index: 1; left: 138px; top: 240px; position: absolute;" Text="Print Invoice" />
            <asp:Button ID="btnMainPage" runat="server" Font-Bold="True" PostBackUrl="~/protected/main.aspx" style="z-index: 1; left: 1064px; top: 242px; position: absolute" Text="Main Page" />
            <asp:GridView ID="GridView1" runat="server" CssClass="auto-style1">
            </asp:GridView>
        </div>
    </form>
</body>
</html>
