<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="songs_2026_list.aspx.cs" Inherits="eurovision.songs_2026_list" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="glass-card">
        <div class="page-header">
            <h1>הצבעה לשירים - אירוויזיון 2026</h1>
            <p>בחרו את השירים האהובים עליכם והצביעו!</p>
        </div>

        <asp:Literal ID="litMessage" runat="server"></asp:Literal>

        <div class="vote-subtitle" style="text-align: center; margin-bottom: 30px; color: var(--text-muted);">
            בחרי עד 3 שירים: מקום ראשון = 12 נקודות, שני = 10, שלישי = 8
        </div>

        <asp:Label ID="lblMessage" runat="server" CssClass="message" Style="display: block; margin-bottom: 20px; text-align: center;"></asp:Label>

        <asp:Repeater ID="rptSongs" runat="server" OnItemDataBound="rptSongs_ItemDataBound">
            <HeaderTemplate>
                <div style="overflow-x: auto;">
                <table class="songs-table">
                    <thead>
                        <tr>
                            <th>מדינה</th>
                            <th>מבצע/ת</th>
                            <th>שם השיר</th>
                            <th>האזנה</th>
                            <th>דירוג</th>
                            <th>ניקוד</th>
                        </tr>
                    </thead>
                    <tbody>
            </HeaderTemplate>

            <ItemTemplate>
                <tr>
                    <td>
                        <asp:HiddenField ID="hfId" runat="server" Value='<%# Eval("Id") %>' />
                        <asp:Label ID="lblCountry" runat="server" Text='<%# Eval("Country") %>' Font-Bold="true"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblArtist" runat="server" Text='<%# Eval("Artist") %>'></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblSongName" runat="server" Text='<%# Eval("SongName") %>'></asp:Label>
                    </td>
                    <td>
                        <a class="song-link" href='<%# Eval("YouTubeLink") %>' target="_blank">▶ האזנה</a>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlRank" runat="server" CssClass="input-box" Style="padding: 5px; min-width: 120px;" AutoPostBack="true" OnSelectedIndexChanged="ddlRank_SelectedIndexChanged">
                            <asp:ListItem Text="ללא בחירה" Value="0"></asp:ListItem>
                            <asp:ListItem Text="מקום 1" Value="1"></asp:ListItem>
                            <asp:ListItem Text="מקום 2" Value="2"></asp:ListItem>
                            <asp:ListItem Text="מקום 3" Value="3"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:Label ID="lblPoints" runat="server" CssClass="win-year" Text="0"></asp:Label>
                    </td>
                </tr>
            </ItemTemplate>

            <FooterTemplate>
                    </tbody>
                </table>
                </div>
            </FooterTemplate>
        </asp:Repeater>

        <div style="margin-top: 30px; text-align: center;">
            <asp:Button ID="btnSaveVotes" runat="server" Text="שמור הצבעה" CssClass="btn-primary" Style="max-width: 300px;" OnClick="btnSaveVotes_Click" />
        </div>

        <asp:Panel ID="pnlSummary" runat="server" CssClass="glass-card" Visible="false" Style="margin-top: 30px; background: rgba(106, 17, 203, 0.1);">
            <h3 style="color: var(--accent);">סיכום הבחירות שלך</h3>
            <asp:Literal ID="litSummary" runat="server"></asp:Literal>
        </asp:Panel>
    </div>
</asp:Content>
