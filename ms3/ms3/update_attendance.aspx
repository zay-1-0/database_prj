<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="update_attendance.aspx.cs" Inherits="ms3.update_attendance" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Update Attendance</title>
    <style>
        html, body {
            height: 100%;
            margin: 0;
            font-family: 'Poppins', Arial, sans-serif;
            background-color: #f0f4ff;
        }

        body {
            display: flex;
            justify-content: center;
            align-items: flex-start;
            padding: 30px;
        }

        .container {
            width: 100%;
            max-width: 900px; /* bigger than before */
            min-height: 600px; /* taller container */
            background-color: #ffffff;
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0 15px 35px rgba(0,0,0,0.2);
            box-sizing: border-box;
        }

        h2 {
            text-align: center;
            color: #1E3A8A;
            margin-bottom: 35px;
            font-size: 2.5em; /* bigger heading */
        }

        .btn-main {
            width: 100%;
            background-color: #4a6cf7;
            border: none;
            color: white;
            padding: 15px 0; /* taller button */
            border-radius: 12px;
            cursor: pointer;
            font-size: 18px; /* bigger font */
            font-weight: bold;
            margin-top: 20px;
            transition: all 0.3s ease;
        }

        .btn-main:hover {
            background-color: #3b57c4;
        }

        .form-row {
            margin: 20px 0; /* more space between fields */
        }

        label {
            font-weight: bold;
            color: #1E3A8A;
            margin-bottom: 10px;
            display: block;
            font-size: 1.2em; /* bigger labels */
        }

        asp\:TextBox, input[type="time"], input[type="text"] {
            width: 100%;
            padding: 14px; /* bigger inputs */
            border-radius: 12px;
            border: 1px solid #ccc;
            font-size: 18px; /* bigger font inside inputs */
            box-sizing: border-box;
        }

        .time-pair {
            display: flex;
            gap: 15px; /* more space between check-in/check-out */
        }

        .time-pair asp\:TextBox {
            flex: 1;
        }

        #WarningLabel {
            text-align: center;
            font-weight: bold;
            color: red;
            margin-top: 20px;
            font-size: 1.2em;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <asp:Button ID="backButton" runat="server" OnClick="goToAdminHomePage" Text="⟵ Back" CssClass="btn-main" />

            <h2>Update Attendance</h2>

            <div class="form-row">
                <label for="emp_id">Employee ID</label>
                <asp:TextBox ID="emp_id" runat="server"></asp:TextBox>
            </div>

            <div class="form-row">
                <label>Check-in & Check-out Time</label>
                <div class="time-pair">
                    <asp:TextBox ID="check_in" runat="server" TextMode="Time"></asp:TextBox>
                    <asp:TextBox ID="Check_out" runat="server" TextMode="Time"></asp:TextBox>
                </div>
            </div>

            <asp:Button ID="Button" runat="server" OnClick="updateAttendance" Text="Update" CssClass="btn-main" />

            <asp:Label ID="WarningLabel" runat="server" Text="" Visible="false"></asp:Label>
        </div>
    </form>
</body>
</html>
