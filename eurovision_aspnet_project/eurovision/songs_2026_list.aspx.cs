using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace eurovision
{
    public partial class songs_2026_list : System.Web.UI.Page
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserEmail"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }

            string userEmail = Session["UserEmail"].ToString();

            if (!IsPostBack)
            {
                if (HasUserAlreadyVoted(userEmail))
                {
                    ShowAlreadyVotedMessage();
                }
                else
                {
                    BindSongs();
                }
            }
        }

        private bool HasUserAlreadyVoted(string email)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT COUNT(*) FROM SongVotes WHERE UserEmail = @Email";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Email", email);
                    conn.Open();
                    int count = (int)cmd.ExecuteScalar();
                    return count > 0;
                }
            }
        }

        private void ShowAlreadyVotedMessage()
        {
            litMessage.Text = "<div class='alert-card'>שלום! כבר ביצעת הצבעה מחשבון זה. לא ניתן להצביע פעמיים.</div>";
            btnSaveVotes.Visible = false;
            rptSongs.Visible = false;
            pnlSummary.Visible = false;
        }

        private void BindSongs()
        {
            DataTable dt = new DataTable();

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = @"SELECT Id, Country, Artist, SongName, YouTubeLink
                                 FROM EurovisionSongs2026
                                 ORDER BY Country";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    da.Fill(dt);
                }
            }

            rptSongs.DataSource = dt;
            rptSongs.DataBind();
        }

        protected void rptSongs_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                DropDownList ddlRank = (DropDownList)e.Item.FindControl("ddlRank");
                Label lblPoints = (Label)e.Item.FindControl("lblPoints");

                UpdatePointsLabel(ddlRank, lblPoints);
            }
        }

        protected void ddlRank_SelectedIndexChanged(object sender, EventArgs e)
        {
            ValidateAndRefreshSelections((DropDownList)sender);
        }

        private void ValidateAndRefreshSelections(DropDownList changedDdl)
        {
            List<DropDownList> ddlList = new List<DropDownList>();
            int selectedCount = 0;

            foreach (RepeaterItem item in rptSongs.Items)
            {
                DropDownList ddl = (DropDownList)item.FindControl("ddlRank");
                Label lblPoints = (Label)item.FindControl("lblPoints");

                ddlList.Add(ddl);

                if (ddl.SelectedValue != "0")
                    selectedCount++;

                UpdatePointsLabel(ddl, lblPoints);
            }

            if (selectedCount > 3)
            {
                changedDdl.SelectedValue = "0";
                lblMessage.Text = "אפשר לבחור עד 3 שירים בלבד.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
            else
            {
                var selectedRanks = ddlList
                    .Where(d => d.SelectedValue != "0")
                    .Select(d => d.SelectedValue)
                    .ToList();

                bool hasDuplicates = selectedRanks.Count != selectedRanks.Distinct().Count();

                if (hasDuplicates)
                {
                    changedDdl.SelectedValue = "0";
                    lblMessage.Text = "אי אפשר לבחור את אותו דירוג פעמיים. כל מקום חייב להיות ייחודי.";
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                }
                else
                {
                    lblMessage.Text = "הבחירה תקינה.";
                    lblMessage.ForeColor = System.Drawing.Color.Green;
                }
            }

            foreach (RepeaterItem item in rptSongs.Items)
            {
                DropDownList ddl = (DropDownList)item.FindControl("ddlRank");
                Label lblPoints = (Label)item.FindControl("lblPoints");
                UpdatePointsLabel(ddl, lblPoints);
            }
        }

        private void UpdatePointsLabel(DropDownList ddlRank, Label lblPoints)
        {
            switch (ddlRank.SelectedValue)
            {
                case "1":
                    lblPoints.Text = "12";
                    break;
                case "2":
                    lblPoints.Text = "10";
                    break;
                case "3":
                    lblPoints.Text = "8";
                    break;
                default:
                    lblPoints.Text = "0";
                    break;
            }
        }

        protected void btnSaveVotes_Click(object sender, EventArgs e)
        {
            var votes = new List<VoteItem>();

            foreach (RepeaterItem item in rptSongs.Items)
            {
                HiddenField hfId = (HiddenField)item.FindControl("hfId");
                Label lblCountry = (Label)item.FindControl("lblCountry");
                Label lblSongName = (Label)item.FindControl("lblSongName");
                DropDownList ddlRank = (DropDownList)item.FindControl("ddlRank");

                if (ddlRank.SelectedValue != "0")
                {
                    votes.Add(new VoteItem
                    {
                        SongId = Convert.ToInt32(hfId.Value),
                        Country = lblCountry.Text,
                        SongName = lblSongName.Text,
                        Rank = Convert.ToInt32(ddlRank.SelectedValue),
                        Points = GetPointsByRank(Convert.ToInt32(ddlRank.SelectedValue))
                    });
                }
            }

            if (votes.Count == 0)
            {
                lblMessage.Text = "לא נבחרו שירים.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                pnlSummary.Visible = false;
                return;
            }

            if (votes.Count > 3)
            {
                lblMessage.Text = "אפשר לשמור עד 3 שירים בלבד.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                pnlSummary.Visible = false;
                return;
            }

            if (votes.Select(v => v.Rank).Distinct().Count() != votes.Count)
            {
                lblMessage.Text = "יש דירוג כפול. כל מקום חייב להיות חד פעמי.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                pnlSummary.Visible = false;
                return;
            }

            // אם תרצי לשמור למסד נתונים, כאן אפשר להוסיף INSERT לטבלת הצבעות

            StringBuilder sb = new StringBuilder();
            sb.Append("<ul>");

            foreach (var vote in votes.OrderBy(v => v.Rank))
            {
                sb.Append("<li>");
                sb.Append("מקום " + vote.Rank + ": " + vote.Country + " - " + vote.SongName + " (" + vote.Points + " נקודות)");
                sb.Append("</li>");
            }

            sb.Append("</ul>");

            litSummary.Text = sb.ToString();
            pnlSummary.Visible = true;
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                string userEmail = Session["UserEmail"].ToString();

                foreach (var vote in votes)
                {
                    string insertQuery = @"INSERT INTO SongVotes (SongId, RankPosition, Points, UserEmail)
                               VALUES (@SongId, @RankPosition, @Points, @UserEmail)";

                    using (SqlCommand cmd = new SqlCommand(insertQuery, conn))
                    {
                        cmd.Parameters.AddWithValue("@SongId", vote.SongId);
                        cmd.Parameters.AddWithValue("@RankPosition", vote.Rank);
                        cmd.Parameters.AddWithValue("@Points", vote.Points);
                        cmd.Parameters.AddWithValue("@UserEmail", userEmail);
                        cmd.ExecuteNonQuery();
                    }
                }
            }
            lblMessage.Text = "ההצבעה נשמרה בהצלחה.";
            lblMessage.ForeColor = System.Drawing.Color.Green;
            
            // Disable voting after successful submission
            ShowAlreadyVotedMessage();
            litMessage.Text = "<div class='alert-card' style='background:rgba(0, 255, 122, 0.1); border-color:#00ff7a;'>ההצבעה שלך נשלחה בהצלחה! תודה על השתתפותך.</div>";
        }

        private int GetPointsByRank(int rank)
        {
            switch (rank)
            {
                case 1: return 12;
                case 2: return 10;
                case 3: return 8;
                default: return 0;
            }
        }

        public class VoteItem
        {
            public int SongId { get; set; }
            public string Country { get; set; }
            public string SongName { get; set; }
            public int Rank { get; set; }
            public int Points { get; set; }
        }
    }
}