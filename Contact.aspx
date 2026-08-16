<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Contact.aspx.cs" Inherits="Contact" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Contact Us | Smart Spending with AI</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />

    <!-- Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet" />

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;700&display=swap" rel="stylesheet" />

    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: #f4f7fb;
        }

        /* Header */
        .top-header {
            background: linear-gradient(90deg, #0b2c3d, #0f4c75);
            color: #fff;
            padding: 8px 0;
            text-align: center;
            font-size: 14px;
        }

        .navbar {
            background: #0b2c3d;
        }

        .navbar-brand {
            font-weight: 700;
            font-size: 26px;
            color: #00e5ff !important;
        }

        /* Banner */
        .page-banner {
            background: url('https://images.unsplash.com/photo-1521791136064-7986c2920216') center/cover no-repeat;
            position: relative;
            padding: 120px 20px;
            color: white;
            text-align: center;
        }

        .banner-overlay {
            position: absolute;
            inset: 0;
            background: rgba(11, 44, 61, 0.85);
        }

        .banner-content {
            position: relative;
            z-index: 2;
        }

        /* Sections */
        .section {
            padding: 80px 20px;
        }

        /* Cards */
        .contact-card {
            background: #fff;
            border-radius: 22px;
            padding: 35px 25px;
            box-shadow: 0 10px 40px rgba(0,0,0,0.08);
            height: 100%;
            text-align: center;
        }

        .contact-card i {
            font-size: 40px;
            color: #00bcd4;
            margin-bottom: 15px;
        }

        /* Form */
        .form-control {
            border-radius: 15px;
            padding: 12px;
        }

        .btn-main {
            background: linear-gradient(135deg, #00e5ff, #00bcd4);
            color: #000;
            font-weight: 600;
            border-radius: 50px;
            padding: 12px 35px;
        }

        /* Footer */
        footer {
            background: #0b2c3d;
            color: #fff;
            padding: 60px 0 20px;
        }

        footer a {
            color: #00e5ff;
            text-decoration: none;
        }

        .footer-bottom {
            border-top: 1px solid rgba(255,255,255,0.15);
            margin-top: 25px;
            padding-top: 15px;
            text-align: center;
            font-size: 14px;
        }
    </style>
</head>

<body>
<form id="form1" runat="server">

    <!-- Top Header -->
    <div class="top-header">
        Smart Spending with AI
    </div>

    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark">
        <div class="container">
            <a class="navbar-brand" href="HomePage.aspx">Smart Spending with AI</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#menu">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse justify-content-end" id="menu">
                <ul class="navbar-nav">
                       <li class="nav-item"><a class="nav-link" href="HomePage.aspx">Home</a></li>
                       <li class="nav-item"><a class="nav-link active" href="About.aspx">About</a></li>
                       <li class="nav-item"><a class="nav-link" href="LoginPage.aspx">Login</a></li>
                       <li class="nav-item"><a class="nav-link" href="Register.aspx">Register</a></li>
                       <li class="nav-item"><a class="nav-link" href="Contact.aspx">Contact</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Banner -->
    <section class="page-banner">
        <div class="banner-overlay"></div>
        <div class="container banner-content">
            <h1 class="fw-bold">Contact Us</h1>
            <p class="lead mt-3">
                We’d love to hear from you. Let’s build smarter finance together.
            </p>
        </div>
    </section>

    <!-- Contact Info -->
    <section class="section bg-white">
        <div class="container">
            <div class="row g-4">

                <div class="col-md-4">
                    <div class="contact-card">
                        <i class="bi bi-envelope"></i>
                        <h5>Email</h5>
                        <p class="text-muted">ahammedirfanms@gmail.com </p>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="contact-card">
                        <i class="bi bi-telephone"></i>
                        <h5>Phone</h5>
                        <p class="text-muted">+91-9048457542</p>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="contact-card">
                        <i class="bi bi-geo-alt"></i>
                        <h5>Location</h5>
                        <p class="text-muted">India</p>
                    </div>
                </div>

            </div>
        </div>
    </section>

    <!-- Contact Form -->
    <section class="section">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-8">
                    <div class="contact-card">
                        <h3 class="fw-bold mb-4">Send Us a Message</h3>

                        <div class="row g-3">
                            <div class="col-md-6">
                                <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="Your Name"></asp:TextBox>
                            </div>

                            <div class="col-md-6">
                                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Your Email"></asp:TextBox>
                            </div>

                            <div class="col-md-12">
                                <asp:TextBox ID="txtSubject" runat="server" CssClass="form-control" placeholder="Subject"></asp:TextBox>
                            </div>

                            <div class="col-md-12">
                                <asp:TextBox ID="txtMessage" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="4" placeholder="Your Message"></asp:TextBox>
                            </div>

                            <div class="col-md-12 text-center mt-3">
                                <asp:Button ID="btnSend" runat="server" Text="Send Message" CssClass="btn btn-main btn-lg" />
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer>
        <div class="container">
            <div class="row">

                <div class="col-md-4 mb-3">
                    <h5>Smart Spending with AI</h5>
                    <p class="small">
                        Your trusted AI-powered personal finance management companion.
                    </p>
                </div>

                <div class="col-md-4 mb-3">
                    <h5>Quick Links</h5>
                    <ul class="list-unstyled">
                        <li><a href="HomePage.aspx">Home</a></li>
                        <li><a href="About.aspx">About</a></li>
                        <li><a href="Register.aspx">Register</a></li>
                        <li><a href="Login.aspx">Login</a></li>
                    </ul>
                </div>

                <div class="col-md-4 mb-3">
                    <h5>Contact</h5>
                    <p class="small">
                        Email: ahammedirfanms@gmail.com <br />
                        Phone: +91-9048457542
                    </p>
                </div>

            </div>

            <div class="footer-bottom">
                © 2025 Smart Spending with AI | All Rights Reserved
            </div>
        </div>
    </footer>

</form>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
