<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="WinterPerformance.aspx.cs"
    Inherits="ms3.WinterPerformance" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Winter Performance</title>

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
            width: 80%;
            max-width: 900px;
            animation: fadeIn 1s ease-in-out;
            text-align: center;
        }

        h2 {
            color: #1E3A8A;
            font-size: 28px;
            margin-bottom: 20px;
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

        #LabelInfoPerf {
            font-weight: bold;
            margin-bottom: 15px;
            display: block;
            color: #dc2626;
        }

        /* GridView Styling */
        .gridview table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            border-radius: 12px;
            overflow: hidden;
        }

        .gridview th {
            background-color: #1E3A8A;
            color: white;
            padding: 12px;
            font-size: 16px;
        }

        .gridview td {
            background-color: #f9fafb;
            padding: 12px;
            font-size: 15px;
            border-bottom: 1px solid #e5e7eb;
        }

        .gridview tr:hover td {
            background-color: #e0f2fe;
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

            <asp:Button ID="BackButton" runat="server" Text="Back to Home"
                CssClass="btn-back" OnClick="GoBack" />

            <h2>Employees Performance in All Winter Semesters</h2>

            <asp:Label ID="LabelInfoPerf" runat="server"></asp:Label>

            <div class="gridview">
                <asp:GridView ID="GridViewPerformance" runat="server"
                    AutoGenerateColumns="true"
                    GridLines="None">
                </asp:GridView>
            </div>

        </div>
    </form>
</body>
</html>
