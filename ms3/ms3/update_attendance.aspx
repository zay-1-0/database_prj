<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="update_attendance.aspx.cs" Inherits="ms3.update_attendance" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Update Attendance</title>

    <style>
        body {
            font-family: 'Poppins', Arial, sans-serif;
            background: linear-gradient(135deg, #1E3A8A, #60A5FA);
            margin: 0;
            padding: 20px;
            display: flex;
            justify-content: center;
        }

        .container {
            width: 100%;
            max-width: 700px;
            background-color: #ffffff;
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0 15px 35px rgba(0,0,0,0.3);
            animation: fadeIn 1s ease-in-out;
        }

        h2 {
            text-align: center;
            color: #1E3A8A;
            margin-bottom: 30px;
            font-size: 28px;
        }

        label {
            display: block;
            font-weight: 600;
            color: #1E3A8A;
            margin-bottom: 8px;
        }

        /* Styled Input Fields & Dropdown */
        .styled-input {
            width: 100%;
            padding: 12px;
            border: 1px solid #60A5FA;
            border-radius: 12px;
            margin-bottom: 20px;
            font-size: 16px;
            background-color: #f9fafb;
            color: #1E3A8A;
            transition: all 0.3s ease;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
            box-sizing: border-box;
        }

        .styled-input:hover,
        .styled-input:focus {
            border-color: #1E3A8A;
            box-shadow: 0 6px 15px rgba(0,0,0,0.2);
            outline: none;
        }

        /* Buttons */
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
            margin-bottom: 30px;
        }

        .btn-back:hover {
            background: #eab308;
        }

        /* Check-in/Check-out pair */
        .time-pair {
            display: flex;
            gap: 15px;
        }

        .time-pair .styled-input {
            flex: 1;
        }

        #WarningLabel {
            display: block;
            margin-top: 20px;
            font-weight: bold;
            text-align: center;
            color: #dc2626;
            font-size: 16px;
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

            <!-- BACK BUTTON -->
            <asp:Button ID="backButton" runat="server" Text="⟵ Back"
                CssClass="btn btn-back" OnClick="goToAdminHomePage" />

            <h2>Update Attendance</h2>

            <!-- Employee Selection (NOW A DROPDOWN LIKE REFERENCE) -->
            <label for="emp_id">Select Employee</label>
            <asp:DropDownList ID="emp_id" runat="server" CssClass="styled-input" AppendDataBoundItems="true">
                <asp:ListItem Text="-- Select Employee --" Value="" />
            </asp:DropDownList>

            <!-- Check-in & Check-out -->
            <label>Check-in & Check-out Time</label>
            <div class="time-pair">
                <asp:TextBox ID="check_in" runat="server" TextMode="Time" CssClass="styled-input"></asp:TextBox>
                <asp:TextBox ID="Check_out" runat="server" TextMode="Time" CssClass="styled-input"></asp:TextBox>
            </div>

            <!-- Submit button -->
            <asp:Button ID="Button" runat="server" Text="Update"
                CssClass="btn" OnClick="updateAttendance" />

            <asp:Label ID="WarningLabel" runat="server" Text="" Visible="false" />

        </div>
    </form>
</body>
</html>
