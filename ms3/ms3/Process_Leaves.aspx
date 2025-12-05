<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Process_Leaves.aspx.cs" Inherits="ms3.Process_Leaave" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
        <title>Upperboard Leave Approvals</title>
    <style>
        .page-title {
            font-family: Arial;
            font-size: 22px;
            margin-bottom: 15px;
        }
        .grid {
            font-family: Arial;
            font-size: 14px;
        }
        .grid th {
            background-color: #f0f0f0;
            padding: 6px;
        }
        .grid td {
            padding: 4px 6px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="page-title">Pending Leave Requests (Dean / Vice Dean / President)</div>

        <asp:GridView ID="gvUpperboardLeaves" runat="server"
    CssClass="grid"
    AutoGenerateColumns="False"
    DataKeyNames="request_ID,LeaveType,replacement_emp"
    OnRowCommand="gvUpperboardLeaves_RowCommand">
    <Columns>
        <asp:BoundField DataField="request_ID" HeaderText="Request #" />
        <asp:BoundField DataField="EmployeeName" HeaderText="Employee" />
        <asp:BoundField DataField="LeaveType" HeaderText="Type" />
        <asp:BoundField DataField="date_of_request" HeaderText="Requested On"
                        DataFormatString="{0:yyyy-MM-dd}" />
        <asp:BoundField DataField="start_date" HeaderText="From"
                        DataFormatString="{0:yyyy-MM-dd}" />
        <asp:BoundField DataField="end_date" HeaderText="To"
                        DataFormatString="{0:yyyy-MM-dd}" />
        <asp:BoundField DataField="final_approval_status" HeaderText="Final Status" />

        <asp:TemplateField HeaderText="Action">
            <ItemTemplate>
                <asp:Button ID="btnProcess" runat="server"
                    Text="Approve/Reject"
                    CommandName="Process"
                    CommandArgument='<%# Container.DataItemIndex %>' />
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>

<asp:Label ID="Label1" runat="server" ForeColor="Green"></asp:Label>


        <asp:Label ID="lblMessage" runat="server" ForeColor="Green"></asp:Label>
          <asp:Button ID="HomeButton" runat="server" Text="Go to Home Page" OnClick="HomeButton_Click" />

        </div>
    </form>
</body>
</html>
