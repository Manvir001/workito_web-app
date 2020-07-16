using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using MySql.Data.MySqlClient;

namespace WebApplication_App
{
    public partial class _Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button_Login_Click1(object sender, EventArgs e)
        {
            MySqlConnection con = new MySqlConnection("user id=d304238;server=mysql02.fastname.no;database=d304238;persistsecurityinfo=True;password=2b9affd9");
            MySqlDataAdapter mda = new MySqlDataAdapter("Select count(*) From user Where id ='" + TextBoxUsername.Text + "' and password ='" + TextBoxPassword.Text + "'", con);
            DataTable dt = new DataTable();
            mda.Fill(dt);

            if(dt.Rows[0][0].ToString() == "1")
            {
                Session["USER_ID"] = TextBoxUsername.Text;
                Response.Redirect("Card.aspx");
            }
            else
            {
                Label_wrongP.Visible = true;

            }
        }
    }
}