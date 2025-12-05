<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="App_Med.aspx.cs" Inherits="ms3.App_Med" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Medical Leave Application</title>

    <style>
        /* Base styles for full height and centering (Matching theme) */
        html, body {
            height: 100%;
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
        }

        /* Flexbox for vertical and horizontal centering */
        #form1 {
            height: 100%;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        /* The central card container */
        .card {
            width: 500px; /* Slightly wider for multiple fields */
            padding: 40px;
            background: white;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
            box-sizing: border-box;
        }

        /* Title Styling */
        h2 {
            text-align: center;
            margin-bottom: 25px;
            color: #004b8d;
            font-size: 1.8em;
            border-bottom: 2px solid #007bff;
            padding-bottom: 10px;
        }

        /* Input Label and Grouping */
        .input-group {
            margin-bottom: 20px;
        }

        .input-label {
            font-weight: bold;
            font-size: 14px;
            display: block;
            margin-bottom: 5px;
            color: #333;
        }

        /* Styling for all ASP.NET textboxes/dropdowns */
        .date-input, .text-input, .dropdown-input {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 14px;
            box-sizing: border-box;
        }
        
        /* Checkbox styling */
        .checkbox-label {
            display: block;
            margin-top: 10px;
            margin-bottom: 20px;
            font-size: 14px;
        }

        /* Submit Button Styling */
        .btn-submit {
            width: 100%;
            padding: 12px;
            background: #28a745; /* Green for primary submit action */
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            cursor: pointer;
            transition: background 0.2s;
            margin-top: 15px;
        }
        .btn-submit:hover {
            background: #1e7e34;
        }

        /* Home Button Styling (Secondary Gray) */
        .btn-home {
            width: 100%;
            padding: 12px;
            background: #6c757d; /* Secondary Gray Color */
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            cursor: pointer;
            margin-top: 10px; 
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
            <h2>Medical Leave Application</h2>

            <!-- Start Date -->
            <div class="input-group">
                <label class="input-label">Start Date:</label>
                <asp:TextBox ID="txtStart" runat="server" TextMode="Date" CssClass="date-input"></asp:TextBox>
            </div>

            <!-- End Date -->
            <div class="input-group">
                <label class="input-label">End Date:</label>
                <asp:TextBox ID="txtEnd" runat="server" TextMode="Date" CssClass="date-input"></asp:TextBox>
            </div>

            <!-- Medical Type -->
            <div class="input-group">
                <label class="input-label">Type:</label>
                <asp:DropDownList ID="ddlType" runat="server" CssClass="dropdown-input">
                    <asp:ListItem Text="Select Type" Value="" />
                    <asp:ListItem Text="Sick" Value="Sick" />
                    <asp:ListItem Text="Maternity" Value="Maternity" />
                </asp:DropDownList>
            </div>

            <!-- Insurance Status -->
            <div class="input-group">
                <asp:CheckBox ID="chkInsurance" runat="server" Text="Has Insurance" CssClass="checkbox-label" />
            </div>

            <!-- Disability Details -->
            <div class="input-group">
                <label class="input-label">Disability Details:</label>
                <asp:TextBox ID="txtDisability" runat="server" TextMode="MultiLine" Rows="3" CssClass="text-input"></asp:TextBox>
            </div>

            <!-- Document Description -->
            <div class="input-group">
                <label class="input-label">Document Description:</label>
                <asp:TextBox ID="txtDocDesc" runat="server" CssClass="text-input"></asp:TextBox>
            </div>

            <!-- File Name (Likely placeholder for file upload or document link) -->
            <div class="input-group">
                <label class="input-label">File Name (For Reference):</label>
                <asp:TextBox ID="txtFileName" runat="server" CssClass="text-input"></asp:TextBox>
            </div>

            <!-- Submit Button -->
            <asp:Button ID="Med_Submit" runat="server" Text="Submit" OnClick="Med_Submit_Click" CssClass="btn-submit" />

            <!-- Message Area -->
            <div class="message-area">
                <asp:Literal ID="litMessage" runat="server"></asp:Literal>
            </div>
            
            <!-- Home Button -->
            <asp:Button ID="HomeButton" runat="server" Text="Go to Home Page" OnClick="HomeButton_Click" CssClass="btn-home" />

        </div>
    </form>
</body>
</html>