<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ms3.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            Please Log In<br />
       User Name:<br />
           <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
          <br />
          Password:<br />
          <asp:TextBox ID="Password" runat="server"></asp:TextBox>

           <br />
           <br />
          <asp:Button ID="Login" runat="server" OnClick="Login_Click" Text="Log in" />





        </div>
    </form>
</body>
</html>
