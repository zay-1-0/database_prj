<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddOfficialHoliday.aspx.cs" Inherits="ms3.AddOfficialHoliday" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add Official Holiday</title>
    <style>
        body {
            font-family: 'Poppins', Arial, sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(135deg, #1E3A8A, #60A5FA);
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        .container {
            background-color: #ffffff;
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0 15px 35px rgba(0,0,0,0.3);
            text-align: center;
            width: 420px;
            animation: fadeIn 1s ease-in-out;
        }

        h2 {
            color: #1E3A8A;
            font-size: 28px;
            margin-bottom: 30px;
        }

        label {
            display: block;
            font-weight: 600;
            color: #1E3A8A;
            margin-bottom: 8px;
            text-align: left;
        }

        .input-box, .date-input {
            width: 100%;
            padding: 12px;
            border: 1px solid #60A5FA;
            border-radius: 12px;
            margin-bottom: 18px;
            font-size: 16px;
            box-sizing: border-box;
        }

        .date-range {
            display: flex;
            gap: 15px;
        }

        .date-range .date-input {
            flex: 1;
        }

        .btn-main {
            width: 100%;
            padding: 12px;
            font-size: 16px;
            font-weight: bold;
            border: none;
            border-radius: 12px;
            cursor: pointer;
            background: linear-gradient(90deg, #1E3A8A, #60A5FA);
            color: white;
            transition: all 0.3s ease;
            margin-top: 10px;
            box-shadow: 0 6px 15px rgba(0,0,0,0.2);
        }

        .btn-main:hover {
            background: linear-gradient(90deg, #60A5FA, #1E3A8A);
            transform: translateY(-3px);
            box-shadow: 0 10px 20px rgba(0,0,0,0.3);
        }

        /* Yellow Sign Out Style (reused for Back button) */
        .btn-back {
            background: #FACC15;
            color: #1E3A8A;
        }

        .btn-back:hover {
            background: #eab308;
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

            <!-- Back Button -->
            <asp:Button ID="BackButton" 
                        runat="server" 
                        Text="Back to Home"
                        CssClass="btn-main btn-back"
                        OnClick="goToAdminHomePage" />

            <h2>Add Official Holiday</h2>

            <label for="emp_id">Holiday Name</label>
            <asp:TextBox ID="emp_id" runat="server" CssClass="input-box" />

            <div class="date-range">
                <asp:TextBox ID="check_in" runat="server" TextMode="Date" CssClass="date-input" />
                <asp:TextBox ID="Check_out" runat="server" TextMode="Date" CssClass="date-input" />
            </div>

            <asp:Button ID="AddButton" runat="server" Text="Add" OnClick="AddHoliday" CssClass="btn-main" />

            <asp:Label ID="WarningLabel" runat="server" Text="" />
        </div>
    </form>
</body>
</html>
