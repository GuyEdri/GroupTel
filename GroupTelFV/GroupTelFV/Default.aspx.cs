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
using System.Threading.Tasks;
using System.Threading;


namespace GroupTelFV
{
    public  partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            //list of products from the global file
            List<ProdList> LstProd = (List<ProdList>)Application["LstProd"];
            //hotel list
            List<ProdList> hotels = new List<ProdList>();
            //electronics list
            List<ProdList> Electronics = new List<ProdList>();
            //furniture list
            List<ProdList> Furniture = new List<ProdList>();
            //list of orders from the global file
            List<OrderList> Lstorder = (List<OrderList>)Application["Lstorder"];
            int i;
            // a loop to run on the database and insert results to repeater. 
            for (i = 0; i < LstProd.Count; i++)
            {


                if (LstProd[i].Cid == 1 && LstProd[i].Pquantity2 ==0 )


                {


                    //a loop that checks if there are already 4 items in the specific list and if so, continues to next itteration. this is for better page vissibility and coherence. 
                   
                    //hotel products repeater
                    if (hotels.Count > 3)
                        continue;
                    ProdList p1 = new ProdList() { Pdisc = LstProd[i].Pdisc, PfinePrint = LstProd[i].PfinePrint, Pname = LstProd[i].Pname, Ppic = LstProd[i].Ppic, Pquantity = LstProd[i].Pquantity, Price = LstProd[i].Price, Cid = LstProd[i].Cid, Pid = LstProd[i].Pid, menuCat = LstProd[i].menuCat, EndDate = LstProd[i].EndDate, Pquantity2= LstProd[1].Pquantity2 };
                    hotels.Add(p1);
                  


                }
                //electronics products repeater
                else if (LstProd[i].Cid == 2 && LstProd[i].Pquantity2 == 0 )
                {
                    if (Electronics.Count > 3)
                        continue;
                    ProdList p2 = new ProdList() { Pdisc = LstProd[i].Pdisc, PfinePrint = LstProd[i].PfinePrint, Pname = LstProd[i].Pname, Ppic = LstProd[i].Ppic, Pquantity = LstProd[i].Pquantity, Price = LstProd[i].Price, Cid = LstProd[i].Cid, Pid = LstProd[i].Pid, EndDate = LstProd[i].EndDate };
                    Electronics.Add(p2);


                }
                //furnitures products repeater
                else if (LstProd[i].Cid == 3 && LstProd[i].Pquantity2 == 0 )
                {
                    if (Furniture.Count > 3)
                        continue;
                    ProdList p3 = new ProdList() { Pdisc = LstProd[i].Pdisc, PfinePrint = LstProd[i].PfinePrint, Pname = LstProd[i].Pname, Ppic = LstProd[i].Ppic, Pquantity = LstProd[i].Pquantity, Price = LstProd[i].Price, Cid = LstProd[i].Cid, Pid = LstProd[i].Pid, EndDate = LstProd[i].EndDate };
                    Furniture.Add(p3);
                }
                

            }
            //binding the results to the products list according to category
            DataList1.DataSource = hotels;
            DataList1.DataBind();
            DataList2.DataSource = Electronics;
            DataList2.DataBind();
            DataList3.DataSource = Furniture;
            DataList3.DataBind();


            //2 strings of email addresses to send Emails for closed groups. 
            //addresses of closed group due to purchase of all products
            string addresses = null;
            //addresses of closed group due to time finished on product without buying all products
            string addresses1 = null;
            //check if a group is closed and if so, check the type of closed (due to purchase of all product (first if) or due to the fact that the timer 
            //has counted down to 0 and not all product were purchased (second if)

            for (int j = 0; j < Lstorder.Count; j++)
            {
                //first if
                if(Lstorder[j].Pquantity2 == 1)
                {
                    string Sql6 = $"Update  T_Prod Set Pquantity2 = REPLACE( Pquantity2, 1, 3) WHERE Pid = {Lstorder[j].pid}";
                    string Connstr6 = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|GroupTelDBNEW.mdf; Integrated Security=True;Connect Timeout=30";

                    SqlConnection Conn6 = new SqlConnection(Connstr6);
                    Conn6.Open();
                    SqlCommand Cmd6 = new SqlCommand(Sql6, Conn6);
                    Cmd6.ExecuteNonQuery();

                    Conn6.Close();
                    string Sql7 = $"Update  T_order Set Pquantity2 = REPLACE( Pquantity2, 1, 3) WHERE Pid = {Lstorder[j].pid}";
                    string Connstr7 = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|GroupTelDBNEW.mdf; Integrated Security=True;Connect Timeout=30";

                    SqlConnection Conn7 = new SqlConnection(Connstr7);
                    Conn7.Open();
                    SqlCommand Cmd7 = new SqlCommand(Sql7, Conn7);
                    Cmd7.ExecuteNonQuery();

                    Conn7.Close();
                    Session["Pname"] = Lstorder[j].Pname;
                    Session["Price"] = Lstorder[j].Price;
                    Session["Ppic"] = Lstorder[j].Ppic;
                   
                        addresses += Lstorder[j].Email + ',';

                    


                }
                //second if
                else if(Lstorder[j].Pquantity2 == 2)
                {
                    string Sql6 = $"Update  T_Prod Set Pquantity2 = REPLACE( Pquantity2, 2, 4) WHERE Pid = {Lstorder[j].pid}";
                    string Connstr6 = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|GroupTelDBNEW.mdf; Integrated Security=True;Connect Timeout=30";

                    SqlConnection Conn6 = new SqlConnection(Connstr6);
                    Conn6.Open();
                    SqlCommand Cmd6 = new SqlCommand(Sql6, Conn6);
                    Cmd6.ExecuteNonQuery();

                    Conn6.Close();
                    string Sql7 = $"Update  T_order Set Pquantity2 = REPLACE( Pquantity2, 2, 4) WHERE Pid = {Lstorder[j].pid}";
                    string Connstr7 = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|GroupTelDBNEW.mdf; Integrated Security=True;Connect Timeout=30";

                    SqlConnection Conn7 = new SqlConnection(Connstr7);
                    Conn7.Open();
                    SqlCommand Cmd7 = new SqlCommand(Sql7, Conn7);
                    Cmd7.ExecuteNonQuery();

                    Conn7.Close();
                    addresses1 += Lstorder[j].Email + ',';
                    Session["Pname"] = Lstorder[j].Pname;
                    Session["Price"] = Lstorder[j].Price;
                    Session["Ppic"] = Lstorder[j].Ppic;
                   
                  
                    

                }
            }
            //check if string addresses1 is null or not and if not, send mails to users about group closed due to non sufficient purchases 
            //before timer is done.
            if(addresses1 != null)
            {
                //send a cancellation mail to user due to not enough buyers
                string emailSender = "grouptelgroup@gmail.com".ToString();
                string emailSenderPassword = "bjzcnmarlpsqrtfs".ToString();
                string emailSenderHost = "smtp.gmail.com".ToString();
                int emailSenderPort = Convert.ToInt16("587");
                Boolean emailIsSSL = Convert.ToBoolean(ConfigurationManager.AppSettings["IsSSL"]);


                string FilePath = @"H:\האחסון שלי\גרסה סופית לפרויקט- עדיין צריך לעשות דף מוצר\GroupTelFV\GroupTelFV\EmailTemplates\orderCancelNoBuyers.html";
                StreamReader str = new StreamReader(FilePath);
                string MailText = str.ReadToEnd();
                str.Close();
                MailText = MailText.Replace("[Pname]", (string)Session["Pname"]);
                MailText = MailText.Replace("[Price]", (string)Session["Price"]);
                string img = @"H:\האחסון שלי\גרסה סופית לפרויקט- עדיין צריך לעשות דף מוצר\GroupTelFV\GroupTelFV\" + (string)Session["Ppic"];
                string subject = "ביטול קבוצת רכישה עקב מחסור ברוכשים";
                //Base class for sending email  
                MailMessage _mailmsg = new MailMessage();

                //Make TRUE because our body text is html  
                _mailmsg.IsBodyHtml = true;

                //Set From Email ID  
                _mailmsg.From = new MailAddress(emailSender);

                //Set To Email ID  
                _mailmsg.To.Add(emailSender);
                string[] splitAddresses = addresses1.Split(',');
                //send blind carbon copies to all users (making it impossible for them to see the other users which will recieve the mail
                foreach (var address in splitAddresses)
                {
                    if (address == "")
                        break;
                    else
                        _mailmsg.Bcc.Add(address);
                }
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

            //check if string addresses1 is null or not and if not, send mails to users about group closed due to all products
            //purchased.
            if (addresses != null)
            {
                /*for mail NEW*/
                //send confirmation mail that the group is closed and buyer will receive product
                string emailSender1 = "grouptelgroup@gmail.com".ToString();
                string emailSenderPassword1 = "bjzcnmarlpsqrtfs".ToString();
                string emailSenderHost1 = "smtp.gmail.com".ToString();
                int emailSenderPort1 = Convert.ToInt16("587");
                Boolean emailIsSSL1 = Convert.ToBoolean(ConfigurationManager.AppSettings["IsSSL"]);


                string FilePath1 = @"H:\האחסון שלי\גרסה סופית לפרויקט- עדיין צריך לעשות דף מוצר\GroupTelFV\GroupTelFV\EmailTemplates\GroupClosed.html";
                StreamReader str1 = new StreamReader(FilePath1);
                string MailText1 = str1.ReadToEnd();
                str1.Close();
                MailText1 = MailText1.Replace("[Pname]", (string)Session["Pname"]);
                MailText1 = MailText1.Replace("[Price]", (string)Session["Price"]);
                string img1 = @"H:\האחסון שלי\גרסה סופית לפרויקט- עדיין צריך לעשות דף מוצר\GroupTelFV\GroupTelFV\" + (string)Session["Ppic"];
                string subject1 = "הקבוצה נסגרה! ברכות על רכישתכם";
                //Base class for sending email  
                MailMessage _mailmsg1 = new MailMessage();

                //Make TRUE because our body text is html  
                _mailmsg1.IsBodyHtml = true;

                //Set From Email ID  
                _mailmsg1.From = new MailAddress(emailSender1);
                string[] splitAddresses1 = addresses.Split(',');
                //Set To Email ID  
                _mailmsg1.To.Add(emailSender1);
                //send blind carbon copies to all users (making it impossible for them to see the other users which will recieve the mail
                foreach (var address1 in splitAddresses1)
                {
                    if (address1 == "")
                        break;
                    else
                        _mailmsg1.Bcc.Add(address1);
                }

                //Set Subject  
                _mailmsg1.Subject = subject1;

                //Set Body Text of Email   
                _mailmsg1.Body = MailText1;
                //for image
                AlternateView imgview1 = AlternateView.CreateAlternateViewFromString(_mailmsg1.Body /*+ @"<img src= cid:imgpath height=150 width=150> "*/, null, "text/html");
                LinkedResource lr1 = new LinkedResource(img1);
                lr1.ContentId = "imgpath1";
                imgview1.LinkedResources.Add(lr1);
                _mailmsg1.AlternateViews.Add(imgview1);


                //Now set your SMTP   
                SmtpClient _smtp1 = new SmtpClient();

                //Set HOST server SMTP detail  
                _smtp1.Host = emailSenderHost1;

                //Set PORT number of SMTP  
                _smtp1.Port = emailSenderPort1;

                //Set SSL --> True / False  
                _smtp1.EnableSsl = emailIsSSL1;

                //Set Sender UserEmailID, Password  
                NetworkCredential _network1 = new NetworkCredential(emailSender1, emailSenderPassword1);
                _smtp1.Credentials = _network1;

                //Send Method will send your MailMessage create above.  
                _smtp1.Send(_mailmsg1);


                /*for mail NEW END*/
            }




        }
    }
}