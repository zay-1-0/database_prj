<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AttendanceTools.aspx.cs" Inherits="ms3.AttendanceTools" %>

<!DOCTYPE html>







<html>
<head runat="server">
    <title>Attendance Tools</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            background: #f4f4f8;
        }

        .page-wrapper {
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .card {
            background: white;
            padding: 30px 40px;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
            text-align: center;
            max-width: 550px;
            width: 100%;
        }

        .card h2 {
            margin-top: 0;
            margin-bottom: 25px;
            font-size: 26px;
            color: #333;
        }

        .btn-main {
            background: #4a6cf7;
            border: none;
            color: white;
            padding: 10px 22px;
            border-radius: 8px;
            font-size: 15px;
            cursor: pointer;
            margin: 6px 0;
            width: 100%;
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

        .small-note {
            margin-top: 15px;
            font-size: 12px;
            color: #777;
        }

    </style>
</head>
<body>
    <form id="form2" runat="server">
        <div class="page-wrapper">
            <div class="card">
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
        </div>
    </form>
</body>
</html>