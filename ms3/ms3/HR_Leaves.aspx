<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HR_Leaves.aspx.cs" Inherits="ms3.HR_Leaves" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>HR Pending Leaves</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 20px;
        }

        .container {
            max-width: 900px;
            margin: 0 auto;
            background-color: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }

        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 25px;
        }

        asp\:GridView {
            width: 100%;
            border-collapse: collapse;
        }

        .gvLeaves th, .gvLeaves td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        .gvLeaves th {
            background-color: #007ACC;
            color: white;
        }

        .gvLeaves tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        .gvLeaves tr:hover {
            background-color: #f1f1f1;
        }

        .btnProcess {
            background-color: #28a745;
            color: white;
            border: none;
            padding: 6px 12px;
            border-radius: 4px;
            cursor: pointer;
        }

        .btnProcess:hover {
            background-color: #218838;
        }

        #lblLeaveMessage {
            display: block;
            margin-top: 20px;
            font-weight: bold;
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2>Pending Leave Requests</h2>

            <asp:GridView ID="gvLeaves" runat="server" AutoGenerateColumns="False" 
                DataKeyNames="RequestID,LeaveType" OnRowCommand="gvLeaves_RowCommand"
                CssClass="gvLeaves"
                EmptyDataText="No pending leave requests." GridLines="None">
                
                <Columns>
                    <asp:BoundField DataField="RequestID" HeaderText="Request ID" />
                    <asp:BoundField DataField="LeaveType" HeaderText="Leave Type" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Button ID="btnProcess" runat="server" Text="Accept/Reject" 
                                CommandName="Process" CommandArgument='<%# Container.DataItemIndex %>' 
                                CssClass="btnProcess" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>

            <asp:Label ID="lblLeaveMessage" runat="server" Text="" />
        </div>
    </form>
</body>
</html>
