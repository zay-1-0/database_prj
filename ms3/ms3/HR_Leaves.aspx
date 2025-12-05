<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HR_Leaves.aspx.cs" Inherits="ms3.HR_Leaves" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>HR Pending Leaves</title>
    <style>
        /* Body styling */
        body {
            font-family: 'Poppins', Arial, sans-serif;
            background: #f0f4f8;
            margin: 0;
            padding: 20px;
        }

        /* Container */
        .container {
            max-width: 1000px;
            margin: 0 auto;
            background-color: #ffffff;
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0 15px 35px rgba(0,0,0,0.2);
            animation: fadeIn 1s ease-in-out;
        }

        /* Heading */
        h2 {
            text-align: center;
            color: #1E3A8A;
            margin-bottom: 30px;
            font-size: 32px;
        }

        /* GridView styling */
        asp\:GridView, .gvLeaves {
            width: 100%;
            border-collapse: collapse;
        }

        .gvLeaves th, .gvLeaves td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #e2e8f0;
            font-size: 16px;
        }

        .gvLeaves th {
            background-color: #1E3A8A;
            color: white;
        }

        .gvLeaves tr:nth-child(even) {
            background-color: #f9fafb;
        }

        .gvLeaves tr:hover {
            background-color: #e0f2fe;
        }

        /* Process button */
        .btnProcess {
            background: linear-gradient(90deg, #10b981, #3b82f6);
            color: white;
            border: none;
            padding: 8px 16px;
            border-radius: 8px;
            cursor: pointer;
            font-weight: bold;
            transition: all 0.3s ease;
        }

        .btnProcess:hover {
            background: linear-gradient(90deg, #3b82f6, #10b981);
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(0,0,0,0.2);
        }

        /* Back button */
        .btn-back {
            background: #f97316;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 12px;
            cursor: pointer;
            font-weight: bold;
            margin-top: 20px;
            transition: all 0.3s ease;
        }

        .btn-back:hover {
            background: #ea580c;
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(0,0,0,0.2);
        }

        /* Message label */
        #lblLeaveMessage {
            display: block;
            margin-top: 20px;
            font-weight: bold;
            text-align: center;
            color: #dc2626;
            font-size: 16px;
        }

        /* Fade-in animation */
        @keyframes fadeIn {
            0% { opacity: 0; transform: translateY(-20px); }
            100% { opacity: 1; transform: translateY(0); }
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

            <asp:Button ID="btnBack" runat="server" Text="⟵ Back" CssClass="btn-back"
                OnClick="btnBack_Click" />
        </div>
    </form>
</body>
</html>
