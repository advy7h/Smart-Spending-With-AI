<%@ Page Language="C#" AutoEventWireup="true" CodeFile="HomePage.aspx.cs" Inherits="HomePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>AI Finance Assistant | Smart Money Manager</title>

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

        /* Top Header */
        .top-header {
            background: linear-gradient(90deg, #0b2c3d, #0f4c75);
            color: #fff;
            padding: 8px 0;
            font-size: 14px;
            letter-spacing: 0.5px;
            text-align: center;
        }

        /* Navbar */
        .navbar {
            background: #0b2c3d;
        }

        .navbar-brand {
            font-weight: 700;
            font-size: 26px;
            color: #00e5ff !important;
        }

        /* Hero Section */
        .hero-section {
            position: relative;
            min-height: 85vh;
            background: url('https://images.unsplash.com/photo-1526304640581-d334cdbbf45e') center/cover no-repeat;
            display: flex;
            align-items: center;
            color: #fff;
        }

        .hero-overlay {
            position: absolute;
            inset: 0;
            background: rgba(11, 44, 61, 0.85);
        }

        .hero-content {
            position: relative;
            z-index: 2;
            text-align: center;
        }

        .hero-content h1 {
            font-size: 3.2rem;
            font-weight: 700;
        }

        .hero-content p {
            font-size: 1.2rem;
            opacity: 0.9;
            margin-top: 15px;
        }

        .btn-main {
            background: linear-gradient(135deg, #00e5ff, #00bcd4);
            color: #000;
            font-weight: 600;
            border-radius: 50px;
            padding: 12px 35px;
            transition: 0.3s ease;
        }

        .btn-main:hover {
            transform: translateY(-3px);
            box-shadow: 0 10px 30px rgba(0,229,255,0.4);
        }

        /* Sections */
        .section {
            padding: 80px 20px;
        }

        /* Cards */
        .premium-card {
            background: rgba(255,255,255,0.9);
            backdrop-filter: blur(8px);
            border-radius: 22px;
            padding: 40px 25px;
            box-shadow: 0 10px 40px rgba(0,0,0,0.08);
            transition: 0.35s ease;
            text-align: center;
            height: 100%;
        }

        .premium-card:hover {
            transform: translateY(-8px);
            box-shadow: 0 20px 50px rgba(0,0,0,0.15);
        }

        .premium-card i {
            font-size: 42px;
            color: #00bcd4;
            margin-bottom: 20px;
        }

        /* Steps */
        .step {
            background: #fff;
            border-radius: 20px;
            padding: 30px;
            box-shadow: 0 8px 25px rgba(0,0,0,0.08);
            font-weight: 500;
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
        Smart Spending With AI
    </div>

    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark">
        <div class="container">
            <a class="navbar-brand" href="HomePage.aspx"></a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#menu">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse justify-content-end" id="menu">
                <ul class="navbar-nav">
                    <li class="nav-item"><a class="nav-link" href="HomePage.aspx">Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="LoginPage.aspx">Login</a></li>
                    <li class="nav-item"><a class="nav-link" href="Register.aspx">Register</a></li>
                    <li class="nav-item"><a class="nav-link" href="About.aspx">About</a></li>
                    <li class="nav-item"><a class="nav-link" href="Contact.aspx">Contact</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Hero -->
    <section class="hero-section">
        <div class="hero-overlay"></div>
        <div class="container hero-content">
            <h1>Smart Spending With AI</h1>
            <p>
                Track income, control expenses, and grow your savings with intelligent financial insights.
            </p>
            <a href="Register.aspx" class="btn btn-main btn-lg mt-4">
                Get Started Today
            </a>
        </div>
    </section>

    <!-- About -->
    <section class="section bg-white">
        <div class="container text-center">
            <h2 class="fw-bold mb-4">About the Platform</h2>
            <p class="text-muted">
                Smart Spending with AI is a next-generation personal finance management system that uses
                Artificial Intelligence to analyze your spending habits, predict expenses, and provide
                smart financial guidance to help you achieve long-term financial stability.
            </p>
        </div>
    </section>

    <!-- Features -->
    <section class="section">
        <div class="container">
            <h2 class="text-center fw-bold mb-5">Premium Features</h2>
            <div class="row g-4">

                <div class="col-md-4">
                    <div class="premium-card">
                        <i class="bi bi-graph-up-arrow"></i>
                        <h5>AI Smart Budgeting</h5>
                        <p class="text-muted">
                            Automatically generate optimized budgets based on income and lifestyle.
                        </p>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="premium-card">
                        <i class="bi bi-wallet2"></i>
                        <h5>Expense Tracking</h5>
                        <p class="text-muted">
                            Track daily expenses in real-time with categorized financial insights.
                        </p>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="premium-card">
                        <i class="bi bi-lightbulb"></i>
                        <h5>AI Financial Advisor</h5>
                        <p class="text-muted">
                            Get personalized AI recommendations to save more and spend smarter.
                        </p>
                    </div>
                </div>

            </div>
        </div>
    </section>

    <!-- How It Works -->
    <section class="section bg-white">
        <div class="container text-center">
            <h2 class="fw-bold mb-5">How It Works</h2>
            <div class="row g-4">
                <div class="col-md-3"><div class="step">Create Account</div></div>
                <div class="col-md-3"><div class="step">Add Income</div></div>
                <div class="col-md-3"><div class="step">Track Expenses</div></div>
                <div class="col-md-3"><div class="step">Get AI Advice</div></div>
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
                        A premium AI-powered platform designed to transform the way you manage personal finances.
                    </p>
                </div>

                <div class="col-md-4 mb-3">
                    <h5>Quick Links</h5>
                    <ul class="list-unstyled">
                        <li><a href="HomePage.aspx">Home</a></li>
                        <li><a href="Login.aspx">Login</a></li>
                        <li><a href="Register.aspx">Register</a></li>
                        <li><a href="Contact.aspx">Contact</a></li>
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
                © 2025 smart spending AI | All Rights Reserved
            </div>
        </div>
    </footer>

</form>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>