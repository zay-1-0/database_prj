<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RemoveHoliday.aspx.cs" Inherits="University_HR_ManagementSystem.RemoveHoliday" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Remove Attendance on Holidays</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            background: #f4f4f8;
        }

        /* Center everything in the page */
        .page-wrapper {
            min-height: 100vh; /* full browser height */
            display: flex;
            justify-content: center; /* center left–right */
            align-items: center;    /* center up–down */
        }

        /* The white card in the middle */
        .card {
            background: white;
            padding: 30px 40px;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
            text-align: center;
            max-width: 500px;
            width: 100%;
        }

        .card h2 {
            margin-top: 0;
            margin-bottom: 20px;
            font-size: 26px;
            color: #333;
        }

        /* Cool button style */
        .btn-main {
            background: #4a6cf7;
            border: none;
            color: white;
            padding: 10px 22px;
            border-radius: 8px;
            font-size: 16px;
            cursor: pointer;
            transition: transform 0.1s ease, box-shadow 0.1s ease, background 0.2s ease;
        }

        .btn-main:hover {
            background: #3b57c4;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.15);
            transform: translateY(-1px);
        }

        .btn-main:active {
            transform: translateY(1px);
            box-shadow: none;
        }

        /* Result label */
        .result-label {
            margin-top: 20px;
            display: block;
            font-size: 14px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="page-wrapper">
            <div class="card">
                <h2>Remove Attendance Records on Official Holidays</h2>

                <asp:Button ID="btnRemoveHoliday" runat="server"
                    Text="Remove Attendance on Holidays"
                    CssClass="btn-main"
                    OnClick="btnRemoveHoliday_Click" />

                <asp:Label ID="lblResult" runat="server"
                    CssClass="result-label"
                    ForeColor="Green"></asp:Label>
            </div>
        </div>
    </form>
</body>
</html>