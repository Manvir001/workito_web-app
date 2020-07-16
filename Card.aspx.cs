using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Data;


namespace WebApplication_App
{
    public partial class About : Page
    {

        MySqlConnection mysqlconn = new MySqlConnection("user id=d304238;server=mysql02.fastname.no;database=d304238;persistsecurityinfo=True;password=2b9affd9");


        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["USER_ID"] == null)
            {
                Response.Redirect("Default.aspx");
            }
            if (!IsPostBack)
            {
                DropDownProject();
                DropDownStatus();
                DropDownChangeCard();
            }

            GetCardInfoTodo();
            GetCardInfoDoing();
            GetCardInfoDone();
        }

        protected void Button_Logout_Click(object sender, EventArgs e)
        {
            Session.Remove("USER_ID");
            Session.RemoveAll();
            Response.Redirect("Default.aspx");
        }


        protected void Submit(Object sender, EventArgs e)
        {
            lblSuccessMessage.Visible = true;
            ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel();", true);
        }

        protected void DropDownChangeCard()
        {
            string com = "Select * from card";
            MySqlCommand mySqlcom = new MySqlCommand(com, mysqlconn);
            mysqlconn.Open();
            MySqlDataAdapter adpt = new MySqlDataAdapter(mySqlcom);
            DataTable dt = new DataTable();
            adpt.Fill(dt);
            DropDown_card.DataSource = dt;
            DropDown_card.DataBind();
            DropDown_card.DataTextField = "Name";
            DropDown_card.DataValueField = "id";
            DropDown_card.DataBind();
            DropDown_card.Items.Insert(0, new ListItem("--Select card--", "0"));

            mysqlconn.Close();
        }



        protected void DropDown_card_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DropDown_card.SelectedIndex > 0)
            {
                //mysqlconn.Open();
                int id = Convert.ToInt32(DropDown_card.SelectedValue);
                string com = "Select * from card WHERE id = " + id;
                MySqlCommand mySqlcom = new MySqlCommand(com, mysqlconn);
                mySqlcom.CommandType = CommandType.Text;
                MySqlDataAdapter adpt = new MySqlDataAdapter(mySqlcom);
                DataTable dt = new DataTable();
                adpt.Fill(dt);
                TextBox1.Text = dt.Rows[0].ItemArray[1].ToString();
                TextBox2.Text = dt.Rows[0].ItemArray[2].ToString();
                DropDownList_status1.Text = dt.Rows[0].ItemArray[3].ToString();
                DropDownList_project1.Text = dt.Rows[0].ItemArray[4].ToString();

                mysqlconn.Close();

            }
        }


        protected void DropDownProject()
        {

            string com = "Select * from project";
            MySqlCommand mySqlcom = new MySqlCommand(com, mysqlconn);
            mysqlconn.Open();
            MySqlDataAdapter adpt = new MySqlDataAdapter(mySqlcom);
            DataTable dt = new DataTable();
            adpt.Fill(dt);
            DropDownList_project.DataSource = dt;
            DropDownList_project.DataBind();
            DropDownList_project.DataTextField = "Name";
            DropDownList_project.DataValueField = "id";
            DropDownList_project.DataBind();

            DropDownList_project1.DataSource = dt;
            DropDownList_project1.DataBind();
            DropDownList_project1.DataTextField = "Name";
            DropDownList_project1.DataValueField = "id";
            DropDownList_project1.DataBind();

            mysqlconn.Close();
        }

        protected void DropDownStatus()
        {

            string com = "Select name from status";
            MySqlCommand mySqlcom = new MySqlCommand(com, mysqlconn);
            mysqlconn.Open();
            MySqlDataAdapter adpt = new MySqlDataAdapter(mySqlcom);
            DataTable dt = new DataTable();
            adpt.Fill(dt);
            DropDownList_status.DataSource = dt;
            DropDownList_status.DataBind();
            DropDownList_status.DataTextField = "Name";
            DropDownList_status.DataValueField = "name";
            DropDownList_status.DataBind();

            DropDownList_status1.DataSource = dt;
            DropDownList_status1.DataBind();
            DropDownList_status1.DataTextField = "Name";
            DropDownList_status1.DataValueField = "name";
            DropDownList_status1.DataBind();

            mysqlconn.Close();
        }



        protected void Btn_save_Click(object sender, EventArgs e)
        {

            //mysqlconn.Open();
            string query = "insert into card (name, description, Status_name,Project_id) values (@name,@description,@DropDownList_status,@DropDownList_project)";
            MySqlCommand sqlCmd = new MySqlCommand(query, mysqlconn);
            sqlCmd.Parameters.AddWithValue("@name", Txt_name.Text.Trim());
            sqlCmd.Parameters.AddWithValue("@description", Txt_description.Text.Trim());
            sqlCmd.Parameters.AddWithValue("@DropDownList_status", DropDownList_status.SelectedValue);
            sqlCmd.Parameters.AddWithValue("@DropDownList_project", DropDownList_project.SelectedValue);
            sqlCmd.ExecuteNonQuery();
            Clear();
            Response.Redirect("card.aspx");
            lblSuccessMessage.Text = "Submitted Successfully";
            lblSuccessMessage.Visible = true;
            ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel();", true);



            mysqlconn.Close();
        }

        //gets data from database and puts in the table
        void GetCardInfoTodo()
        {
            MySqlCommand cmd = new MySqlCommand();
            MySqlDataAdapter da = new MySqlDataAdapter();
            DataSet ds = new DataSet();
            mysqlconn.Open();
            string query = "Select * from card where Status_name = 'To_do'";
            cmd = new MySqlCommand(query, mysqlconn);
            da.SelectCommand = cmd;
            da.Fill(ds);
            datalist_todo.DataSource = ds;
            datalist_todo.DataBind();
        }

        void GetCardInfoDoing()
        {
            MySqlCommand cmd = new MySqlCommand();
            MySqlDataAdapter da = new MySqlDataAdapter();
            DataSet ds = new DataSet();
            //mysqlconn.Open();
            string query = "Select * from card where Status_name = 'Doing'";
            cmd = new MySqlCommand(query, mysqlconn);
            da.SelectCommand = cmd;
            da.Fill(ds);
            DataList_doing.DataSource = ds;
            DataList_doing.DataBind();
        }

        void GetCardInfoDone()
        {
            MySqlCommand cmd = new MySqlCommand();
            MySqlDataAdapter da = new MySqlDataAdapter();
            DataSet ds = new DataSet();
            //mysqlconn.Open();
            string query = "Select * from card where Status_name = 'Done'";
            cmd = new MySqlCommand(query, mysqlconn);
            da.SelectCommand = cmd;
            da.Fill(ds);
            DataList_done.DataSource = ds;
            DataList_done.DataBind();
        }
        protected void Btn_Delete_Card_Click(object sender, EventArgs e)
        {
            //mysqlconn.Open();
            MySqlCommand cmd = new MySqlCommand();
            string query = "delete FROM card WHERE id= '" + DropDown_card.SelectedValue + "'";
            cmd = new MySqlCommand(query, mysqlconn);
            cmd.ExecuteNonQuery();
            Response.Redirect("card.aspx");
            lblSuccessMessage1.Text = "Card is deleted";
            lblSuccessMessage1.Visible = true;
            ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel();", true);
            mysqlconn.Close();
        }


        protected void Btn_clear_Click(object sender, EventArgs e)
        {
            Clear();
            lblSuccessMessage.Text = "";
        }

        protected void Btn_clear_Click1(object sender, EventArgs e)
        {
            TextBox1.Text = TextBox2.Text = "";
            lblSuccessMessage1.Text = "";
        }


        //clears schema
        void Clear()
        {
            Txt_name.Text = Txt_description.Text = "";
        }





        protected void Btn_Save_Changes_Click(object sender, EventArgs e)
        {
            //mysqlconn.Open();
            MySqlCommand cmd = mysqlconn.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "Update card set name='" + TextBox1.Text + "',description='" + TextBox2.Text + "', Status_name='" + DropDownList_status1.Text + "',Project_id='" + DropDownList_project1.Text + "'  WHERE id='" + DropDown_card.SelectedValue + "'";
            cmd.ExecuteNonQuery();
            mysqlconn.Close();
            TextBox1.Text = "";
            TextBox2.Text = "";

            Response.Redirect("card.aspx");
            lblSuccessMessage1.Text = "Updated Successfully";
            lblSuccessMessage1.Visible = true;
            ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel();", true);
        }
    }
}

