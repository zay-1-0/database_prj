<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminHomePage.aspx.cs" Inherits="ms3.AdminHomePage" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Home Page</title>
    <style>
        body {
            font-family: 'Poppins', Arial, sans-serif;
            background: linear-gradient(135deg, #1E3A8A, #60A5FA);
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        .container {
            width: 600px;
            background-color: #ffffff;
            border-radius: 20px;
            padding: 40px;
            box-shadow: 0 15px 35px rgba(0,0,0,0.3);
            text-align: center;
            animation: fadeIn 1s ease-in-out;
        }

        h1 {
            color: #1E3A8A;
            font-size: 32px;
            margin-bottom: 30px;
        }

        .btn {
            width: 100%;
            padding: 14px;
            margin-bottom: 15px;
            font-size: 16px;
            font-weight: bold;
            border: none;
            border-radius: 12px;
            cursor: pointer;
            background: linear-gradient(90deg, #1E3A8A, #60A5FA);
            color: white;
            transition: all 0.3s ease;
            box-shadow: 0 6px 15px rgba(0,0,0,0.2);
        }

        .btn:hover {
            background: linear-gradient(90deg, #60A5FA, #1E3A8A);
            transform: translateY(-3px);
            box-shadow: 0 10px 20px rgba(0,0,0,0.3);
        }

        .btn-back {
            background: #FACC15;
        }

        .btn-back:hover {
            background: #eab308;
        }

        #WarningLabel {
            display: block;
            margin-top: 20px;
            font-weight: bold;
            color: #dc2626;
        }

        @keyframes fadeIn {
            0% { opacity: 0; transform: translateY(-20px); }
            100% { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>

<body>
    <form id="form1" runat="server">
        <div class="container">
            <!-- Welcome Header -->
            <h1>Welcome, Admin</h1>

            <!-- Sign Out Button -->
            <asp:Button ID="Button8" runat="server" Text="Sign Out" OnClick="signOut" CssClass="btn btn-back" />

            <!-- Admin Function Buttons -->
            <asp:Button ID="Button1" runat="server" OnClick="EmplyeeDetailsButton" Text="Employee Details" CssClass="btn" />
            <asp:Button ID="Button2" runat="server" OnClick="DepartmentCountButton" Text="Number Of Employees Per Department" CssClass="btn" />
            <asp:Button ID="Button3" runat="server" OnClick="RejectedMedicalsButton" Text="Rejected Medical Leaves" CssClass="btn" />
            <asp:Button ID="Button4" runat="server" OnClick="RemoveResigned" Text="Remove Deductions of Resigned Employees" CssClass="btn" />
            <asp:Button ID="Button5" runat="server" OnClick="UpdateAttendance" Text="Update Today's Attendance" CssClass="btn" />
            <asp:Button ID="Button6" runat="server" OnClick="AddHoliday" Text="Add Official Holiday" CssClass="btn" />
            <asp:Button ID="Button7" runat="server" OnClick="InitiateAttendance" Text="Initiate Today's Attendance" CssClass="btn" />
            <asp:Button ID="Button9" runat="server" OnClick="GoToAttendanceTools" Text="Attendance Tools" CssClass="btn" />
            <asp:Button ID="Button10" runat="server" Text="Winter Performance" OnClick="GoToWinterPerformance" CssClass="btn" />
            <asp:Button ID="Button11" runat="server" Text="Yesterday's Attendance" OnClick="GoToYesterdaysAttendance" CssClass="btn" />

            <!-- Warning Label -->
            <asp:Label ID="WarningLabel" runat="server" CssClass="auto-style1" Visible="false"></asp:Label>
        </div>
    </form>
</body>
</html>
