<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddOfficialHoliday.aspx.cs" Inherits="ms3.AddOfficialHoliday" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add Official Holiday</title>
    <style>
        body {
            font-family: 'Poppins', Arial, sans-serif;
            background: linear-gradient(135deg, #1E3A8A, #60A5FA);
            margin: 0;
            padding: 20px;
            display: flex;
            justify-content: center;
            min-height: 100vh;
        }

        .container {
            max-width: 700px; /* Wider container */
            width: 100%;
            background-color: #ffffff;
            padding: 50px; /* More padding */
            border-radius: 20px;
            box-shadow: 0 15px 35px rgba(0,0,0,0.3);
            animation: fadeIn 1s ease-in-out;
        }

        h2 {
            text-align: center;
            color: #1E3A8A;
            margin-bottom: 40px; /* More space below heading */
            font-size: 28px;
        }

        label, asp\:Label {
            display: block;
            font-weight: 600;
            color: #1E3A8A;
            margin-bottom: 10px; /* More space below labels */
        }

        asp\:TextBox {
            width: 100%;
            padding: 14px; /* Bigger input padding */
            border: 1px solid #60A5FA;
            border-radius: 12px;
            margin-bottom: 25px; /* More space below inputs */
            font-size: 16px;
            box-sizing: border-box;
        }

        .date-range {
            display: flex;
            gap: 20px; /* More gap between date inputs */
            margin-bottom: 30px; /* More space below date inputs */
        }

        .date-range asp\:TextBox {
            flex: 1;
        }

        .btn-main {
            width: 100%;
            padding: 16px; /* Larger button */
            margin-top: 15px;
            margin-bottom: 15px; /* More space between buttons */
            font-size: 18px; /* Bigger text */
            font-weight: bold;
            border: none;
            border-radius: 12px;
            cursor: pointer;
            background: linear-gradient(90deg, #1E3A8A, #60A5FA);
            color: white;
            transition: all 0.3s ease;
            box-shadow: 0 6px 15px rgba(0,0,0,0.2);
        }

        .btn-main:hover {
            background: linear-gradient(90deg, #60A5FA, #1E3A8A);
            transform: translateY(-3px);
            box-shadow: 0 10px 20px rgba(0,0,0,0.3);
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
            <h2>Add Official Holiday</h2>

            <label for="emp_id">Holiday Name</label>
            <asp:TextBox ID="emp_id" runat="server"></asp:TextBox>

            <div class="date-range">
                <asp:TextBox ID="check_in" runat="server" TextMode="Date" />
                <asp:TextBox ID="Check_out" runat="server" TextMode="Date" />
            </div>

            <asp:Button ID="AddButton" runat="server" OnClick="AddHoliday" Text="Add" CssClass="btn-main" />

            <asp:Label ID="WarningLabel" runat="server" Text="" />
        </div>
    </form>
</body>
</html>
