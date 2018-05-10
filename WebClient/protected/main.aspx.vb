
Partial Class protected_main
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        lblUsername.Text = Page.User.Identity.Name
    End Sub
End Class
