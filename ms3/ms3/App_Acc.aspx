<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="App_Acc.aspx.cs" Inherits="ms3.App_Acc" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Accidental Leave Application</title>

    <style>
        body {
            font-family: Arial;
            background: #f5f5f5;
        }
        .card {
            width: 400px;
            margin: 60px auto;
            padding: 25px;
            background: white;
            border-radius: 12px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.15);
            /* Ensure content inside aligns nicely */
            box-sizing: border-box;
        }
        h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #004b8d;
        }
        .input-label {
            font-weight: bold;
            font-size: 14px;
            display: block; /* Makes label block element */
            margin-bottom: 5px;
        }
        .date-input {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 14px;
            box-sizing: border-box; /* Ensures padding doesn't break width */
        }
        .btn-submit {
            width: 100%;
            padding: 10px;
            background: #0078D7;
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            cursor: pointer;
            transition: background 0.2s;
        }
        .btn-submit:hover {
            background: #005a9e;
        }

        /* --- New Style for Home Button --- */
        .btn-home {
            width: 100%;
            padding: 10px;
            background: #6c757d; /* Secondary Gray Color */
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            cursor: pointer;
            margin-top: 15px; /* Spacing between submit and home */
            transition: background 0.2s;
        }
        .btn-home:hover {
            background: #5a6268;
        }

        /* Spacing for the message */
        .message-area {
            margin-top: 15px;
            text-align: center;
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">
        <div class="card">
            <h2>Accidental Leave Application</h2>

            <!-- START DATE -->
            <label class="input-label">Start Date:</label>
            <asp:TextBox ID="calStart" runat="server" TextMode="Date" CssClass="date-input"></asp:TextBox>

            <!-- END DATE -->
            <label class="input-label">End Date:</label>
            <asp:TextBox ID="calEnd" runat="server" TextMode="Date" CssClass="date-input"></asp:TextBox>

            <!-- SUBMIT BUTTON -->
            <asp:Button ID="Acc_Submit" runat="server" Text="Submit" CssClass="btn-submit" OnClick="Acc_Submit_Click" />

            <!-- Message Area -->
            <div class="message-area">
                <asp:Literal ID="litMessage" runat="server"></asp:Literal>
            </div>

            <!-- HOME BUTTON (Now Styled) -->
            <asp:Button ID="HomeButton" runat="server" Text="Go to Home Page" CssClass="btn-home" OnClick="HomeButton_Click" />
        </div>
    </form>
</body>
</html>