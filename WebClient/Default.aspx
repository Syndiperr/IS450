<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="text-align: center">
            <h1>Calculator App - Simple Calculations</h1>
            <br />
            <input id="txtOperandA" type="text" runat="server" />
            <asp:DropDownList ID="drpOperators" runat="server" style="margin: 0 15px">
                <asp:ListItem Value="+">+</asp:ListItem>
                <asp:ListItem Value="-">-</asp:ListItem>
                <asp:ListItem Value="*">*</asp:ListItem>
                <asp:ListItem Value="/">/</asp:ListItem>
            </asp:DropDownList>
            <input id="txtOperandB" type="text" runat="server" />
            <asp:Label ID="lblEquals" runat="server" Text="=" style="margin: 0 15px"></asp:Label>
            <asp:Label ID="lblValue" runat="server" Text=""></asp:Label>
            <br />
            <br />
            <asp:Button ID="btnCalculate" runat="server" Text="Calculate" />
        </div>
    </form>
</body>
</html>
