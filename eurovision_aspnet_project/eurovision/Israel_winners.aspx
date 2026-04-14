<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Israel_winners.aspx.cs" Inherits="eurovision.Israel_winners" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h1>🏆 הזוכים הישראליים באירוויזיון</h1>
    
    <div class="winners-grid">
        <div class="winner-card">
            <img src="https://images1.ynet.co.il/PicServer5/2018/05/08/8519772/85197655921299980551no.jpg" alt="נטע ברזילי" class="winner-image">
            <div class="winner-content">
                <div class="winner-header">
                    <h2 class="winner-name">נטע ברזילי</h2>
                    <span class="win-year">2018</span>
                </div>
                <div class="info-grid" style="margin: 15px 0;">
                    <p><strong>שיר:</strong> Toy</p>
                    <p><strong>מקום האירוח:</strong> ליסבון, פורטוגל</p>
                </div>
                <div class="fun-fact" style="font-size: 0.9rem; color: var(--text-muted); border-top: 1px solid var(--glass-border); padding-top: 10px;">
                    נטע שילבה קולות של תרנגולת כדי ללעוג לבריונות, והשימוש שלה ב"לופר" שינה את חוקי המשחק בתחרות.
                </div>
            </div>
        </div>

        <div class="winner-card">
            <img src="https://www.euromix.co.il/wp-content/uploads/2020/01/Dana-International-Winner-Eurovision-1998-1.jpg" alt="דנה אינטרנשיונל" class="winner-image">
            <div class="winner-content">
                <div class="winner-header">
                    <h2 class="winner-name">דנה אינטרנשיונל</h2>
                    <span class="win-year">1998</span>
                </div>
                <div class="info-grid" style="margin: 15px 0;">
                    <p><strong>שיר:</strong> דיווה (Diva)</p>
                    <p><strong>מקום האירוח:</strong> ברמינגהאם, בריטניה</p>
                </div>
                <div class="fun-fact" style="font-size: 0.9rem; color: var(--text-muted); border-top: 1px solid var(--glass-border); padding-top: 10px;">
                    דנה הייתה הטרנסג'נדרית הראשונה שזכתה באירוויזיון, מה שהפך אותה לסמל עולמי של חופש וסובלנות.
                </div>
            </div>
        </div>

        <div class="winner-card">
            <img src="https://images.jpost.com/image/upload/f_auto,fl_lossy/c_fill,g_faces:center,h_537,w_822/586612" alt="גלי עטרי וחלב ודבש" class="winner-image">
            <div class="winner-content">
                <div class="winner-header">
                    <h2 class="winner-name">גלי עטרי וחלב ודבש</h2>
                    <span class="win-year">1979</span>
                </div>
                <div class="info-grid" style="margin: 15px 0;">
                    <p><strong>שיר:</strong> הללויה</p>
                    <p><strong>מקום האירוח:</strong> ירושלים, ישראל</p>
                </div>
                <div class="fun-fact" style="font-size: 0.9rem; color: var(--text-muted); border-top: 1px solid var(--glass-border); padding-top: 10px;">
                    ישראל זכתה פעמיים ברציפות (78' ו-79'), ובפעם הזו הניצחון קרה בבית, בירושלים! "הללויה" הפך להמנון של שלום.
                </div>
            </div>
        </div>

        <div class="winner-card">
            <img src="https://www.ynet.co.il/PicServer5/2018/01/03/8258370/82583120100099980657no.jpg" alt="יזהר כהן" class="winner-image">
            <div class="winner-content">
                <div class="winner-header">
                    <h2 class="winner-name">יזהר כהן</h2>
                    <span class="win-year">1978</span>
                </div>
                <div class="info-grid" style="margin: 15px 0;">
                    <p><strong>שיר:</strong> אבניבי (A-Ba-Ni-Bi)</p>
                    <p><strong>מקום האירוח:</strong> פריז, צרפת</p>
                </div>
                <div class="fun-fact" style="font-size: 0.9rem; color: var(--text-muted); border-top: 1px solid var(--glass-border); padding-top: 10px;">
                    זה היה הניצחון הראשון של ישראל אי פעם. כשירדן ראתה שישראל מנצחת, הם הפסיקו את השידור.
                </div>
            </div>
        </div>
    </div>
</asp:Content>
