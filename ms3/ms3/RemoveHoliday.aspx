<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="RemoveHoliday.aspx.cs"
    Inherits="University_HR_ManagementSystem.RemoveHoliday" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Remove Attendance on Holidays</title>

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
            width: 90%;
            max-width: 550px;
            animation: fadeIn 1s ease-in-out;
            text-align: center;
        }

        h2 {
            color: #1E3A8A;
            font-size: 28px;
            margin-bottom: 25px;
        }

        .btn-back {
            width: 100%;
            padding: 12px;
            font-size: 16px;
            font-weight: bold;
            border: none;
            border-radius: 12px;
            cursor: pointer;
            background: #FACC15;
            color: #1E3A8A;
            transition: all 0.3s ease;
            margin-bottom: 25px;
            box-shadow: 0 6px 15px rgba(0,0,0,0.2);
        }

        .btn-back:hover {
            background: #eab308;
            transform: translateY(-3px);
            box-shadow: 0 10px 20px rgba(0,0,0,0.3);
        }

        .btn-main {
            background: #1E3A8A;
            border: none;
            color: white;
            padding: 12px;
            border-radius: 12px;
            font-size: 16px;
            cursor: pointer;
            margin-top: 10px;
            width: 100%;
            transition: all 0.3s ease;
            box-shadow: 0 6px 15px rgba(0,0,0,0.15);
        }

        .btn-main:hover {
            background: #274bb8;
            transform: translateY(-3px);
            box-shadow: 0 10px 20px rgba(0,0,0,0.25);
        }

        .result-label {
            margin-top: 20px;
            font-size: 15px;
            display: block;
            font-weight: bold;
            color: #16a34a;
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

            <asp:Button ID="BackButton" runat="server"
                Text="Back to Home"
                CssClass="btn-back"
                OnClick="GoBack" />

            <h2>Remove Attendance Records on Official Holidays</h2>

            <asp:Button ID="btnRemoveHoliday" runat="server"
                Text="Remove Attendance on Holidays"
                CssClass="btn-main"
                OnClick="btnRemoveHoliday_Click" />

            <asp:Label ID="lblResult" runat="server"
                CssClass="result-label"></asp:Label>

        </div>

    </form>
</body>
</html>
