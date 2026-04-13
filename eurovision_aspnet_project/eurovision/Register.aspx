<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Register.aspx.cs" Inherits="RegisterWebForm.Register" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <form id="form1" runat="server">
        <div>
            <h1>טופס רישום</h1>

            <div class="form-group">
                <label>שם</label>
                <asp:TextBox ID="txtFirstName" runat="server" CssClass="input-box"></asp:TextBox>
                <asp:RequiredFieldValidator 
                    ID="rfvFirstName" 
                    runat="server" 
                    ControlToValidate="txtFirstName"
                    ErrorMessage="יש להזין שם"
                    CssClass="validator">
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
                    CssClass="validator">
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
                    CssClass="validator">
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
                    CssClass="validator">
                </asp:RequiredFieldValidator>
            </div>

            <asp:Button ID="btnRegister" runat="server" Text="הירשמי" CssClass="btn" OnClick="btnRegister_Click" />

            <asp:Label ID="lblMessage" runat="server" CssClass="message"></asp:Label>
        </div>
    </form>
</asp:Content>