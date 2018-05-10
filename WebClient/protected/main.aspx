<%@ Page Language="VB" AutoEventWireup="false" CodeFile="main.aspx.vb" Inherits="protected_main" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="height: 479px">
            <a href="ChangePassword.aspx">Change Password</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:LoginStatus ID="LoginStatus1" runat="server" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:LoginName ID="LoginName1" runat="server" />
            <br />
            <br />
            Welcome &quot;<asp:Label ID="lblUsername" runat="server" Text=""></asp:Label>&quot;!<br />
            <br />
            This is password protected page. You only can access to this page by passing authentication!</div>
    </form>
</body>
</html>
