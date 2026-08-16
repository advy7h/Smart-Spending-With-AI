<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Register.aspx.cs" UnobtrusiveValidationMode="None" Inherits="Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <title>User Registration | AI Finance Assistant</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;700&display=swap" rel="stylesheet"/>

    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #74b9ff, #0984e3);
            margin: 0;
            padding: 0;
        }

        .container {
            width: 100%;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .register-box {
            background: white;
            padding: 30px;
            width: 380px;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.2);
        }

        h2 {
            text-align: center;
            color: #0984e3;
            margin-bottom: 20px;
        }

        .form-group {
            margin-bottom: 15px;
        }

        label {
            font-weight: bold;
            display: block;
            margin-bottom: 5px;
        }

        input {
            width: 100%;
            padding: 10px;
            border-radius: 8px;
            border: 1px solid #ccc;
            font-size: 14px;
        }

        .btn-register {
            width: 100%;
            background-color: #0984e3;
            color: white;
            border: none;
            padding: 12px;
            font-size: 16px;
            border-radius: 8px;
            cursor: pointer;
        }

        .btn-register:hover {
            background-color: #0652dd;
        }

        .login-link {
            text-align: center;
            margin-top: 15px;
        }

        .login-link a {
            color: #0984e3;
            text-decoration: none;
            font-weight: bold;
        }
    </style>
</head>
<body>
     <form id="form1" runat="server">
         <asp:ScriptManager ID="ScriptManager1" runat="server" />
      <div class="container">
            <div class="register-box">
                <h2>Create Account</h2>

                <div class="form-group">
                    <label>Full Name</label>
                    <asp:TextBox ID="txtName" runat="server" placeholder="Enter your full name" required="required"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label>Email Address</label>
                    <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" placeholder="Enter your email" required="required"></asp:TextBox>
                     <asp:RequiredFieldValidator 
        ID="rfvEmail" 
        runat="server" 
        ControlToValidate="txtEmail"
        ErrorMessage="Email is required"
        ForeColor="Red" />

    <asp:RegularExpressionValidator 
        ID="revEmail" 
        runat="server" 
        ControlToValidate="txtEmail"
        ErrorMessage="Invalid Email Format"
        ValidationExpression="^[^@\s]+@[^@\s]+\.[^@\s]+$"
        ForeColor="Red" />
                </div>

                <div class="form-group">
                    <label>Phone Number</label>
                    <asp:TextBox ID="txtPhone" runat="server" TextMode="Phone" placeholder="Enter your phone number" required="required"></asp:TextBox>
                     <asp:RequiredFieldValidator 
        ID="rfvPhone" 
        runat="server" 
        ControlToValidate="txtPhone"
        ErrorMessage="Phone number is required"
        ForeColor="Red" />

    <asp:RegularExpressionValidator 
        ID="revPhone" 
        runat="server" 
        ControlToValidate="txtPhone"
        ErrorMessage="Enter valid 10-digit phone number"
        ValidationExpression="^[6-9]\d{9}$"
        ForeColor="Red" />
                </div>

                <div class="form-group">
                    <label>Password</label>
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" placeholder="Create password" required="required"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label>Confirm Password</label>
                    <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" placeholder="Confirm password" required="required"></asp:TextBox>
                    <asp:CompareValidator 
    ID="cvPassword" 
    runat="server"
    ControlToValidate="txtConfirmPassword"
    ControlToCompare="txtPassword"
    ErrorMessage="Passwords do not match"
    ForeColor="Red" />
                </div>

                <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="btn-register" OnClick="btnRegister_Click" />

                <div class="login-link">
                    Already have an account? <a href="LoginPage.aspx">Login</a>
                </div>

                <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
            </div>
        </div>

    </form>
</body>
</html>
