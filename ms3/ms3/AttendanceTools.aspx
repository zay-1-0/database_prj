<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="AttendanceTools.aspx.cs"
    Inherits="ms3.AttendanceTools" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Attendance Tools</title>

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
            margin: 10px 0;
            width: 100%;
            transition: all 0.3s ease;
            box-shadow: 0 6px 15px rgba(0,0,0,0.15);
        }

        .btn-main:hover {
            background: #274bb8;
            transform: translateY(-3px);
            box-shadow: 0 10px 20px rgba(0,0,0,0.25);
        }

        .small-note {
            margin-top: 20px;
            font-size: 13px;
            color: #555;
        }

        @keyframes fadeIn {
            0% { opacity: 0; transform: translateY(-20px); }
            100% { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>

<body>
    <form id="form2" runat="server">

        <div class="container">

            <asp:Button ID="BackButton" runat="server"
                Text="Back to Home"
                CssClass="btn-back"
                OnClick="GoBack" />

            <h2>Attendance Maintenance Tools</h2>

            <asp:Button ID="btnGoRemoveHoliday" runat="server"
                Text="Remove Attendance on Official Holidays"
                CssClass="btn-main"
                OnClick="btnGoRemoveHoliday_Click" />

            <asp:Button ID="btnGoRemoveDayOff" runat="server"
                Text="Remove Unattended Day Off (Current Month)"
                CssClass="btn-main"
                OnClick="btnGoRemoveDayOff_Click" />

            <asp:Button ID="btnGoRemoveApprovedLeaves" runat="server"
                Text="Remove Approved Leaves from Attendance"
                CssClass="btn-main"
                OnClick="btnGoRemoveApprovedLeaves_Click" />

            <asp:Button ID="btnGoReplaceEmployee" runat="server"
                Text="Replace One Employee with Another"
                CssClass="btn-main"
                OnClick="btnGoReplaceEmployee_Click" />

            <asp:Button ID="btnGoUpdateEmploymentStatus" runat="server"
                Text="Update Employment Status for Employee"
                CssClass="btn-main"
                OnClick="btnGoUpdateEmploymentStatus_Click" />

            <div class="small-note">
                Use these tools to clean and update attendance and employment status.
            </div>

        </div>

    </form>
</body>
</html>
