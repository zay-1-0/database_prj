<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RemoveDayoff.aspx.cs" Inherits="ms3.RemoveDayoff" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Remove Unattended Day Off</title>

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
            font-weight: 600;
            color: #1E3A8A;
            margin-bottom: 8px;
            display: block;
        }

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

        /* Main Button */
        .btn {
            width: 100%;
            padding: 14px;
            font-size: 16px;
            font-weight: bold;
            border: none;
            border-radius: 12px;
            cursor: pointer;
            background: linear-gradient(90deg, #1E3A8A, #60A5FA);
            color: white;
            transition: all 0.3s ease;
            box-shadow: 0 6px 15px rgba(0,0,0,0.2);
            margin-top: 10px;
        }

        .btn:hover {
            background: linear-gradient(90deg, #60A5FA, #1E3A8A);
            transform: translateY(-3px);
            box-shadow: 0 10px 20px rgba(0,0,0,0.3);
        }

        /* Back Button */
        .btn-back {
            background: #FACC15;
            margin-bottom: 25px;
        }

        .btn-back:hover {
            background: #eab308;
        }

        #lblResult {
            display: block;
            margin-top: 20px;
            font-size: 16px;
            text-align: center;
            font-weight: bold;
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

            <!-- BACK BUTTON -->
            <asp:Button ID="btnBack" runat="server" Text="⟵ Back"
                CssClass="btn btn-back" OnClick="btnBack_Click" />

            <h2>Remove Unattended Day Off – Current Month</h2>

            <!-- Employee Dropdown -->
            <label for="txtEmployeeId">Select Employee</label>
            <asp:DropDownList ID="txtEmployeeId" runat="server" CssClass="styled-input" AppendDataBoundItems="true">
                <asp:ListItem Text="-- Select Employee --" Value="" />
            </asp:DropDownList>

            <!-- Action Button -->
            <asp:Button ID="btnRemoveDayOff" runat="server"
                Text="Remove Unattended Day Off"
                CssClass="btn"
                OnClick="btnRemoveDayOff_Click" />

            <asp:Label ID="lblResult" runat="server" ForeColor="Green"></asp:Label>

        </div>
    </form>
</body>
</html>
