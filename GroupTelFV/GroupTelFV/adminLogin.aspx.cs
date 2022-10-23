using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GroupTelFV
{
    public partial class adminLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void RegButton_Click(object sender, EventArgs e)
        {
            /*check if the data entered in the textbox is the same as the data in database for login */
            string sql1 = $"select * from T_admin where Email='{identity.Text}' and pass='{UserPass.Text}'";
            string Connstr1 = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|GroupTelDBNEW.mdf; Integrated Security=True;Connect Timeout=30";
            SqlConnection Conn1 = new SqlConnection(Connstr1);
            Conn1.Open();
            SqlCommand Cmd1 = new SqlCommand(sql1, Conn1);
            SqlDataReader Dr1 = Cmd1.ExecuteReader();
            if (Dr1.Read())
            {
                User tmp = new User()
                {
                    Email = identity.Text,
                    
                };
                Session["Login"] = tmp;
                Session["UserEmail"] = identity.Text;
                


                Conn1.Close();
                Response.Redirect("adminDashBoard.aspx");

            }
            else
            {
                LtlLogin.Text = "<span style='color:red'>משתמש אינו רשום במערכת<span>";
                Conn1.Close();
            }
        }
    }
}