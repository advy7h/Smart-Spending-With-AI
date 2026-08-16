<%@ Page Language="C#" AutoEventWireup="true" CodeFile="About.aspx.cs" Inherits="About" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>About Us | Smart Spending with AI</title>

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

        /* Page Banner */
        .page-banner {
            background: url('https://images.unsplash.com/photo-1554224155-8d04cb21cd6c') center/cover no-repeat;
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

        /* Section */
        .section {
            padding: 80px 20px;
        }

        /* Cards */
        .info-card {
            background: #fff;
            border-radius: 22px;
            padding: 35px 25px;
            box-shadow: 0 10px 40px rgba(0,0,0,0.08);
            height: 100%;
            transition: 0.3s ease;
            text-align: center;
        }

        .info-card:hover {
            transform: translateY(-6px);
            box-shadow: 0 20px 50px rgba(0,0,0,0.15);
        }

        .info-card i {
            font-size: 40px;
            color: #00bcd4;
            margin-bottom: 15px;
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
            <h1 class="fw-bold">About Smart Spending with AI</h1>
            <p class="lead mt-3">
                Empowering individuals with intelligent financial management through AI
            </p>
        </div>
    </section>

    <!-- About Content -->
    <section class="section bg-white">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-md-6">
                    <h2 class="fw-bold mb-4">Who We Are</h2>
                    <p class="text-muted">
                        Smart Spending with AI is a modern, AI-driven personal finance management system
                        designed to help individuals gain full control over their income, expenses, and savings.
                        By leveraging intelligent algorithms, the platform analyzes user spending patterns
                        and delivers real-time insights and personalized financial recommendations.
                    </p>
                    <p class="text-muted">
                        Our mission is to simplify money management and promote financial discipline
                        through automation, transparency, and intelligent decision-making.
                    </p>
                </div>
                <div class="col-md-6 text-center">
                    <img src="https://images.unsplash.com/photo-1523958203904-cdcb402031fd"
                         class="img-fluid rounded-4 shadow"
                         alt="Finance Analytics" />
                </div>
            </div>
        </div>
    </section>

    <!-- Vision / Mission -->
    <section class="section">
        <div class="container">
            <div class="row g-4">

                <div class="col-md-4">
                    <div class="info-card">
                        <i class="bi bi-bullseye"></i>
                        <h5>Our Mission</h5>
                        <p class="text-muted">
                            To provide an intelligent and user-friendly platform that helps individuals
                            manage their finances efficiently using AI-powered insights.
                        </p>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="info-card">
                        <i class="bi bi-eye"></i>
                        <h5>Our Vision</h5>
                        <p class="text-muted">
                            To become a trusted digital finance companion that promotes smarter financial
                            decisions for everyone.
                        </p>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="info-card">
                        <i class="bi bi-shield-check"></i>
                        <h5>Security First</h5>
                        <p class="text-muted">
                            We ensure data confidentiality using secure authentication, encryption,
                            and role-based access control.
                        </p>
                    </div>
                </div>

            </div>
        </div>
    </section>

    <!-- Why Choose Us -->
    <section class="section bg-white">
        <div class="container text-center">
            <h2 class="fw-bold mb-5">Why Choose Us?</h2>
            <div class="row g-4">

                <div class="col-md-3">
                    <div class="info-card">
                        <i class="bi bi-cpu"></i>
                        <h6>AI-Driven Insights</h6>
                    </div>
                </div>

                <div class="col-md-3">
                    <div class="info-card">
                        <i class="bi bi-speedometer2"></i>
                        <h6>Fast & Efficient</h6>
                    </div>
                </div>

                <div class="col-md-3">
                    <div class="info-card">
                        <i class="bi bi-lock"></i>
                        <h6>Secure Platform</h6>
                    </div>
                </div>

                <div class="col-md-3">
                    <div class="info-card">
                        <i class="bi bi-people"></i>
                        <h6>User-Friendly Design</h6>
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
                        An AI-powered personal finance management platform designed for smarter living.
                    </p>
                </div>

                <div class="col-md-4 mb-3">
                    <h5>Quick Links</h5>
                    <ul class="list-unstyled">
                        <li><a href="HomePage.aspx">Home</a></li>
                        <li><a href="LoginPage.aspx">Login</a></li>
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
                © 2025 Smart Spending with AI | All Rights Reserved
            </div>
        </div>
    </footer>

</form>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
 </html>