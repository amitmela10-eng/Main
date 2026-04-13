using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Text;

namespace RegisterWebForm
{
    public partial class Register : System.Web.UI.Page
    {
        // לוקחים את מחרוזת ההתחברות מתוך Web.config
        string connectionString = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            // Page_Load רץ בכל טעינה של העמוד
            // כרגע אין לנו צורך לשים כאן קוד
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            // קודם נבדוק אם כל הוולידציות עברו
            if (!Page.IsValid)
            {
                return;
            }

            // שומרים את הערכים מהטופס במשתנים
            string firstName = txtFirstName.Text.Trim();
            string lastName = txtLastName.Text.Trim();
            string email = txtEmail.Text.Trim();
            string password = txtPassword.Text;

            // בדיקה פשוטה לאורך סיסמה
            if (password.Length < 6)
            {
                lblMessage.Text = "הסיסמה חייבת להכיל לפחות 6 תווים";
                lblMessage.CssClass = "message error";
                return;
            }

            // מצפינים את הסיסמה
            string passwordHash = HashPassword(password);

            // יוצרים חיבור למסד הנתונים
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();

                // קודם בודקים אם כבר קיים משתמש עם אותו אימייל
                string checkQuery = "SELECT COUNT(*) FROM Users WHERE Email = @Email";
                using (SqlCommand checkCmd = new SqlCommand(checkQuery, con))
                {
                    checkCmd.Parameters.AddWithValue("@Email", email);

                    int count = (int)checkCmd.ExecuteScalar();

                    if (count > 0)
                    {
                        lblMessage.Text = "האימייל כבר קיים במערכת";
                        lblMessage.CssClass = "message error";
                        return;
                    }
                }

                // אם האימייל לא קיים, מכניסים את המשתמש החדש למסד
                string insertQuery = @"INSERT INTO Users (FirstName, LastName, Email, PasswordHash) 
                                       VALUES (@FirstName, @LastName, @Email, @PasswordHash)";

                using (SqlCommand cmd = new SqlCommand(insertQuery, con))
                {
                    cmd.Parameters.AddWithValue("@FirstName", firstName);
                    cmd.Parameters.AddWithValue("@LastName", lastName);
                    cmd.Parameters.AddWithValue("@Email", email);
                    cmd.Parameters.AddWithValue("@PasswordHash", passwordHash);

                    int rowsAffected = cmd.ExecuteNonQuery();

                    if (rowsAffected > 0)
                    {
                        lblMessage.Text = "נרשמת בהצלחה";
                        lblMessage.CssClass = "message success";

                        // מנקים את הטופס אחרי הצלחה
                        txtFirstName.Text = "";
                        txtLastName.Text = "";
                        txtEmail.Text = "";
                        txtPassword.Text = "";
                    }
                    else
                    {
                        lblMessage.Text = "אירעה שגיאה בשמירת הנתונים";
                        lblMessage.CssClass = "message error";
                    }
                }
            }
        }

        // פונקציה שמבצעת Hash לסיסמה
        // כלומר: לא שומרים את הסיסמה עצמה, אלא גרסה מוצפנת שלה
        private string HashPassword(string password)
        {
            using (SHA256 sha256 = SHA256.Create())
            {
                byte[] bytes = Encoding.UTF8.GetBytes(password);
                byte[] hash = sha256.ComputeHash(bytes);

                StringBuilder builder = new StringBuilder();

                foreach (byte b in hash)
                {
                    builder.Append(b.ToString("x2"));
                }

                return builder.ToString();
            }
        }
    }
}