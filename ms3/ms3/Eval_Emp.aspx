<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Eval_Emp.aspx.cs" Inherits="ms3.Dean_Pres_exc" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">

    <title>Employee Evaluation</title>

    <style>
        html, body {
            height: 100%;
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', Tahoma, sans-serif;
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
        }

        #form1 {
            height: 100%;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .evaluation-card {
            background-color: white;
            padding: 40px 50px;
            border-radius: 15px;
            width: 430px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.18);
            text-align: center;
            transition: transform .3s ease;
        }

        .evaluation-card:hover {
            transform: translateY(-5px);
        }

        .page-title {
            font-size: 24px;
            margin-bottom: 20px;
            font-weight: 700;
            color: #333;
            text-transform: uppercase;
            border-bottom: 2px solid #007bff;
            padding-bottom: 7px;
            display: inline-block;
        }

        .styled-dropdown,
        .styled-textbox {
            width: 100%;
            padding: 12px;
            margin-bottom: 18px;
            border-radius: 8px;
            border: 2px solid #dcdcdc;
            background: #fafafa;
            font-size: 15px;
            outline: none;
            transition: border .3s ease;
        }

        .styled-dropdown:focus,
        .styled-textbox:focus {
            border-color: #007bff;
        }

        .styled-button {
            width: 100%;
            padding: 12px;
            background: #007bff;
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: .3s;
            margin-top: 10px;
        }

        .styled-button:hover {
            background: #0056b3;
            transform: translateY(-2px);
        }

        .input-label {
            font-size: 15px;
            font-weight: 600;
            margin-bottom: 5px;
            display: block;
            text-align: left;
            color: #333;
        }

    </style>

</head>

<body>

    <form id="form1" runat="server">

        <div class="evaluation-card">

            <div class="page-title">Evaluate Employee</div>

            <!-- Employee Label + Dropdown -->
            <label class="input-label">Select Employee</label>
            <asp:DropDownList ID="ddlEmployees" runat="server" CssClass="styled-dropdown"></asp:DropDownList>

            <!-- Rating Label + Dropdown -->
            <label class="input-label">Rating (1–5)</label>
            <asp:DropDownList ID="ddlRating" runat="server" CssClass="styled-dropdown">
                <asp:ListItem Value="1">1</asp:ListItem>
                <asp:ListItem Value="2">2</asp:ListItem>
                <asp:ListItem Value="3">3</asp:ListItem>
                <asp:ListItem Value="4">4</asp:ListItem>
                <asp:ListItem Value="5">5</asp:ListItem>
            </asp:DropDownList>

            <!-- Comment Label + Textbox -->
            <label class="input-label">Comment</label>
            <asp:TextBox ID="txtComment" runat="server" CssClass="styled-textbox" TextMode="MultiLine" Rows="3" placeholder="Write a comment..."></asp:TextBox>

            <!-- Semester Label + Textbox -->
            <label class="input-label">Semester</label>
            <asp:TextBox ID="ddlSemester" runat="server" CssClass="styled-dropdown"></asp:TextBox>

            <!-- Submit Button -->
            <asp:Button ID="btnSubmit" runat="server" Text="Submit Evaluation" CssClass="styled-button" OnClick="btnSubmit_Click" />

            <!-- Back Button -->
            <asp:Button ID="HomeButton" runat="server" Text="Go to Home Page" CssClass="styled-button" OnClick="HomeButton_Click" />

        </div>

    </form>

</body>

</html>
