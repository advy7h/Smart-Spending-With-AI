<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LoginPage.aspx.cs" Inherits="LoginPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <title>Login - Smart Finance Manager</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #6c5ce7, #0984e3);
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

        .login-box {
            background: #fff;
            padding: 35px;
            width: 350px;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.25);
        }

        h2 {
            text-align: center;
            color: #6c5ce7;
            margin-bottom: 25px;
        }

        .form-group {
            margin-bottom: 18px;
        }

        label {
            font-weight: bold;
            display: block;
            margin-bottom: 6px;
        }

        input {
            width: 100%;
            padding: 10px;
            border-radius: 8px;
            border: 1px solid #ccc;
            font-size: 14px;
        }

        .btn-login {
            width: 100%;
            background-color: #6c5ce7;
            color: white;
            border: none;
            padding: 12px;
            font-size: 16px;
            border-radius: 8px;
            cursor: pointer;
        }

        .btn-login:hover {
            background-color: #4834d4;
        }

        .links {
            text-align: center;
            margin-top: 15px;
        }

        .links a {
            text-decoration: none;
            color: #6c5ce7;
            font-weight: bold;
            margin: 0 5px;
        }

        .message {
            text-align: center;
            color: red;
            margin-top: 10px;
        }
    </style>
</head>
<body>
      <form id="form1" runat="server">
        <div class="container">
            <div class="login-box">
                <h2>User Login</h2>

                <div class="form-group">
                    <label>Email</label>
                    <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" placeholder="Enter your email" required="required"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label>Password</label>
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" placeholder="Enter your password" required="required"></asp:TextBox>
                </div>

                <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn-login" OnClick="btnLogin_Click" />

                <div class="links">
                    <a href="Register.aspx">Create Account</a> |
                    
                </div>

                <asp:Label ID="lblMessage" runat="server" CssClass="message"></asp:Label>
            </div>
        </div>
    </form>
</body>
</html>
