using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Net;
using System.Configuration;
using System.IO;
using System.Net.Mail;

namespace GroupTelFV
{
    public partial class joinGroup1 : System.Web.UI.Page
    {
        public int pidToDisplay;
        public string EndDateToDisplay;
        public string paypalPrice;

        protected void Page_Load(object sender, EventArgs e)
        { /*check if the user logged in and if not, redirect to login page*/
            if (Session["Login"] == null)
            {

                Response.Redirect("login.aspx");

            }

            int i;
            /*create a product display according to the data received from previous page*/
            int Pid = int.Parse("" + Request["Pid"]);
            Session["Pid"] = Pid;
            string Connstr = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|GroupTelDBNEW.mdf; Integrated Security=True;Connect Timeout=30";
            /*create a variable that holds the number of orders made for the product*/
            string Sql = $"select count(*) as total from T_order where pid = {Pid}";
           
            SqlConnection Conn = new SqlConnection(Connstr);
            Conn.Open();
            SqlCommand Cmd = new SqlCommand(Sql, Conn);
            int totalOrders = (int)Cmd.ExecuteScalar();
            Session["count"] = totalOrders;
            Conn.Close();

            /*create a list of orders and products from the GLOBAL file*/
            List<ProdList> tmp1 = (List<ProdList>)Application["LstProd"];
            List<ProdList> tmp2 = new List<ProdList>();
            for (i = 0; i < tmp1.Count; i++)
            {



                if (tmp1[i].Pid == Pid)
                {
                    ProdList pr1 = new ProdList()
                    {
                        Cid = tmp1[i].Cid,
                        Pdisc = tmp1[i].Pdisc,
                        Pid = tmp1[i].Pid,
                        PfinePrint = tmp1[i].PfinePrint,
                        Pname = tmp1[i].Pname,
                        Ppic = tmp1[i].Ppic,
                        Price = tmp1[i].Price,
                        Pquantity = tmp1[i].Pquantity,
                        Pquantity2 = tmp1[i].Pquantity2,
                        EndDate = tmp1[i].EndDate



                    };
                    
                    pidToDisplay = tmp1[i].Pid;
                    paypalPrice = tmp1[i].Price;
                    EndDateToDisplay = pr1.EndDate;
                    Session["Price"] = tmp1[i].Price;
                    Session["EndDate"] = tmp1[i].EndDate;
                    Session["Pname"] = tmp1[i].Pname;
                    Session["Ppic"] = tmp1[i].Ppic;
                    Session["Pid"] = tmp1[i].Pid;
                    Session["Pdisc"] = tmp1[i].Pdisc;
                    Session["Pfineprint"] = tmp1[i].PfinePrint;
                    Session["Pquantity2"] = tmp1[i].Pquantity2;
                    Session["Cid"] = tmp1[i].Cid;
                    Session["pquantity"] = tmp1[i].Pquantity;
                    tmp2.Add(pr1);
                           




                            if (tmp1[i].Pquantity > totalOrders && tmp1[i].Pquantity2 == 0)
                            {
                                LtlMsg.Text = "נותרו עוד:" + (tmp1[i].Pquantity - totalOrders) + " לרכישה " + " מתוך: " + tmp1[i].Pquantity;
                            }





                   



                }




                


                RptProd.DataSource = tmp2;
                    RptProd.DataBind();


                    //getting today date for timer

                    string date = DateTime.Now.ToString("MM-dd-yyyy");
                    string timer = $"var countDownDate = new Date('${date}')";
                    ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "timer", timer, true);

            }
        }
        protected void searchBtn_Click(object sender, EventArgs e)
        {
            Session["results"] = searchBox.Text;
            Response.Redirect("results.aspx");
        }

        protected void searchBtn_Click1(object sender, EventArgs e)
        {
            Session["results"] = searchBox.Text;
            Response.Redirect("results.aspx");
        }
    }

      

       
}
