<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="eurovision._Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h1>ברוכים הבאים לאירוויזיון</h1>

        <p class="intro-text">
            באתר זה תוכלו להכיר את תחרות האירוויזיון - אחת מתחרויות השירה הגדולות והנצפות בעולם.
            האירוויזיון מאפשר למדינות מאירופה לייצג את עצמן דרך שירים מקוריים, הופעות ייחודיות ומסרים שונים.
            מעבר לתחרות, האירוויזיון הוא גם חגיגה של מוזיקה, תרבויות ויצירות שמחברת בין אנשים מכל העולם.
        </p>

        <img src="img/pic1.jpg" id="bigPic" class="big-preview" alt="תמונה גדולה">

        <div class="thumb-row">
            <img src="img/pic1.jpg" alt="תמונה 1" onmouseover="showPic('img/pic1.jpg')">
            <img src="img/pic2.jpg" alt="תמונה 2" onmouseover="showPic('img/pic2.jpg')">
            <img src="img/pic3.jpg" alt="תמונה 3" onmouseover="showPic('img/pic3.jpg')">
            <img src="img/pic4.jpg" alt="תמונה 4" onmouseover="showPic('img/pic4.jpg')">
            <img src="img/pic5.jpg" alt="תמונה 5" onmouseover="showPic('img/pic5.jpg')">
            <img src="img/pic6.jpg" alt="תמונה 6" onmouseover="showPic('img/pic6.jpg')">
        </div>
    
    <script>
        function showPic(pic) {
            document.getElementById("bigPic").src = pic;
        }
    </script>

</asp:Content>
