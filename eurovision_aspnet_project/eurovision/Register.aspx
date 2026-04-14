<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Register.aspx.cs" Inherits="RegisterWebForm.Register" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="glass-card form-container">
        <h1>הרשמה לאתר</h1>
        <p style="margin-bottom: 20px; text-align: center; color: var(--text-muted);">הצטרפו לקהילת המצביעים שלנו</p>

        <div class="form-group">
            <label>שם פרטי</label>
            <asp:TextBox ID="txtFirstName" runat="server" CssClass="input-box"></asp:TextBox>
            <asp:RequiredFieldValidator 
                ID="rfvFirstName" 
                runat="server" 
                ControlToValidate="txtFirstName"
                ErrorMessage="יש להזין שם"
                CssClass="message error">
            </asp:RequiredFieldValidator>
        </div>

        <div class="form-group">
            <label>שם משפחה</label>
            <asp:TextBox ID="txtLastName" runat="server" CssClass="input-box"></asp:TextBox>
            <asp:RequiredFieldValidator 
                ID="rfvLastName" 
                runat="server" 
                ControlToValidate="txtLastName"
                ErrorMessage="יש להזין שם משפחה"
                CssClass="message error">
            </asp:RequiredFieldValidator>
        </div>

        <div class="form-group">
            <label>אימייל</label>
            <asp:TextBox ID="txtEmail" runat="server" CssClass="input-box" TextMode="Email"></asp:TextBox>
            <asp:RequiredFieldValidator 
                ID="rfvEmail" 
                runat="server" 
                ControlToValidate="txtEmail"
                ErrorMessage="יש להזין אימייל"
                CssClass="message error">
            </asp:RequiredFieldValidator>
        </div>

        <div class="form-group">
            <label>סיסמה</label>
            <asp:TextBox ID="txtPassword" runat="server" CssClass="input-box" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator 
                ID="rfvPassword" 
                runat="server" 
                ControlToValidate="txtPassword"
                ErrorMessage="יש להזין סיסמה"
                CssClass="message error">
            </asp:RequiredFieldValidator>
        </div>

        <asp:Button ID="btnRegister" runat="server" Text="הירשם עכשיו" CssClass="btn-primary" OnClick="btnRegister_Click" />

        <asp:Label ID="lblMessage" runat="server" CssClass="message" Style="display: block; margin-top: 15px;"></asp:Label>
        
        <div style="margin-top: 20px; text-align: center;">
            <p>כבר רשום? <a href="Login.aspx" style="color: var(--accent); font-weight: bold;">היכנס כאן</a></p>
        </div>
    </div>
</asp:Content>