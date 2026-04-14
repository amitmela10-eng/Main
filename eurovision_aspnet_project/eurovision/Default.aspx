<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="eurovision._Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="glass-card">
        <h1>ברוכים הבאים לאירוויזיון 2026</h1>

        <p class="intro-text" style="margin-bottom: 30px; font-size: 1.2rem; color: var(--text-muted);">
            באתר זה תוכלו להכיר את תחרות האירוויזיון - אחת מתחרויות השירה הגדולות והנצפות בעולם.
            האירוויזיון מאפשר למדינות מאירופה לייצג את עצמן דרך שירים מקוריים, הופעות ייחודיות ומסרים שונים.
        </p>

        <div class="hero-section">
            <div class="main-display">
                <img src="img/pic1.jpg" id="bigPic" class="big-preview" alt="תמונה גדולה">
            </div>

            <div class="thumb-row">
                <img src="img/pic1.jpg" alt="תמונה 1" onmouseover="showPic('img/pic1.jpg')">
                <img src="img/pic2.jpg" alt="תמונה 2" onmouseover="showPic('img/pic2.jpg')">
                <img src="img/pic3.jpg" alt="תמונה 3" onmouseover="showPic('img/pic3.jpg')">
                <img src="img/pic4.jpg" alt="תמונה 4" onmouseover="showPic('img/pic4.jpg')">
                <img src="img/pic5.jpg" alt="תמונה 5" onmouseover="showPic('img/pic5.jpg')">
                <img src="img/pic6.jpg" alt="תמונה 6" onmouseover="showPic('img/pic6.jpg')">
            </div>
        </div>
    </div>
    
    <script>
        function showPic(pic) {
            document.getElementById("bigPic").src = pic;
        }
    </script>
</asp:Content>
