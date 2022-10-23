using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;
using System.Web.Http;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;
using System.Net.Mail;
using System.Net;

namespace GroupTelFV
{
    public class Global : HttpApplication
    {
        void Application_Start(object sender, EventArgs e)
        {
            // Code that runs on application startup
           


            string sql1 = $"select * from T_order";
            string Connstr1 = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|GroupTelDBNEW.mdf; Integrated Security=True;Connect Timeout=30";
            SqlConnection Conn1 = new SqlConnection(Connstr1);
            Conn1.Open();
            SqlCommand cmdorder = new SqlCommand(sql1, Conn1);
            SqlDataReader Drorder = cmdorder.ExecuteReader();
            string tmpord = null, tmpord1 = null, tmpord2 = null, tmpord3 = null, tmpord4 = null,tmpord6=null;
            DateTime tmpord5 = DateTime.Now ;
            int tmpord7 = 0,tmpord8=0;
           //create a list of orders to be used througout the program
            List<OrderList> tmp1 = new List<OrderList>();
            Application["Lstorder"] = tmp1;
           
           


            while (Drorder.Read())
            {

                int Pid = (int)Drorder["Pid"];
                int Oid = (int)Drorder["Oid"];
                string Email = (string)(Drorder["Email"] + "");
                string Ppic = (string)(Drorder["Ppic"] + "");
                string Pname = (string)(Drorder["Pname"] + "");
                DateTime Odate =(DateTime)(Drorder["Odate"]);
                string Price = (string)(Drorder["Price"]+"");
                int Cid = (int)Drorder["Cid"];
                int pquantity2 = (int)Drorder["Pquantity2"];
                int clientPid = (int)Drorder["Pid"];
                string clientMail = (string)(Drorder["Email"] + "");

                
                OrderList Olist = new OrderList() { Oid = Oid, pid = Pid, Email = Email, Pname = Pname, Ppic = Ppic,
                    Odate=Odate, Price = Price, Cid=Cid, Pquantity2 = pquantity2  };
                tmp1.Add(Olist);
                tmpord += "Oid" + Drorder["Oid"];
                tmpord1 += "Pid:" + Drorder["Pid"];
                tmpord2 += "Email:" + Drorder["Email"];
                tmpord3 += "Pname" + Drorder["Pname"];
                tmpord4 += "Ppic" + Drorder["Ppic"];
                tmpord5 =  (DateTime)Drorder["Odate"];
                tmpord6 += "Price" + Drorder["Price"];
                tmpord7 = (int)Drorder["Cid"];
                tmpord8 = (int)Drorder["Pquantity2"];


            }
            Application["Lstorder"] = tmp1;
            
            Drorder.Close();


            AreaRegistration.RegisterAllAreas();
            GlobalConfiguration.Configure(WebApiConfig.Register);
            string sql = $"select * from T_Prod";
            string Connstr = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|GroupTelDBNEW.mdf; Integrated Security=True;Connect Timeout=30";
            SqlConnection Conn = new SqlConnection(Connstr);
            Conn.Open();
            SqlCommand cmdprod = new SqlCommand(sql, Conn);
            SqlDataReader Drprod = cmdprod.ExecuteReader();
            string tmprod = null, tmprod1 = null, tmprod2 = null, tmprod3 = null, tmprod4 = null, tmprod5 = null, tmprod6 = null, tmprod7 = null, tmprod8 = null, tmprod9 = null, tmprod10 = null;
            //create a list of products to be used througout the program

            List<ProdList> tmp = new List<ProdList>();
            Application["Prods"] = tmp;


            while (Drprod.Read())
            {
                int Pid = (int)Drprod["Pid"];
                int Cid = (int)Drprod["Cid"];
                string Price = (string)Drprod["Price"];
                string Pname = (string)Drprod["Pname"];
                string Ppic = (string)Drprod["Ppic"];
                string Pdisc = (string)Drprod["Pdisc"];
                int Pquantity = (int)Drprod["Pquantity"];
                int Pquantity2 = (int)Drprod["Pquantity2"];
                string PfinePrint = (string)Drprod["PfinePrint"];
                string EndDate = (string)Drprod["EndDate"];
                string menuCat = (string)Drprod["menuCat"];




                ProdList Plist = new ProdList() { Price = Price, Pname = Pname, Ppic = Ppic, Pdisc = Pdisc, Pquantity = Pquantity, PfinePrint = PfinePrint, Cid = Cid, Pid = Pid, EndDate = EndDate, Pquantity2 = Pquantity2, menuCat = menuCat };
                tmp.Add(Plist);
                tmprod += "Price:" + Drprod["Price"];
                tmprod1 += "Pname:" + Drprod["Pname"];
                tmprod2 += "Ppic:" + Drprod["Ppic"];
                tmprod3 += "Pdisc:" + Drprod["Pdisc"];
                tmprod4 += "Pquantity:" + Drprod["Pquantity"];
                tmprod5 += "PfinePrint:" + Drprod["PfinePrint"];
                tmprod6 += "Cid:" + Drprod["Cid"];
                tmprod7 += "Pid:" + Drprod["Pid"];
                tmprod8 += "EndDate:" + Drprod["EndDate"];
                tmprod9 += "Pquantity2:" + Drprod["Pquantity2"];
                tmprod10 += "menuCat:" + Drprod["menuCat"];



            }

            Application["LstProd"] = tmp;

            Drprod.Close();
            //check if the quantity of orders is exactly the amount of the quantity of the product and if so, send an email to 
            //the users in the purchace group, show a message that the group is closed, delete the paypal button and remove countdown
            for (int i = 0; i < tmp.Count; i++)
            {
                string Sql4 = $"select count(*) as total from T_order where pid = {tmp[i].Pid}";
                string Connstr4 = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|GroupTelDBNEW.mdf; Integrated Security=True;Connect Timeout=30";

                SqlConnection Conn4 = new SqlConnection(Connstr4);
                Conn4.Open();
                SqlCommand Cmd4 = new SqlCommand(Sql4, Conn4);
                int totalOrders = (int)Cmd4.ExecuteScalar();
                //Context.Session["count"] = totalOrders;
                Conn4.Close();
                DateTime end = DateTime.Parse(tmp[i].EndDate);
                if (tmp[i].Pquantity == totalOrders && tmp[i].Pquantity2 == 0 && end > DateTime.Today)
                {

                    string Sql3 = $"Update  T_Prod Set Pquantity2 = REPLACE( Pquantity2, 0, 1) WHERE Pid = {tmp[i].Pid}";
                    string Connstr3 = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|GroupTelDBNEW.mdf; Integrated Security=True;Connect Timeout=30";

                    SqlConnection Conn3 = new SqlConnection(Connstr3);
                    Conn3.Open();
                    SqlCommand Cmd3 = new SqlCommand(Sql3, Conn3);
                    Cmd3.ExecuteNonQuery();

                    Conn3.Close();


                    string Sql5 = $"Update  T_order Set Pquantity2 = REPLACE( Pquantity2, 0, 1) WHERE Pid = {tmp[i].Pid}";
                    string Connstr5 = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|GroupTelDBNEW.mdf; Integrated Security=True;Connect Timeout=30";

                    SqlConnection Conn5 = new SqlConnection(Connstr5);
                    Conn5.Open();
                    SqlCommand Cmd5 = new SqlCommand(Sql5, Conn5);
                    Cmd5.ExecuteNonQuery();


                    Conn5.Close();





                }


                //check if the quantity of orders is lower then the amount of the quantity of the product and if so, send an email to 
                //the users in the purchace group, show a message that the group is closed, delete the paypal button and remove countdown

                if (tmp[i].Pquantity > totalOrders && tmp[i].Pquantity2 == 0 && end < DateTime.Now)
                {
                    string Sql6 = $"Update  T_Prod Set Pquantity2 = REPLACE( Pquantity2, 0, 2) WHERE Pid = {tmp[i].Pid}";
                    string Connstr6 = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|GroupTelDBNEW.mdf; Integrated Security=True;Connect Timeout=30";

                    SqlConnection Conn6 = new SqlConnection(Connstr6);
                    Conn6.Open();
                    SqlCommand Cmd6 = new SqlCommand(Sql6, Conn6);
                    Cmd6.ExecuteNonQuery();

                    Conn6.Close();
                    string Sql7 = $"Update  T_order Set Pquantity2 = REPLACE( Pquantity2, 0, 2) WHERE Pid = {tmp[i].Pid}";
                    string Connstr7 = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|GroupTelDBNEW.mdf; Integrated Security=True;Connect Timeout=30";

                    SqlConnection Conn7 = new SqlConnection(Connstr7);
                    Conn7.Open();
                    SqlCommand Cmd7 = new SqlCommand(Sql7, Conn7);
                    Cmd7.ExecuteNonQuery();

                    Conn7.Close();

                }
            }



            string sql2 = $"select * from T_users";
            string Connstr2 = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|GroupTelDBNEW.mdf; Integrated Security=True;Connect Timeout=30";
            SqlConnection Conn2= new SqlConnection(Connstr2);
            Conn2.Open();
            SqlCommand cmduser = new SqlCommand(sql2, Conn2);
            SqlDataReader Druser = cmduser.ExecuteReader();
            string tmpusr = null, tmpusr1 = null, tmpusr2 = null, tmpusr3 = null, tmpusr4 = null;
           
            List<users> tmp2 = new List<users>();
            Application["LstUsers"] = tmp2;

            while (Druser.Read())
            {

                string Email = (string)Druser["Email"] + "";
                string Phone = (string)Druser["Phone"];
                string UserPass = (string)(Druser["UserPass"]);
                string UserName = (string)(Druser["UserName"]);
                string UserPass2 = (string)(Druser["UserPass2"]);





                users ulist = new users()
                {
                    Email = Email,
                    Phone = Phone,
                    UserPass = UserPass,
                    UserName = UserName,
                    UserPass2 = UserPass2,
                };
                tmp2.Add(ulist);
                tmpusr += "Email" + Druser["Email"];
                tmpusr1 += "Phone:" + Druser["Phone"];
                tmpusr2 += "UserPass:" + Druser["UserPass"];
                tmpusr3 += "UserName" + Druser["UserName"];
                tmpusr4 += "UserPass2" + Druser["UserPass2"];



            }
            Application["LstUsers"] = tmp2;
            Druser.Close();



            RouteConfig.RegisterRoutes(RouteTable.Routes);            
        }
    }
}