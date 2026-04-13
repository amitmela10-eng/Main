<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="songs_2026_list.aspx.cs" Inherits="eurovision.songs_2026_list" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>🎤 אירוויזיון 2026 - האזנה לשירים</h1>

<%--        <style>
        .vote-page {
            max-width: 1200px;
            margin: 30px auto;
            padding: 20px;
            direction: rtl;
            font-family: Arial, sans-serif;
        }

        .vote-title {
            text-align: center;
            font-size: 34px;
            margin-bottom: 10px;
            color: #222;
        }

        .vote-subtitle {
            text-align: center;
            font-size: 18px;
            color: #666;
            margin-bottom: 25px;
        }

        .vote-message {
            text-align: center;
            margin: 15px 0 25px 0;
            font-size: 18px;
            font-weight: bold;
        }

        .songs-table {
            width: 100%;
            border-collapse: collapse;
            background: white;
            box-shadow: 0 4px 16px rgba(0,0,0,0.08);
            border-radius: 12px;
            overflow: hidden;
        }

        .songs-table th {
            background: linear-gradient(90deg, #6a11cb, #2575fc);
            color: white;
            padding: 14px;
            font-size: 16px;
            text-align: center;
        }

        .songs-table td {
            border-bottom: 1px solid #eee;
            padding: 12px;
            text-align: center;
            vertical-align: middle;
        }

        .songs-table tr:hover {
            background-color: #f8f9ff;
        }

        .rank-select {
            padding: 8px;
            border-radius: 8px;
            border: 1px solid #ccc;
            min-width: 110px;
        }

        .points-label {
            font-weight: bold;
            color: #6a11cb;
            font-size: 16px;
        }

        .song-link {
            background: #2575fc;
            color: white !important;
            padding: 8px 14px;
            text-decoration: none;
            border-radius: 8px;
            display: inline-block;
            transition: 0.2s ease;
        }

        .song-link:hover {
            background: #184fb0;
        }

        .save-btn {
            display: block;
            margin: 25px auto 0 auto;
            padding: 12px 28px;
            font-size: 18px;
            border: none;
            border-radius: 10px;
            background: linear-gradient(90deg, #ff512f, #dd2476);
            color: white;
            cursor: pointer;
        }

        .save-btn:hover {
            opacity: 0.92;
        }

        .summary-box {
            margin-top: 30px;
            background: #faf7ff;
            border: 1px solid #e4d7ff;
            border-radius: 12px;
            padding: 20px;
        }

        .summary-box h3 {
            margin-top: 0;
            color: #5a189a;
        }

        .summary-box ul {
            margin: 0;
            padding-right: 20px;
        }

        .summary-box li {
            margin-bottom: 10px;
            font-size: 17px;
        }
    </style>--%>

    
        <h1 class="vote-title">🎤 הצבעה לשירי אירוויזיון 2026</h1>
        <div class="vote-subtitle">בחרי עד 3 שירים: מקום ראשון = 12 נקודות, שני = 10, שלישי = 8</div>
    <form id="form1" runat="server">

        <asp:Label ID="lblMessage" runat="server" CssClass="vote-message"></asp:Label>

        <asp:Repeater ID="rptSongs" runat="server" OnItemDataBound="rptSongs_ItemDataBound">
            <HeaderTemplate>
                <table class="songs-table">
                    <thead>
                        <tr>
                            <th>מדינה</th>
                            <th>מבצע/ת</th>
                            <th>שם השיר</th>
                            <th>קישור לשיר</th>
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
                        <asp:Label ID="lblCountry" runat="server" Text='<%# Eval("Country") %>'></asp:Label>
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
                        <asp:DropDownList ID="ddlRank" runat="server" CssClass="rank-select" AutoPostBack="true" OnSelectedIndexChanged="ddlRank_SelectedIndexChanged">
                            <asp:ListItem Text="ללא בחירה" Value="0"></asp:ListItem>
                            <asp:ListItem Text="מקום 1" Value="1"></asp:ListItem>
                            <asp:ListItem Text="מקום 2" Value="2"></asp:ListItem>
                            <asp:ListItem Text="מקום 3" Value="3"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:Label ID="lblPoints" runat="server" CssClass="points-label" Text="0"></asp:Label>
                    </td>
                </tr>
            </ItemTemplate>

            <FooterTemplate>
                    </tbody>
                </table>
            </FooterTemplate>
        </asp:Repeater>

        <asp:Button ID="btnSaveVotes" runat="server" Text="שמור הצבעה" CssClass="save-btn" OnClick="btnSaveVotes_Click" />

        <asp:Panel ID="pnlSummary" runat="server" CssClass="summary-box" Visible="false">
            <h3>סיכום הבחירות שלך</h3>
            <asp:Literal ID="litSummary" runat="server"></asp:Literal>
        </asp:Panel>
    </form>
</asp:Content>
