<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdateEmploymentStatus.aspx.cs" Inherits="University_HR_ManagementSystem.UpdateEmploymentStatus" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Update Employment Status</title>

    <style>
        body { font-family: Arial, sans-serif; margin: 0; background: #f4f4f8; }

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
            max-width: 450px;
            width: 100%;
        }

        .card h2 {
            margin-top: 0;
            margin-bottom: 20px;
            font-size: 24px;
            color: #333;
        }

        .form-row {
            margin: 8px 0;
            text-align: left;
        }

        .form-row label {
            display: block;
            font-size: 14px;
            margin-bottom: 4px;
        }

        .form-row input {
            width: 100%;
            padding: 6px 8px;
            border-radius: 6px;
            border: 1px solid #ccc;
            box-sizing: border-box;
        }

        .btn-main {
            background: #4a6cf7;
            border: none;
            color: white;
            padding: 10px 22px;
            border-radius: 8px;
            font-size: 15px;
            cursor: pointer;
            margin-top: 12px;
            transition: transform 0.1s ease, box-shadow 0.1s ease, background 0.2s ease;
        }

        .btn-main:hover {
            background: #3b57c4;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.15);
            transform: translateY(-1px);
        }

        .result-label {
            margin-top: 15px;
            display: block;
            font-size: 14px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="page-wrapper">
            <div class="card">
                <h2>Update Employment Status for Employee</h2>

                <div class="form-row">
                    <label for="txtEmployeeId">Employee ID:</label>
                    <asp:TextBox ID="txtEmployeeId" runat="server"></asp:TextBox>
                </div>

                <asp:Button ID="btnUpdateStatus" runat="server"
                    Text="Update Status (Active / On Leave)"
                    CssClass="btn-main"
                    OnClick="btnUpdateStatus_Click" />

                <asp:Label ID="lblResult" runat="server"
                    CssClass="result-label"
                    ForeColor="Green"></asp:Label>
            </div>
        </div>
    </form>
</body>
</html>