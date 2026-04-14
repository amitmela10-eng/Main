<%@ Page Title="התחברות" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="eurovision.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="glass-card form-container">
        <h1>התחברות</h1>
        <p style="margin-bottom: 20px; text-align: center; color: var(--text-muted);">התחבר כדי להצביע לשירים האהובים עליך</p>
        
        <div class="form-group">
            <label for="txtEmail">אימייל</label>
            <asp:TextBox ID="txtEmail" runat="server" CssClass="input-box" placeholder="example@email.com"></asp:TextBox>
        </div>
        
        <div class="form-group">
            <label for="txtPassword">סיסמה</label>
            <asp:TextBox ID="txtPassword" runat="server" CssClass="input-box" TextMode="Password" placeholder="הכנס סיסמה"></asp:TextBox>
        </div>
        
        <asp:Label ID="lblMessage" runat="server" CssClass="message" Style="display: block; margin-bottom: 15px;"></asp:Label>
        
        <asp:Button ID="btnLogin" runat="server" Text="התחבר" CssClass="btn-primary" OnClick="btnLogin_Click" />
        
        <div style="margin-top: 20px; text-align: center;">
            <p>עדיין אין לך חשבון? <a href="register.aspx" style="color: var(--accent); font-weight: bold;">הירשם כאן</a></p>
        </div>
    </div>
</asp:Content>
