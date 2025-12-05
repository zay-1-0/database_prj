<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Leaves.aspx.cs" Inherits="ms3.Employee_Page_2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Apply for Leaves</title>
    <style>
        /* 1. Reset and Base Styles */
        html, body {
            height: 100%;
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%); /* Cool gradient background */
        }

        /* 2. Center everything using Flexbox */
        #form1 {
            min-height: 100%;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
            box-sizing: border-box;
        }

        /* 3. The "Card" Container */
        .card-container {
            background-color: white;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2); /* Deep shadow */
            width: 100%;
            max-width: 900px; /* Increased width to allow all buttons on one row */
            text-align: center;
            transition: transform 0.3s ease;
        }

        .card-container:hover {
            transform: translateY(-5px); /* Subtle lift animation */
        }

        /* 4. Title Styling */
        .page-title {
            font-size: 24px;
            color: #333;
            margin-bottom: 35px;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 1px;
            border-bottom: 2px solid #007bff;
            padding-bottom: 10px;
            display: inline-block;
        }

        /* 5. Button Styling - SQUARE TILES */
        
        /* Container to arrange squares in a grid */
        .buttons-wrapper {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 15px; /* Space between squares */
        }

        /* Primary Action Buttons (Blue Squares) */
        .menu-button {
            width: 130px;          /* Fixed width */
            height: 130px;         /* Fixed height = Square */
            padding: 10px;
            margin: 0;             /* Reset margin, gap handles spacing */
            
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 12px;   /* Slight radius for modern look */
            font-size: 15px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 4px 6px rgba(0, 123, 255, 0.2);
            text-transform: capitalize;
            
            /* Center Text Vertically and Horizontally */
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
            white-space: normal;   /* Allow text to wrap */
            line-height: 1.3;
        }

        .menu-button:hover {
            background-color: #0056b3;
            box-shadow: 0 8px 15px rgba(0, 123, 255, 0.3);
            transform: translateY(-5px) scale(1.05); /* Pop effect */
        }

        /* Home Button (Secondary Gray - Rectangle) */
        /* If you add a home button, you might want it wide or square. 
           Here is a style to make it wide below the grid if needed. */
        .home-button {
            width: 100%;
            height: auto;
            margin-top: 25px;
            padding: 12px;
            background-color: #6c757d;
            box-shadow: 0 4px 6px rgba(108, 117, 125, 0.2);
        }

        .home-button:hover {
            background-color: #5a6268;
            box-shadow: 0 6px 12px rgba(108, 117, 125, 0.3);
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="card-container">
            <h1 class="page-title">Apply For a Leave</h1>
            
            <!-- Wrapper for Grid Layout -->
            <div class="buttons-wrapper">
                <asp:Button ID="App_Acc" runat="server" Text="Accidental Leave" OnClick="App_Acc_Click" CssClass="menu-button" />
                <asp:Button ID="App_Med" runat="server" Text="Medical Leave" OnClick="App_Med_Click" CssClass="menu-button" />
                <asp:Button ID="App_Unp" runat="server" Text="Unpaid Leave" OnClick="App_Unp_Click" CssClass="menu-button" />
                <asp:Button ID="App_Comp" runat="server" Text="Compensation Leave" OnClick="App_Comp_Click" CssClass="menu-button" />
                <asp:Button ID="App_Ann" runat="server" Text="Annual Leave" OnClick="App_Ann_Click" CssClass="menu-button" />
            </div>

            <!-- Optional Home Button -->
            <asp:Button ID="HomeButton" runat="server" Text="Go to Home Page" CssClass="menu-button home-button" OnClick="HomeButton_Click" /> 
        </div>
    </form>
</body>
</html>