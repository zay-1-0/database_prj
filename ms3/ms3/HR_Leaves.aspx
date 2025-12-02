<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HR_Leaves.aspx.cs" Inherits="ms3.HR_Leaves" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>


            <h2>Pending Leave Requests</h2>

<asp:GridView ID="gvLeaves" runat="server" AutoGenerateColumns="False" 
    OnRowCommand="gvLeaves_RowCommand" DataKeyNames="RequestID,LeaveType" OnSelectedIndexChanged="gvLeaves_SelectedIndexChanged">
    <Columns>
        <asp:BoundField DataField="RequestID" HeaderText="Request ID" />
        <asp:BoundField DataField="LeaveType" HeaderText="Leave Type" />

        <asp:ButtonField ButtonType="Button" Text="Accept/Reject" CommandName="Process" />
    </Columns>
</asp:GridView>

<asp:Label ID="lblLeaveMessage" runat="server" Text="" ForeColor="Green" />






        </div>
    </form>
</body>
</html>
