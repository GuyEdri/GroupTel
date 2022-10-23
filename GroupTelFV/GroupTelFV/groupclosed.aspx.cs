using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GroupTelFV
{
    public partial class groupclosed : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        { /*check if the user logged in and if not, redirect to login page*/
            if (Session["Login"] == null)
            {

                Response.Redirect("login.aspx");

            }

            int i;
            int Pid = (int)Session["Pid"];

            /*check if the number of orders made for a product is the same as the quantity of the product that is allowed to sell and create a variable that holds that info*/
            string Connstr = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|GroupTelDBNEW.mdf; Integrated Security=True;Connect Timeout=30";
            string Sql = $"select count(*) as total from T_order where pid = {Pid}";
            SqlConnection Conn = new SqlConnection(Connstr);
            Conn.Open();
            SqlCommand Cmd = new SqlCommand(Sql, Conn);
            int totalOrders = (int)Cmd.ExecuteScalar();

            Conn.Close();


            List<ProdList> tmp1 = (List<ProdList>)Application["LstProd"];
            List<OrderList> tmp3 = (List<OrderList>)Application["Lstorder"];
            List<ProdList> tmp2 = new List<ProdList>();
            for (i = 0; i < tmp1.Count; i++)
            {

                /*create a display of the product*/

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


                    Session["closed"] = tmp1[i].Pquantity2;
                    Session["Pquantity"] = tmp1[i].Pquantity;
                    tmp2.Add(pr1);
                    break;
                   
                }
                   
            }
            RptProd.DataSource = tmp2;
            RptProd.DataBind();
            int quant = (int)Session["Pquantity"];
            LtlMsg.Text = " קבוצה סגורה, בקבוצה השתתפו  : " + (quant ) + "" + " אנשים ";





                int countMailsSent = 0;
                int closedGroup = (int)Session["closed"];
           
            
            //check if the group is closed and all the products in the group were purchase and if so, update the T+prod database in quantity2 send a mail to all the people who purcsed the product
            for (int r = 0; r < tmp3.Count; r++)
            {
                if (countMailsSent == quant)
                {
                    break;
                }
                else if (Pid == tmp3[r].pid && (string)Session["noBuyers"]=="no")
                {
                   
                    countMailsSent++;
                    

                   
                    string UserMail = tmp3[r].Email;
                    /*for mail NEW*/
                    string emailSender = "grouptelgroup@gmail.com".ToString();
                    string emailSenderPassword = "bjzcnmarlpsqrtfs".ToString();
                    string emailSenderHost = "smtp.gmail.com".ToString();
                    int emailSenderPort = Convert.ToInt16("587");
                    Boolean emailIsSSL = Convert.ToBoolean(ConfigurationManager.AppSettings["IsSSL"]);


                    string FilePath = @"H:\האחסון שלי\גרסה סופית לפרויקט- עדיין צריך לעשות דף מוצר\GroupTelFV\GroupTelFV\EmailTemplates\GroupClosed.html";
                    StreamReader str = new StreamReader(FilePath);
                    string MailText = str.ReadToEnd();
                    str.Close();
                    MailText = MailText.Replace("[newusername]", UserMail);
                    MailText = MailText.Replace("[Pname]", (string)Session["Pname"]);
                    MailText = MailText.Replace("[Price]", (string)Session["Price"]);
                    string img = @"H:\האחסון שלי\גרסה סופית לפרויקט- עדיין צריך לעשות דף מוצר\GroupTelFV\GroupTelFV\" + (string)Session["Ppic"];
                    MailText = MailText.Replace("[Pdisc]", (string)Session["Pdisc"]);
                    MailText = MailText.Replace("[Pfineprint]", (string)Session["Pfineprint"]);
                    string subject = "הקבוצה נסגרה! ברכות על רכישתכם";
                    //Base class for sending email  
                    MailMessage _mailmsg = new MailMessage();

                    //Make TRUE because our body text is html  
                    _mailmsg.IsBodyHtml = true;

                    //Set From Email ID  
                    _mailmsg.From = new MailAddress(emailSender);

                    //Set To Email ID  
                    _mailmsg.To.Add(UserMail);

                    //Set Subject  
                    _mailmsg.Subject = subject;

                    //Set Body Text of Email   
                    _mailmsg.Body = MailText;
                    //for image
                    AlternateView imgview = AlternateView.CreateAlternateViewFromString(_mailmsg.Body /*+ @"<img src= cid:imgpath height=150 width=150> "*/, null, "text/html");
                    LinkedResource lr = new LinkedResource(img);
                    lr.ContentId = "imgpath";
                    imgview.LinkedResources.Add(lr);
                    _mailmsg.AlternateViews.Add(imgview);


                    //Now set your SMTP   
                    SmtpClient _smtp = new SmtpClient();

                    //Set HOST server SMTP detail  
                    _smtp.Host = emailSenderHost;

                    //Set PORT number of SMTP  
                    _smtp.Port = emailSenderPort;

                    //Set SSL --> True / False  
                    _smtp.EnableSsl = emailIsSSL;

                    //Set Sender UserEmailID, Password  
                    NetworkCredential _network = new NetworkCredential(emailSender, emailSenderPassword);
                    _smtp.Credentials = _network;

                    //Send Method will send your MailMessage create above.  
                    _smtp.Send(_mailmsg);


                    /*for mail NEW END*/

                }
                
            }


            //check if a group is closed due to not enough buyers and update T_prod database in quantity2 and send mail to all users that they will not receive the product.
           
            for (int q = 0; q < tmp3.Count; q++)
            {
                if (countMailsSent == totalOrders)
                {
                    break;
                }
                if (Pid == tmp3[q].pid && (string)Session["noBuyers"]=="yes" )
                {
                   
                    countMailsSent++;
                    

                    string UserMail = tmp3[q].Email;
                    /*for mail NEW*/
                    string emailSender = "grouptelgroup@gmail.com".ToString();
                    string emailSenderPassword = "bjzcnmarlpsqrtfs".ToString();
                    string emailSenderHost = "smtp.gmail.com".ToString();
                    int emailSenderPort = Convert.ToInt16("587");
                    Boolean emailIsSSL = Convert.ToBoolean(ConfigurationManager.AppSettings["IsSSL"]);


                    string FilePath = @"H:\האחסון שלי\גרסה סופית לפרויקט- עדיין צריך לעשות דף מוצר\GroupTelFV\GroupTelFV\EmailTemplates\orderCancelNoBuyers.html";
                    StreamReader str = new StreamReader(FilePath);
                    string MailText = str.ReadToEnd();
                    str.Close();
                    MailText = MailText.Replace("[newusername]", UserMail);
                    MailText = MailText.Replace("[Pname]", (string)Session["Pname"]);
                    MailText = MailText.Replace("[Price]", (string)Session["Price"]);
                    string img = @"H:\האחסון שלי\גרסה סופית לפרויקט- עדיין צריך לעשות דף מוצר\GroupTelFV\GroupTelFV\" + (string)Session["Ppic"];
                    MailText = MailText.Replace("[Pdisc]", (string)Session["Pdisc"]);
                    MailText = MailText.Replace("[Pfineprint]", (string)Session["Pfineprint"]);
                    string subject = "ביטול קבוצת רכישה עקב מחסור ברוכשים";
                    //Base class for sending email  
                    MailMessage _mailmsg = new MailMessage();

                    //Make TRUE because our body text is html  
                    _mailmsg.IsBodyHtml = true;

                    //Set From Email ID  
                    _mailmsg.From = new MailAddress(emailSender);

                    //Set To Email ID  
                    _mailmsg.To.Add(UserMail);

                    //Set Subject  
                    _mailmsg.Subject = subject;

                    //Set Body Text of Email   
                    _mailmsg.Body = MailText;
                    //for image
                    AlternateView imgview = AlternateView.CreateAlternateViewFromString(_mailmsg.Body /*+ @"<img src= cid:imgpath height=150 width=150> "*/, null, "text/html");
                    LinkedResource lr = new LinkedResource(img);
                    lr.ContentId = "imgpath";
                    imgview.LinkedResources.Add(lr);
                    _mailmsg.AlternateViews.Add(imgview);


                    //Now set your SMTP   
                    SmtpClient _smtp = new SmtpClient();

                    //Set HOST server SMTP detail  
                    _smtp.Host = emailSenderHost;

                    //Set PORT number of SMTP  
                    _smtp.Port = emailSenderPort;

                    //Set SSL --> True / False  
                    _smtp.EnableSsl = emailIsSSL;

                    //Set Sender UserEmailID, Password  
                    NetworkCredential _network = new NetworkCredential(emailSender, emailSenderPassword);
                    _smtp.Credentials = _network;

                    //Send Method will send your MailMessage create above.  
                    _smtp.Send(_mailmsg);


                    /*for mail NEW END*/

                }

            }

        }

        protected void searchBtn_Click(object sender, EventArgs e)
        {
            Session["results"] = searchBox.Text;
            Response.Redirect("results.aspx");
        }
    }
}