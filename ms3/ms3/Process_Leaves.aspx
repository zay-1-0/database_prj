<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Process_Leaves.aspx.cs" Inherits="ms3.Process_Leaave" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Upperboard Leave Approvals</title>
    <style>
        /* 1. Reset and Base Styles */
        html, body {
            height: 100%;
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%); /* Cool gradient background */
        }

        /* 2. Center everything using Flexbox */
        #form1 {
            min-height: 100%;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px; /* Padding to prevent edges touching on small screens */
            box-sizing: border-box;
        }

        /* 3. The "Card" Container */
        .card-container {
            background-color: white;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2); /* Deep shadow */
            width: 90%; /* Responsive width */
            max-width: 1100px; /* Cap width for large screens */
            text-align: center;
            transition: transform 0.3s ease;
            overflow: auto; /* Handle table overflow on small screens */
        }

        .card-container:hover {
            transform: translateY(-5px); /* Subtle lift animation */
        }

        /* 4. Title Styling */
        .page-title {
            font-size: 24px;
            color: #333;
            margin-bottom: 25px;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 1px;
            border-bottom: 2px solid #007bff;
            padding-bottom: 10px;
            display: inline-block;
        }

        /* 5. GridView Styling */
        .modern-grid {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
            font-size: 14px;
            text-align: left;
            border-radius: 8px;
            overflow: hidden; /* Rounds the corners of the table */
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.05);
        }

        .modern-grid th {
            background-color: #007bff;
            color: #ffffff;
            padding: 12px 15px;
            text-transform: uppercase;
            font-weight: 600;
            letter-spacing: 0.5px;
        }

        .modern-grid td {
            padding: 12px 15px;
            border-bottom: 1px solid #dddddd;
            color: #555;
        }

        .modern-grid tr:nth-of-type(even) {
            background-color: #f8f9fa; /* Zebra striping */
        }

        .modern-grid tr:hover {
            background-color: #f1f1f1; /* Row hover effect */
        }

        /* 6. Button Styling */
        /* Common style for both grid buttons and the home button */
        .styled-button, .modern-grid input[type="submit"] {
            padding: 8px 16px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 6px;
            font-size: 14px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 4px 6px rgba(0, 123, 255, 0.2);
            text-decoration: none;
            display: inline-block;
        }

        .styled-button:hover, .modern-grid input[type="submit"]:hover {
            background-color: #0056b3;
            box-shadow: 0 6px 12px rgba(0, 123, 255, 0.3);
            transform: translateY(-2px);
        }

        /* Specific style for Home Button to make it distinct/larger if needed */
        .home-button {
            margin-top: 25px;
            padding: 12px 24px;
            font-size: 16px;
            background-color: #6c757d; /* Secondary gray color */
        }
        
        .home-button:hover {
            background-color: #5a6268;
            box-shadow: 0 6px 12px rgba(108, 117, 125, 0.3);
        }

        /* Message Labels */
        .status-message {
            display: block;
            margin-top: 15px;
            font-weight: bold;
            font-size: 1.1em;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        
        <div class="card-container">
            <div class="page-title">Pending Leave Requests</div>

            <asp:GridView ID="gvUpperboardLeaves" runat="server"
                CssClass="modern-grid"
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

            <asp:Label ID="Label1" runat="server" ForeColor="Green" CssClass="status-message"></asp:Label>
            <asp:Label ID="lblMessage" runat="server" ForeColor="Green" CssClass="status-message"></asp:Label>
            
            <br />
            
            <asp:Button ID="HomeButton" runat="server" Text="Go to Home Page" OnClick="HomeButton_Click" CssClass="styled-button home-button" />

        </div>
    </form>
</body>
</html>